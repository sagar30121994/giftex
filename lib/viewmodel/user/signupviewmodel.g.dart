// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signupviewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewModel on _LoginViewModel, Store {
  late final _$isLoadingAtom =
      Atom(name: '_LoginViewModel.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$loginResponseAtom =
      Atom(name: '_LoginViewModel.loginResponse', context: context);

  @override
  LoginResponse? get loginResponse {
    _$loginResponseAtom.reportRead();
    return super.loginResponse;
  }

  @override
  set loginResponse(LoginResponse? value) {
    _$loginResponseAtom.reportWrite(value, super.loginResponse, () {
      super.loginResponse = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_LoginViewModel.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passAtom = Atom(name: '_LoginViewModel.pass', context: context);

  @override
  String get pass {
    _$passAtom.reportRead();
    return super.pass;
  }

  @override
  set pass(String value) {
    _$passAtom.reportWrite(value, super.pass, () {
      super.pass = value;
    });
  }

  late final _$otpAtom = Atom(name: '_LoginViewModel.otp', context: context);

  @override
  String get otp {
    _$otpAtom.reportRead();
    return super.otp;
  }

  @override
  set otp(String value) {
    _$otpAtom.reportWrite(value, super.otp, () {
      super.otp = value;
    });
  }

  late final _$mobileAtom =
      Atom(name: '_LoginViewModel.mobile', context: context);

  @override
  String get mobile {
    _$mobileAtom.reportRead();
    return super.mobile;
  }

  @override
  set mobile(String value) {
    _$mobileAtom.reportWrite(value, super.mobile, () {
      super.mobile = value;
    });
  }

  late final _$isemailAtom =
      Atom(name: '_LoginViewModel.isemail', context: context);

  @override
  bool get isemail {
    _$isemailAtom.reportRead();
    return super.isemail;
  }

  @override
  set isemail(bool value) {
    _$isemailAtom.reportWrite(value, super.isemail, () {
      super.isemail = value;
    });
  }

  late final _$ismobileAtom =
      Atom(name: '_LoginViewModel.ismobile', context: context);

  @override
  bool get ismobile {
    _$ismobileAtom.reportRead();
    return super.ismobile;
  }

  @override
  set ismobile(bool value) {
    _$ismobileAtom.reportWrite(value, super.ismobile, () {
      super.ismobile = value;
    });
  }

  late final _$verifyEmailResponseAtom =
      Atom(name: '_LoginViewModel.verifyEmailResponse', context: context);

  @override
  VerifyEmailResponse? get verifyEmailResponse {
    _$verifyEmailResponseAtom.reportRead();
    return super.verifyEmailResponse;
  }

  @override
  set verifyEmailResponse(VerifyEmailResponse? value) {
    _$verifyEmailResponseAtom.reportWrite(value, super.verifyEmailResponse, () {
      super.verifyEmailResponse = value;
    });
  }

  late final _$verifyMobileResponseAtom =
      Atom(name: '_LoginViewModel.verifyMobileResponse', context: context);

  @override
  VerifyEmailResponse? get verifyMobileResponse {
    _$verifyMobileResponseAtom.reportRead();
    return super.verifyMobileResponse;
  }

  @override
  set verifyMobileResponse(VerifyEmailResponse? value) {
    _$verifyMobileResponseAtom.reportWrite(value, super.verifyMobileResponse,
        () {
      super.verifyMobileResponse = value;
    });
  }

  late final _$_LoginViewModelActionController =
      ActionController(name: '_LoginViewModel', context: context);

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_LoginViewModelActionController.startAction(
        name: '_LoginViewModel.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPass(String value) {
    final _$actionInfo = _$_LoginViewModelActionController.startAction(
        name: '_LoginViewModel.setPass');
    try {
      return super.setPass(value);
    } finally {
      _$_LoginViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMobile(String value) {
    final _$actionInfo = _$_LoginViewModelActionController.startAction(
        name: '_LoginViewModel.setMobile');
    try {
      return super.setMobile(value);
    } finally {
      _$_LoginViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setupValidations() {
    final _$actionInfo = _$_LoginViewModelActionController.startAction(
        name: '_LoginViewModel.setupValidations');
    try {
      return super.setupValidations();
    } finally {
      _$_LoginViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void disposeValidations() {
    final _$actionInfo = _$_LoginViewModelActionController.startAction(
        name: '_LoginViewModel.disposeValidations');
    try {
      return super.disposeValidations();
    } finally {
      _$_LoginViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateMobile(String email) {
    final _$actionInfo = _$_LoginViewModelActionController.startAction(
        name: '_LoginViewModel.validateMobile');
    try {
      return super.validateMobile(email);
    } finally {
      _$_LoginViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateEmail(String email) {
    final _$actionInfo = _$_LoginViewModelActionController.startAction(
        name: '_LoginViewModel.validateEmail');
    try {
      return super.validateEmail(email);
    } finally {
      _$_LoginViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validatePassowrd(String pass) {
    final _$actionInfo = _$_LoginViewModelActionController.startAction(
        name: '_LoginViewModel.validatePassowrd');
    try {
      return super.validatePassowrd(pass);
    } finally {
      _$_LoginViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
loginResponse: ${loginResponse},
email: ${email},
pass: ${pass},
otp: ${otp},
mobile: ${mobile},
isemail: ${isemail},
ismobile: ${ismobile},
verifyEmailResponse: ${verifyEmailResponse},
verifyMobileResponse: ${verifyMobileResponse}
    ''';
  }
}

mixin _$LoginViewModelErrorState on _LoginViewModelErrorState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_LoginViewModelErrorState.hasErrors'))
          .value;

  late final _$emailAtom =
      Atom(name: '_LoginViewModelErrorState.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passAtom =
      Atom(name: '_LoginViewModelErrorState.pass', context: context);

  @override
  String? get pass {
    _$passAtom.reportRead();
    return super.pass;
  }

  @override
  set pass(String? value) {
    _$passAtom.reportWrite(value, super.pass, () {
      super.pass = value;
    });
  }

  @override
  String toString() {
    return '''
email: ${email},
pass: ${pass},
hasErrors: ${hasErrors}
    ''';
  }
}

mixin _$LoginViewModelMobileErrorState
    on _LoginViewModelMobileErrorState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_LoginViewModelMobileErrorState.hasErrors'))
          .value;

  late final _$mobileAtom =
      Atom(name: '_LoginViewModelMobileErrorState.mobile', context: context);

  @override
  String? get mobile {
    _$mobileAtom.reportRead();
    return super.mobile;
  }

  @override
  set mobile(String? value) {
    _$mobileAtom.reportWrite(value, super.mobile, () {
      super.mobile = value;
    });
  }

  @override
  String toString() {
    return '''
mobile: ${mobile},
hasErrors: ${hasErrors}
    ''';
  }
}
