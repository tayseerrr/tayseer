import 'package:get_storage/get_storage.dart';

class NavigationController {
  static final NavigationController _instance =
      NavigationController._privateConstructor();

  NavigationController._privateConstructor();

  static NavigationController get instance => _instance;

  Future<String> firstRoute() async {
    GetStorage box = GetStorage();
    // return '/home';
    if (box.read('first_time') == null || box.read('first_time') == false) {
      box.write('first_time', true);
      return '/onboarding';
    }
    if (box.read('access') != null && box.read('refresh') != null) {
      String accountType = await box.read('account_type');
      if (accountType == 'student') {
        return '/home';
      } else if (accountType == 'admission') {
        return '/admission';
      } else if (accountType == 'supplier') {
        return '/suppliers';
      }
    }
    return '/login';
  }
}
