import 'package:application/controllers/authentication.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Core {
  get BASE_URL {
    if(GetPlatform.isAndroid) {
      return 'http://10.0.2.2:8000/api/v1';
    }
    return 'http://127.0.0.1:8000/api/v1';
  }


  // get BASE_URL => 'http://127.0.0.1:8000/api/v1';

  Future<Map<String, String>> headers() async {
    String accessToken = await GetStorage().read('access');

    var status = await AuthenticationController.instance.verify();
    if (!status) {
      status = await AuthenticationController.instance.refresh();
      if (!status) {
        return {};
      } else {
        accessToken = await GetStorage().read('access');
      }
    }
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
  }
}
