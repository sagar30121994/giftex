import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/data/network/models/httpreponsehandler.dart';
import 'package:giftex/data/network/models/responce/cmsweb/careersresponse.dart';
import 'package:giftex/data/network/models/responce/cmsweb/insertCareerFormResponse.dart';
import 'package:giftex/data/network/models/responce/cmsweb/whoweare.dart';
import 'package:giftex/data/network/models/responce/contactusform/insertreachusformresponse.dart';
import 'package:giftex/data/network/models/responce/home/newsblogsvideoresponse.dart';
import 'package:giftex/data/network/models/responce/news/blogsresponse.dart';
import 'package:giftex/data/network/models/responce/news/newsreponse.dart';
import 'package:giftex/data/network/models/responce/service/serviceresponse.dart';
import 'package:giftex/data/network/repository/service/servicerepo.dart';
import 'package:giftex/data/network/repository/webapimodel/webapimodelrepo.dart';
import 'package:giftex/data/network/repository/webcmsapimodel/webcmsapimodelrepo.dart';
import 'package:mobx/mobx.dart';

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

  @observable
  bool isloading = false;

  @observable
  WhoWeAreResponse whoWeAreResponse = WhoWeAreResponse();

  @observable
  ServiceResponse? serviceResponse;

  @observable
  CareersResponse? careersResponse;

  @observable
  PressResponse? pressResponse;

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
  setResume(String value) {
    resume = value;
  }

  @action
  setQuery(String value) {
    query = value;
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
    HttpResponse httpResponse = await webCmsApiModelRepo.insertCareerForm(fullname, email, mobile, resume);
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
}
