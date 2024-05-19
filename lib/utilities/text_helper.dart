import 'package:application/controllers/core.dart';

extension N on String {
  String shorten(int length) {
    if (this.length <= length) {
      return this;
    }
    return substring(0, length) + '...';
  }
  String makeLink() {
    // if not start with http
    if (!this.startsWith('http') && !this.startsWith('https')) {
      // return the base url
      String serverUrl = Core().BASE_URL.toString();
      print(serverUrl);
      return Core().BASE_URL.toString().replaceAll("api/v1", "")+this;

    }
    return this;
  }
}
