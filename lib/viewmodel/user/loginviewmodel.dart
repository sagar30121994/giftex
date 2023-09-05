import 'package:giftex/data/network/models/responce/termsresponse.dart';
import 'package:giftex/data/network/models/responce/user/signupres.dart';
import 'package:giftex/data/network/models/responce/user/verifyemailresponse.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

import '../../data/local/client/localprefsmodel.dart';
import '../../data/local/client/prefs.dart';
import '../../data/network/models/httpreponsehandler.dart';
import '../../data/network/models/request/webapimodel/userloginrequestmodel.dart';
import '../../data/network/models/responce/user/loginrespose.dart';
import '../../data/network/repository/user/loginrepo.dart';

part 'loginviewmodel.g.dart';

class LoginViewModel = _LoginViewModel with _$LoginViewModel;

abstract class _LoginViewModel with Store {
  LoginRepo? loginRepo;
  LoginViewModelErrorState loginViewModelErrorState = LoginViewModelErrorState();

  LoginViewModelMobileErrorState loginViewModelMobileErrorState = LoginViewModelMobileErrorState();

  Login1ViewModelErrorState login1ViewModelErrorState = Login1ViewModelErrorState();
  late LocalSharedPrefrence localSharedPrefrence;

  _LoginViewModel() {
    loginRepo = LoginRepo();
    localSharedPrefrence = LocalSharedPrefrence();
  }

  @observable
  bool isLoading = false;

  @observable
  LoginResponse? loginResponse;

  @observable
  SignUpResponse? signUpResponse;

  @observable
  String email = '';

  @observable
  String pass = '';

  @observable
  String name = '';

  @observable
  String otp = '';

  @observable
  String mobile = '';

  @observable
  bool isemail = false;

  @observable
  bool ismobile = false;

  @observable
  VerifyEmailResponse? verifyEmailResponse;

  @observable
  VerifyEmailResponse? verifyMobileResponse;

  @observable
  TermsAndConditionsResponse? termsAndConditionsResponse;

  List<ReactionDisposer>? _disposers;

  @action
  setEmail(String value) {
    email = value;
  }

  @action
  setName(String value) {
    name = value;
  }

  @action
  setPass(String value) {
    pass = value;
  }

  @action
  setMobile(String value) {
    mobile = value;
  }

  @action
  void setupValidations() {
    _disposers = [
      reaction((_) => email, validateEmail),
      reaction((_) => pass, validatePassowrd),
      reaction((_) => mobile, validateMobile),
      reaction((_) => name, validateName),
    ];
  }

  @action
  void disposeValidations() {
    _disposers!.clear();
  }

  @action
  validateMobile(String email) {
    if (isNumeric(email) && email.length == 10) {
      loginViewModelMobileErrorState.mobile = null;
      login1ViewModelErrorState.mobile = null;
    } else {
      loginViewModelMobileErrorState.mobile = 'Enter A Valid Mobile Number';
      login1ViewModelErrorState.mobile = 'Enter A Valid Mobile Number';
    }
  }

  @action
  validateName(String email) {
    if (email.length > 3) {
      login1ViewModelErrorState.name = null;
    } else {
      login1ViewModelErrorState.name = 'Enter A Valid Name';
      // loginViewModelMobileErrorState.mobile = 'Enter A Valid Mobile Number';
    }
  }

  @action
  validateEmail(String email) {
    if (isEmail(email)) {
      loginViewModelErrorState.email = null;
      login1ViewModelErrorState.email = null;
    } else {
      loginViewModelErrorState.email = 'Enter A Valid Mail';
      login1ViewModelErrorState.email = 'Enter A Valid Mail';
    }
  }

  @action
  validatePassowrd(String pass) {
    if (pass.length >= 6) {
      loginViewModelErrorState.pass = null;
      login1ViewModelErrorState.pass = null;
    } else {
      loginViewModelErrorState.pass = 'Enter At-lest 6 digits';
      login1ViewModelErrorState.pass = 'Enter At-lest 6 digits';
    }
  }

  Future<HttpResponse> getLogin() async {
    isLoading = true;

    HttpResponse httpResponse = await loginRepo!.login(LoginReqestModel(
      email: email,
      password: pass,
      mobile: mobile,
      countryCode: "91",
    ));

    if (httpResponse.status == 200) {
      loginResponse = httpResponse.data;
      // localSharedPrefrence
      //     .setLoginStatus(true);
      // await localSharedPrefrence.setToken(loginResponse!.!);
      await localSharedPrefrence.setUserId(loginResponse!.result!.userid!);
      //await localSharedPrefrence.setRole(loginResponse!.user!.role!);
    }
    isLoading = false;
    return httpResponse;
  }

  Future<HttpResponse> verifyEmail() async {
    isLoading = true;

    HttpResponse httpResponse = await loginRepo!.verifyEmail(email, name, "");

    if (httpResponse.status == 200) {
      verifyEmailResponse = httpResponse.data;
    }
    isLoading = false;
    return httpResponse;
  }

  Future<HttpResponse> verifyMobile() async {
    isLoading = true;

    HttpResponse httpResponse = await loginRepo!.verifyMobile(mobile, name, "");

    if (httpResponse.status == 200) {
      verifyMobileResponse = httpResponse.data;
    }
    isLoading = false;
    return httpResponse;
  }

  Future<HttpResponse> termsAndConditions() async {
    isLoading = true;

    HttpResponse httpResponse = await loginRepo!.termsAndCondiations();

    if (httpResponse.status == 200) {
      termsAndConditionsResponse = httpResponse.data;
    }
    isLoading = false;
    return httpResponse;
  }

