// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileviewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileViewModel on _ProfileViewModel, Store {
  late final _$isloadingAtom =
      Atom(name: '_ProfileViewModel.isloading', context: context);

  @override
  bool get isloading {
    _$isloadingAtom.reportRead();
    return super.isloading;
  }

  @override
  set isloading(bool value) {
    _$isloadingAtom.reportWrite(value, super.isloading, () {
      super.isloading = value;
    });
  }

  late final _$getUserAllDetailsResponseAtom = Atom(
      name: '_ProfileViewModel.getUserAllDetailsResponse', context: context);

  @override
  GetUserAllDetailsResponse? get getUserAllDetailsResponse {
    _$getUserAllDetailsResponseAtom.reportRead();
    return super.getUserAllDetailsResponse;
  }

  @override
  set getUserAllDetailsResponse(GetUserAllDetailsResponse? value) {
    _$getUserAllDetailsResponseAtom
        .reportWrite(value, super.getUserAllDetailsResponse, () {
      super.getUserAllDetailsResponse = value;
    });
  }

  @override
  String toString() {
    return '''
isloading: ${isloading},
getUserAllDetailsResponse: ${getUserAllDetailsResponse}
    ''';
  }
}
