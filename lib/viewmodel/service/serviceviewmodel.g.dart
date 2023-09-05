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

  late final _$whoWeAreResponseAtom =
      Atom(name: '_ServiceViewModel.whoWeAreResponse', context: context);

  @override
  WhoWeAreResponse get whoWeAreResponse {
    _$whoWeAreResponseAtom.reportRead();
    return super.whoWeAreResponse;
  }

  @override
  set whoWeAreResponse(WhoWeAreResponse value) {
    _$whoWeAreResponseAtom.reportWrite(value, super.whoWeAreResponse, () {
      super.whoWeAreResponse = value;
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

  late final _$careersResponseAtom =
      Atom(name: '_ServiceViewModel.careersResponse', context: context);

  @override
  CareersResponse? get careersResponse {
    _$careersResponseAtom.reportRead();
    return super.careersResponse;
  }

  @override
  set careersResponse(CareersResponse? value) {
    _$careersResponseAtom.reportWrite(value, super.careersResponse, () {
      super.careersResponse = value;
    });
  }

  late final _$pressResponseAtom =
      Atom(name: '_ServiceViewModel.pressResponse', context: context);

  @override
  PressResponse? get pressResponse {
    _$pressResponseAtom.reportRead();
    return super.pressResponse;
  }

  @override
  set pressResponse(PressResponse? value) {
    _$pressResponseAtom.reportWrite(value, super.pressResponse, () {
      super.pressResponse = value;
    });
  }

  late final _$blogsResponseAtom =
      Atom(name: '_ServiceViewModel.blogsResponse', context: context);

  @override
  BlogsResponse? get blogsResponse {
    _$blogsResponseAtom.reportRead();
    return super.blogsResponse;
  }

  @override
  set blogsResponse(BlogsResponse? value) {
    _$blogsResponseAtom.reportWrite(value, super.blogsResponse, () {
      super.blogsResponse = value;
    });
  }

  @override
  String toString() {
    return '''
isloading: ${isloading},
whoWeAreResponse: ${whoWeAreResponse},
serviceResponse: ${serviceResponse},
careersResponse: ${careersResponse},
pressResponse: ${pressResponse},
blogsResponse: ${blogsResponse}
    ''';
  }
}
