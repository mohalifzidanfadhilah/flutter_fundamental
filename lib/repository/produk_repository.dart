import "dart:convert";

import "package:dio/dio.dart";

class ProdukRepository {
  static Future<dynamic> getProduk(String url, int offset, int limit) async {
    Dio dio = Dio();
    FormData data = FormData.fromMap({
      "offset" : offset,
      "limit" : limit,
    });
    final response = await dio.post(url, data: data);

    if (response.statusCode == 200) {
      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }
}
