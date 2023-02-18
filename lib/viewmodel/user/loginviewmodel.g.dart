// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginviewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginViewModel on _LoginViewModel, Store {
  final _$isLoadingAtom = Atom(name: '_LoginViewModel.isLoading');

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

  final _$loginResponseAtom = Atom(name: '_LoginViewModel.loginResponse');

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

  final _$emailAtom = Atom(name: '_LoginViewModel.email');

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

  final _$passAtom = Atom(name: '_LoginViewModel.pass');

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

  final _$_LoginViewModelActionController =
      ActionController(name: '_LoginViewModel');

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
pass: ${pass}
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

  final _$emailAtom = Atom(name: '_LoginViewModelErrorState.email');

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

  final _$passAtom = Atom(name: '_LoginViewModelErrorState.pass');

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
