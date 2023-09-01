import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/data/network/models/httpreponsehandler.dart';
import 'package:giftex/data/network/models/responce/service/serviceresponse.dart';
import 'package:giftex/data/network/repository/service/servicerepo.dart';
import 'package:mobx/mobx.dart';

part 'serviceviewmodel.g.dart';

class ServiceViewModel = _ServiceViewModel with _$ServiceViewModel;

abstract class _ServiceViewModel with Store {
  ServiceRepo serviceRepo = ServiceRepo();

  late LocalSharedPrefrence prefrence;
  _ServiceViewModel() {
    prefrence = LocalSharedPrefrence();
  }

  @observable
  bool isloading = false;

  @observable
  ServiceResponse? serviceResponse;

  Future<HttpResponse> getServices(String type) async {
    isloading = true;

    HttpResponse httpResponse = await serviceRepo!.getServiceDetails(type);

    if (httpResponse.status == 200) {
      serviceResponse = httpResponse.data;
    }
    isloading = false;
    return httpResponse;
  }
}
