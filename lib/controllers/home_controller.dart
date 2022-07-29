import 'package:get/get.dart';

import '../model/data_array_item_model.dart';
import '../model/response_model.dart';
import '../network/client.dart';

class HomeController extends GetxController {
  Rx<ResponseModel> responseModel = ResponseModel().obs;
  RxBool apiCallStatus = true.obs;

  RxList<DataArrayItem> dataList =
      List<DataArrayItem>.empty(growable: true).obs;

  getData() async {
    apiCallStatus.value = true;

    final response = await RestApiClient.shared.getData();

    if (response != null) {
      responseModel.value = response;
      apiCallStatus.value = false;
    }
  }

  // getArrayList() {
  //   if((responseModel?.value?.data ?? []).isN)
  // }
}
