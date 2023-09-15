import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/data/network/models/httpreponsehandler.dart';
import 'package:giftex/data/network/models/responce/cmsweb/careersresponse.dart';
import 'package:giftex/data/network/models/responce/cmsweb/insertCareerFormResponse.dart';
import 'package:giftex/data/network/models/responce/cmsweb/whoweare.dart';
import 'package:giftex/data/network/models/responce/contactusform/insertreachusformresponse.dart';
import 'package:giftex/data/network/models/responce/home/newsblogsvideoresponse.dart';
import 'package:giftex/data/network/models/responce/news/blogsresponse.dart' as blogs;
import 'package:giftex/data/network/models/responce/news/blogsresponse.dart';
import 'package:giftex/data/network/models/responce/news/newsreponse.dart' as news;
import 'package:giftex/data/network/models/responce/service/serviceresponse.dart';
import 'package:giftex/data/network/repository/service/servicerepo.dart';
import 'package:giftex/data/network/repository/webapimodel/webapimodelrepo.dart';
import 'package:giftex/data/network/repository/webcmsapimodel/webcmsapimodelrepo.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'serviceviewmodel.g.dart';

class ServiceViewModel = _ServiceViewModel with _$ServiceViewModel;

abstract class _ServiceViewModel with Store {
  ServiceRepo serviceRepo = ServiceRepo();
  WebCmsApiModelRepo webCmsApiModelRepo = WebCmsApiModelRepo();
  WebapimodelRepo webapimodelRepo = WebapimodelRepo();

  late LocalSharedPrefrence prefrence;

  _ServiceViewModel() {
    prefrence = LocalSharedPrefrence();
  }

  ServiceViewModelErrorState serviceViewModelErrorState = ServiceViewModelErrorState();

  @observable
  bool isloading = false;

  @observable
  news.Array? newsArry;

  @observable
  blogs.BlogArray? blogsArray;

  @observable
  WhoWeAreResponse whoWeAreResponse = WhoWeAreResponse();

  @observable
  ServiceResponse? serviceResponse;

  @observable
  CareersResponse? careersResponse;

  @observable
  news.PressResponse? pressResponse;

  @observable
  BlogsResponse? blogsResponse;

  @observable
  InsertCareerFormResponse? insertCareerFormResponse;

  @observable
  InsertReachUsFormResponse? insertReachUsFormResponse;

  @observable
  String fullname = '';

  @observable
  String email = '';

  @observable
  String mobile = '';

  @observable
  String career_fullname = '';

  @observable
  String career_email = '';

  @observable
  String career_mobile = '';

  @observable
  String resume = '';

  @observable
  String query = '';

  @action
  setFullName(String value) {
    fullname = value;
  }

  @action
  setEmail(String value) {
    email = value;
  }

  @action
  setMobile(String value) {
    mobile = value;
  }

  @action
  setCareerFullName(String value) {
    career_fullname = value;
  }

  @action
  setCareerEmail(String value) {
    career_email = value;
  }

  @action
  setCareerMobile(String value) {
    career_mobile = value;
  }

  @action
  setResume(String value) {
    resume = value;
  }

  @action
  setQuery(String value) {
    query = value;
  }
  ServiceViewModelCareerErrorState serviceViewModelCareerErrorState=ServiceViewModelCareerErrorState();