  Future<HttpResponse> getLoginWithMobile() async {
    isLoading = true;

    HttpResponse httpResponse = await loginRepo!.loginMobile(LoginReqestModel(
        countryCode: "91",
        mobile: mobile,
        authkeyMobile: "",
        authkeyWeb: "",
        deviceCode: "",
        email: "",
        fcmTockenMobile: "",
        fcmTockenWebsite: "",
        loginFrom: "Website",
        password: "",
        userid: ""));

    if (httpResponse.status == 200) {
      loginResponse = httpResponse.data;
      // localSharedPrefrence
      //     .setLoginStatus(true);
      // await localSharedPrefrence.setToken(loginResponse!.!);
      await localSharedPrefrence.setUserId(loginResponse!.result!.userid!);
      await localSharedPrefrence.setCrmClinetId(loginResponse!.result!.cRMClientID!);
      //await localSharedPrefrence.setRole(loginResponse!.user!.role!);
    }
    isLoading = false;
    return httpResponse;
  }

  Future<HttpResponse> gesignUp() async {
    isLoading = true;

    HttpResponse httpResponse = await loginRepo!.signUp(mobile, name, email, pass);

    if (httpResponse.status == 200) {
      signUpResponse = httpResponse.data;
      localSharedPrefrence.setLoginStatus(true);
      // await localSharedPrefrence.setToken(loginResponse!.!);
      // await localSharedPrefrence.setUserId(loginResponse!.result!.userid!);
      await localSharedPrefrence.setCrmClinetId(signUpResponse!.clientID!);
      // await localSharedPrefrence.setAuthKeyWeb(signUpResponse!.authkeyWeb!);
      //await localSharedPrefrence.setRole(loginResponse!.user!.role!);
    }
    isLoading = false;
    return httpResponse;
  }

  Future<HttpResponse> getLoginWithEmailPass() async {
    isLoading = true;

    HttpResponse httpResponse = await loginRepo!.loginMobile(LoginReqestModel(
        countryCode: "",
        mobile: "",
        authkeyMobile: "",
        authkeyWeb: "",
        deviceCode: "",
        email: email,
        fcmTockenMobile: "",
        fcmTockenWebsite: "",
        loginFrom: "Website",
        password: pass,
        userid: ""));

    if (httpResponse.status == 200) {
      loginResponse = httpResponse.data;
      // localSharedPrefrence
      //     .setLoginStatus(true);
      // await localSharedPrefrence.setToken(loginResponse!.!);
      await localSharedPrefrence.setUserId(loginResponse!.result!.userid!);
      await localSharedPrefrence.setLoginStatus(true);
      await localSharedPrefrence.setCrmClinetId(loginResponse!.result!.cRMClientID!);
      await localSharedPrefrence.setAuthKeyWeb(loginResponse!.result!.authkeyWeb!);

      //await localSharedPrefrence.setRole(loginResponse!.user!.role!);
    }
    isLoading = false;
    return httpResponse;
  }

  Future<HttpResponse> getLoginWithOTPConfirm() async {
    isLoading = true;
    String? userId = localSharedPrefrence!.getUserId();

    HttpResponse httpResponse = await loginRepo!.loginMobileConfirm(LoginReqestModel(
        countryCode: "91",
        mobile: mobile,
        authkeyMobile: "",
        authkeyWeb: "",
        deviceCode: "",
        email: "",
        otp: otp,
        fcmTockenMobile: "",
        fcmTockenWebsite: "",
        loginFrom: "Website",
        password: "",
        userid: userId));

    if (httpResponse.status == 200) {
      loginResponse = httpResponse.data;
      if (loginResponse!.status == "true") {
        localSharedPrefrence.setLoginStatus(true);
        // await localSharedPrefrence.setToken(loginResponse!.!);
        await localSharedPrefrence.setUserId(loginResponse!.result!.userid!);
        // await localSharedPrefrence.setLoginStatus(true);
        await localSharedPrefrence.setAuthKeyWeb(loginResponse!.result!.authkeyWeb!);
      }

      //await localSharedPrefrence.setRole(loginResponse!.user!.role!);
    }
    isLoading = false;
    return httpResponse;
  }

  Future<void> logout() async {
    USERToken = "";
    await localSharedPrefrence.setLoginStatus(false);
    name = "";
    userId = 0;
  }
}

class LoginViewModelErrorState = _LoginViewModelErrorState with _$LoginViewModelErrorState;

abstract class _LoginViewModelErrorState with Store {
  @observable
  String? email;

  // @observable
  // String? mobile;
  //
  // @observable
  // String? mobile;

  @observable
  String? pass;

  @computed
  bool get hasErrors => email != null || pass != null;
}

class LoginViewModelMobileErrorState = _LoginViewModelMobileErrorState with _$LoginViewModelMobileErrorState;

abstract class _LoginViewModelMobileErrorState with Store {
  @observable
  String? mobile;

  @computed
  bool get hasErrors => mobile != null;
}

class Login1ViewModelErrorState = _Login1ViewModelErrorState with _$Login1ViewModelErrorState;

abstract class _Login1ViewModelErrorState with Store {
  @observable
  String? email;

  @observable
  String? name;

  @observable
  String? mobile;

  @observable
  String? pass;

  @computed
  bool get hasErrors => email != null || pass != null || name != null || mobile != null;
}
