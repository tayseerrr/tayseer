import 'package:application/controllers/location.dart';
import 'package:get_storage/get_storage.dart';

class Initializer {
  Initializer._();

  static final Initializer _initializer = Initializer._();

  static Initializer get instance => _initializer;

  Future<void> init() async {
    await GetStorage.init();
    await LocationController.instance.init();
  }
}
