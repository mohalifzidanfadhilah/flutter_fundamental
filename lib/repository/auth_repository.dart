import "dart:convert";

import "package:dio/dio.dart";

class AuthRepository {
  static Future<dynamic> login(String url, String email) async{
    FormData formData = FormData.fromMap({
      "email": email,
    });
    Dio dio = Dio();
    final response = await dio.post(url, data: formData);

    if (response.statusCode == 200){
      return jsonDecode(response.data);
    }else{
      return jsonDecode(response.data);
    }
  }
  
  static Future<dynamic> daftar(
    String url, 
    String email, 
    String nama, 
    String phone
    ) async {
    FormData formData = FormData.fromMap({
      "email": email,
      "nama_lengkap": nama,
      "phone": phone,
    });
    Dio dio = Dio();
    final response = await dio.post(url, data: formData);

    if (response.statusCode == 200) {
      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }  
}