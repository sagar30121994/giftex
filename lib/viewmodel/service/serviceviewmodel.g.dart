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

  late final _$insertCareerFormResponseAtom = Atom(
      name: '_ServiceViewModel.insertCareerFormResponse', context: context);

  @override
  InsertCareerFormResponse? get insertCareerFormResponse {
    _$insertCareerFormResponseAtom.reportRead();
    return super.insertCareerFormResponse;
  }

  @override
  set insertCareerFormResponse(InsertCareerFormResponse? value) {
    _$insertCareerFormResponseAtom
        .reportWrite(value, super.insertCareerFormResponse, () {
      super.insertCareerFormResponse = value;
    });
  }

  late final _$insertReachUsFormResponseAtom = Atom(
      name: '_ServiceViewModel.insertReachUsFormResponse', context: context);

  @override
  InsertReachUsFormResponse? get insertReachUsFormResponse {
    _$insertReachUsFormResponseAtom.reportRead();
    return super.insertReachUsFormResponse;
  }

  @override
  set insertReachUsFormResponse(InsertReachUsFormResponse? value) {
    _$insertReachUsFormResponseAtom
        .reportWrite(value, super.insertReachUsFormResponse, () {
      super.insertReachUsFormResponse = value;
    });
  }

  late final _$fullnameAtom =
      Atom(name: '_ServiceViewModel.fullname', context: context);

  @override
  String get fullname {
    _$fullnameAtom.reportRead();
    return super.fullname;
  }

  @override
  set fullname(String value) {
    _$fullnameAtom.reportWrite(value, super.fullname, () {
      super.fullname = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_ServiceViewModel.email', context: context);

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

  late final _$mobileAtom =
      Atom(name: '_ServiceViewModel.mobile', context: context);

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

  late final _$resumeAtom =
      Atom(name: '_ServiceViewModel.resume', context: context);

  @override
  String get resume {
    _$resumeAtom.reportRead();
    return super.resume;
  }

  @override
  set resume(String value) {
    _$resumeAtom.reportWrite(value, super.resume, () {
      super.resume = value;
    });
  }

  late final _$queryAtom =
      Atom(name: '_ServiceViewModel.query', context: context);

  @override
  String get query {
    _$queryAtom.reportRead();
    return super.query;
  }

  @override
  set query(String value) {
    _$queryAtom.reportWrite(value, super.query, () {
      super.query = value;
    });
  }

  late final _$homeNewsVideosBlogsResponseAtom = Atom(
      name: '_ServiceViewModel.homeNewsVideosBlogsResponse', context: context);

  @override
  HomeNewsVideosBlogsResponse? get homeNewsVideosBlogsResponse {
    _$homeNewsVideosBlogsResponseAtom.reportRead();
    return super.homeNewsVideosBlogsResponse;
  }

  @override
  set homeNewsVideosBlogsResponse(HomeNewsVideosBlogsResponse? value) {
    _$homeNewsVideosBlogsResponseAtom
        .reportWrite(value, super.homeNewsVideosBlogsResponse, () {
      super.homeNewsVideosBlogsResponse = value;
    });
  }

  late final _$_ServiceViewModelActionController =
      ActionController(name: '_ServiceViewModel', context: context);

  @override
  dynamic setFullName(String value) {
    final _$actionInfo = _$_ServiceViewModelActionController.startAction(
        name: '_ServiceViewModel.setFullName');
    try {
      return super.setFullName(value);
    } finally {
      _$_ServiceViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_ServiceViewModelActionController.startAction(
        name: '_ServiceViewModel.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_ServiceViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMobile(String value) {
    final _$actionInfo = _$_ServiceViewModelActionController.startAction(
        name: '_ServiceViewModel.setMobile');
    try {
      return super.setMobile(value);
    } finally {
      _$_ServiceViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setResume(String value) {
    final _$actionInfo = _$_ServiceViewModelActionController.startAction(
        name: '_ServiceViewModel.setResume');
    try {
      return super.setResume(value);
    } finally {
      _$_ServiceViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQuery(String value) {
    final _$actionInfo = _$_ServiceViewModelActionController.startAction(
        name: '_ServiceViewModel.setQuery');
    try {
      return super.setQuery(value);
    } finally {
      _$_ServiceViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isloading: ${isloading},
whoWeAreResponse: ${whoWeAreResponse},
serviceResponse: ${serviceResponse},
careersResponse: ${careersResponse},
pressResponse: ${pressResponse},
blogsResponse: ${blogsResponse},
insertCareerFormResponse: ${insertCareerFormResponse},
insertReachUsFormResponse: ${insertReachUsFormResponse},
fullname: ${fullname},
email: ${email},
mobile: ${mobile},
resume: ${resume},
query: ${query},
homeNewsVideosBlogsResponse: ${homeNewsVideosBlogsResponse}
    ''';
  }
}
