import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/data/network/models/httpreponsehandler.dart';
import 'package:giftex/data/network/models/responce/cmsweb/careersresponse.dart';
import 'package:giftex/data/network/models/responce/cmsweb/whoweare.dart';
import 'package:giftex/data/network/models/responce/service/serviceresponse.dart';
import 'package:giftex/data/network/repository/service/servicerepo.dart';
import 'package:giftex/data/network/repository/webcmsapimodel/webcmsapimodelrepo.dart';
import 'package:mobx/mobx.dart';

part 'serviceviewmodel.g.dart';

class ServiceViewModel = _ServiceViewModel with _$ServiceViewModel;

abstract class _ServiceViewModel with Store {
  ServiceRepo serviceRepo = ServiceRepo();
  WebCmsApiModelRepo webCmsApiModelRepo = WebCmsApiModelRepo();

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

  Future<HttpResponse> getWhoWeAre() async {
    isloading = true;

    HttpResponse httpResponse = await webCmsApiModelRepo.getWhoWeAre();

    if (httpResponse.status == 200) {
      whoWeAreResponse = httpResponse.data;
    }
    isloading = false;
    return httpResponse;
  }
}
