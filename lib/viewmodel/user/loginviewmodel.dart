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
  LoginRepo? orderRepo;
  LoginViewModelErrorState loginViewModelErrorState =
  LoginViewModelErrorState();
 late LocalSharedPrefrence localSharedPrefrence;

  _LoginViewModel() {
    orderRepo = LoginRepo();
    localSharedPrefrence=LocalSharedPrefrence();
  }

  @observable
  bool isLoading = false;

  @observable
  LoginResponse? loginResponse;

  @observable
  String email = '';

  @observable
  String pass = '';

  List<ReactionDisposer>? _disposers;

  @action
  setEmail(String value) {
    email = value;
  }

  @action
  setPass(String value) {
    pass = value;
  }

  @action
  void setupValidations() {
    _disposers = [
      reaction((_) => email, validateEmail),
      reaction((_) => pass, validatePassowrd),
    ];
  }

  @action
  void disposeValidations() {
    _disposers!.clear();
  }

  @action
  validateEmail(String email) {
    if (isEmail(email)) {
      loginViewModelErrorState.email = null;
    } else {
      loginViewModelErrorState.email = 'Enter A Valid Mail';
    }
  }

  @action
  validatePassowrd(String pass) {
    if (pass.length >= 6) {
      loginViewModelErrorState.pass = null;
    } else {
      loginViewModelErrorState.pass = 'Enter At-lest 6 digits';
    }
  }

  Future<HttpResponse> getLogin() async {
    isLoading = true;
    String role="warehouseadmin";
    HttpResponse httpResponse =
    await orderRepo!.login(LoginReqestModel(
      email: email,
      password: pass
    ));

    if(httpResponse.status==200) {
      loginResponse = httpResponse.data;
      localSharedPrefrence
          .setLoginStatus(true);
      // await localSharedPrefrence.setToken(loginResponse!.!);
      await localSharedPrefrence.setUserId(int.parse(loginResponse!.result!.userid!));
      //await localSharedPrefrence.setRole(loginResponse!.user!.role!);
    }
    isLoading = false;
    return httpResponse;
  }

  Future<void> logout() async{
    USERToken = "";
    await localSharedPrefrence.setLoginStatus(false);
    name = "";
    userId = 0;
  }
}

class LoginViewModelErrorState = _LoginViewModelErrorState
    with _$LoginViewModelErrorState;

abstract class _LoginViewModelErrorState with Store {
  @observable
  String? email;

  @observable
  String? pass;

  @computed
  bool get hasErrors => email != null || pass != null;
}
