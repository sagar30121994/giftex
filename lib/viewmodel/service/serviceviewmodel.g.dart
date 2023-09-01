// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serviceviewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ServiceViewModel on _ServiceViewModel, Store {
  late final _$isloadingAtom =
      Atom(name: '_ServiceViewModel.isloading', context: context);

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

  late final _$serviceResponseAtom =
      Atom(name: '_ServiceViewModel.serviceResponse', context: context);

  @override
  ServiceResponse? get serviceResponse {
    _$serviceResponseAtom.reportRead();
    return super.serviceResponse;
  }

  @override
  set serviceResponse(ServiceResponse? value) {
    _$serviceResponseAtom.reportWrite(value, super.serviceResponse, () {
      super.serviceResponse = value;
    });
  }

  @override
  String toString() {
    return '''
isloading: ${isloading},
serviceResponse: ${serviceResponse}
    ''';
  }
}
