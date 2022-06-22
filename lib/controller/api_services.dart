import 'package:http/http.dart' as http;

class ApiServices {
  //singin function
  Future<http.Response> onLogin(String email, String pass) async {
    Map data = {'email': email, 'password': pass};
    return await http.post(
      Uri.parse('http://saswes.com/api/org_login'),
      body: data,
    );
  }

  Future<http.Response> postQrScanId(String userId, String companyID) async {
    final data = {
      "qr_code": userId,
      "org_id": companyID,
    };
    return await http.post(
      Uri.parse('http://saswes.com/api/insert'),
      body: data,
    );
  }
}