  late List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => fullname, validateName),
      reaction((_) => email, validateEmail),
      reaction((_) => mobile, validateMobile),
      reaction((_) => query, validateQuery),
    ];
  }

  void setupValidationsCareer() {
    _disposers = [
      reaction((_) => career_fullname, validatecareer_Name),
      reaction((_) =>  career_email, validatecareer_Email),
      reaction((_) =>  career_mobile, validatecareer_Mobile),

    ];
  }

  @action
  validateAll() {
    validateName(fullname);
    validateEmail(email);
    validateMobile(mobile);
    validateQuery(query);
  }

  @action
  validateAllCareer() {
    validatecareer_Name(career_fullname);
    validatecareer_Email(career_email);
    validatecareer_Mobile(career_mobile);

  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  @action
  void validateName(String? value) {
    if (value == null || value.trim() == "") {
      serviceViewModelErrorState.fullname = "Please Enter Valid Name";
    } else {
      serviceViewModelErrorState.fullname = null;
    }
  }

  @action
  void validateEmail(String? value) {
    if (isEmail(value??'')) {
      serviceViewModelErrorState.email = null;
    } else {
      serviceViewModelErrorState.email = "Please Enter Valid Email";
    }
  }

  @action
  void validateMobile(String? value) {
    if (isNumeric(value??"")&&((value??"").length==10)) {
      serviceViewModelErrorState.mobile = null;
    } else {
      serviceViewModelErrorState.mobile = "Please Enter Valid Mobile Number";
    }
  }

  @action
  void validatecareer_Name(String? value) {
    if (value == null || value.trim() == "") {
      serviceViewModelCareerErrorState.fullname = "Please Enter Valid Name";
    } else {
      serviceViewModelCareerErrorState.fullname = null;
    }
  }

  @action
  void validatecareer_Email(String? value) {
    if (isEmail(value??'')) {
      serviceViewModelCareerErrorState.email = null;
    } else {
      serviceViewModelCareerErrorState.email = "Please Enter Valid Email";
    }
  }

  @action
  void validatecareer_Mobile(String? value) {
    if (isNumeric(value??"")&&((value??"").length==10)) {
      serviceViewModelCareerErrorState.mobile = null;
    } else {
      serviceViewModelCareerErrorState.mobile = "Please Enter Valid Mobile Number";
    }
  }

  @action
  void validateQuery(String? value) {
    if (value == null || value.trim() == "") {
      serviceViewModelErrorState.query = "Please Enter Valid Query";
    } else {
      serviceViewModelErrorState.query = null;
    }
  }

  Future<HttpResponse> getServices(String type) async {
    isloading = true;
    serviceResponse = null;
    HttpResponse httpResponse = await serviceRepo.getServiceDetails(type);

    if (httpResponse.status == 200) {
      serviceResponse = httpResponse.data;
    }
    isloading = false;
    return httpResponse;
  }

  Future<HttpResponse> getCareeres() async {
    isloading = true;

    HttpResponse httpResponse = await webCmsApiModelRepo.getCareers();

    if (httpResponse.status == 200) {
      careersResponse = httpResponse.data;
    }
    isloading = false;
    return httpResponse;
  }

  Future<HttpResponse> insertCareerForm() async {
    isloading = true;
    HttpResponse httpResponse = await webCmsApiModelRepo.insertCareerForm(career_fullname, career_email, career_mobile, resume);
    if (httpResponse.status == 200) {
      insertCareerFormResponse = httpResponse.data;
    }
    isloading = false;
    return httpResponse;
  }

  Future<HttpResponse> InsertReachUsForm() async {
    isloading = true;
    HttpResponse httpResponse = await webapimodelRepo.InsertReachUsForm(fullname, email, mobile, query);
    if (httpResponse.status == 200) {
      insertReachUsFormResponse = httpResponse.data;
    }
    isloading = false;
    return httpResponse;
  }

  Future<HttpResponse> getWhoWeAre() async {
    isloading = true;

    HttpResponse httpResponse = await webCmsApiModelRepo.getWhoWeAre();

    if (httpResponse.status == 200) {
      whoWeAreResponse = httpResponse.data;
    }
    isloading = false;
    return httpResponse;
  }

  Future<HttpResponse> getNews() async {
    isloading = true;

    HttpResponse httpResponse = await webCmsApiModelRepo.getNews();

    if (httpResponse.status == 200) {
      pressResponse = httpResponse.data;
    }
    isloading = false;
    return httpResponse;
  }

  Future<HttpResponse> getBlogs() async {
    isloading = true;

    HttpResponse httpResponse = await webCmsApiModelRepo.getBlogs();

    if (httpResponse.status == 200) {
      blogsResponse = httpResponse.data;
    }
    isloading = false;
    return httpResponse;
  }

  @observable
  HomeNewsVideosBlogsResponse? homeNewsVideosBlogsResponse = HomeNewsVideosBlogsResponse();
  Future<HttpResponse> getVideos() async {
    isloading = true;

    HttpResponse httpResponse = await webCmsApiModelRepo!.getNewsVideos();

    if (httpResponse.status == 200) {
      homeNewsVideosBlogsResponse = httpResponse.data;
    }
    isloading = false;
    return httpResponse;
  }

  @observable
  news.PressResponse? pressDetailsResponse = news.PressResponse();
  Future<HttpResponse> getpressDetails(String pageID) async {
    isloading = true;
    pressDetailsResponse = null;
    HttpResponse httpResponse = await webCmsApiModelRepo!.getpressDetails(pageID);
    if (httpResponse.status == 200) {
      pressDetailsResponse = httpResponse.data;
    }
    isloading = false;
    return httpResponse;
  }

  @observable
  news.PressResponse? blogDetailsResponse = news.PressResponse();
  Future<HttpResponse> getblogsDetails(String pageID) async {
    isloading = true;
    blogDetailsResponse = null;
    HttpResponse httpResponse = await webCmsApiModelRepo!.getblogsDetails(pageID);

    if (httpResponse.status == 200) {
      blogDetailsResponse = httpResponse.data;
    }
    isloading = false;
    return httpResponse;
  }
}

class ServiceViewModelErrorState = _ServiceViewModelErrorState with _$ServiceViewModelErrorState;

abstract class _ServiceViewModelErrorState with Store {
  @observable
  String? fullname;

  @observable
  String? email;

  @observable
  String? mobile;

  @observable
  String? query;

  @computed
  bool get hasErrors => fullname != null || email != null || mobile != null || query != null;
}


class ServiceViewModelCareerErrorState = _ServiceViewModelCareerErrorState with _$ServiceViewModelCareerErrorState;

abstract class _ServiceViewModelCareerErrorState with Store {
  @observable
  String? fullname;

  @observable
  String? email;

  @observable
  String? mobile;


  @computed
  bool get hasErrors => fullname != null || email != null || mobile != null ;
}
