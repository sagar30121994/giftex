// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'footerviewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FooterViewModel on _FooterViewModel, Store {
  late final _$emailAtom =
      Atom(name: '_FooterViewModel.email', context: context);

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

  late final _$nameAtom = Atom(name: '_FooterViewModel.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$isLoadingForUpCommingAuctionAtom = Atom(
      name: '_FooterViewModel.isLoadingForUpCommingAuction', context: context);

  @override
  bool get isLoadingForUpCommingAuction {
    _$isLoadingForUpCommingAuctionAtom.reportRead();
    return super.isLoadingForUpCommingAuction;
  }

  @override
  set isLoadingForUpCommingAuction(bool value) {
    _$isLoadingForUpCommingAuctionAtom
        .reportWrite(value, super.isLoadingForUpCommingAuction, () {
      super.isLoadingForUpCommingAuction = value;
    });
  }

  late final _$insertsubscribeFormAsyncAction =
      AsyncAction('_FooterViewModel.insertsubscribeForm', context: context);

  @override
  Future<HttpResponse> insertsubscribeForm() {
    return _$insertsubscribeFormAsyncAction
        .run(() => super.insertsubscribeForm());
  }

  late final _$_FooterViewModelActionController =
      ActionController(name: '_FooterViewModel', context: context);

  @override
  void setupValidations() {
    final _$actionInfo = _$_FooterViewModelActionController.startAction(
        name: '_FooterViewModel.setupValidations');
    try {
      return super.setupValidations();
    } finally {
      _$_FooterViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateEmail(String? email) {
    final _$actionInfo = _$_FooterViewModelActionController.startAction(
        name: '_FooterViewModel.validateEmail');
    try {
      return super.validateEmail(email);
    } finally {
      _$_FooterViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validatePassowrd(String? pass) {
    final _$actionInfo = _$_FooterViewModelActionController.startAction(
        name: '_FooterViewModel.validatePassowrd');
    try {
      return super.validatePassowrd(pass);
    } finally {
      _$_FooterViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
name: ${name},
isLoadingForUpCommingAuction: ${isLoadingForUpCommingAuction}
    ''';
  }
}

mixin _$SubscribeViewModelErrorState on _SubscribeViewModelErrorState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_SubscribeViewModelErrorState.hasErrors'))
          .value;

  late final _$emailAtom =
      Atom(name: '_SubscribeViewModelErrorState.email', context: context);

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

  late final _$nameAtom =
      Atom(name: '_SubscribeViewModelErrorState.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  @override
  String toString() {
    return '''
email: ${email},
name: ${name},
hasErrors: ${hasErrors}
    ''';
  }
}
