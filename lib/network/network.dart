const url = "http://localhost/sridafi";

class NetworkURL {
  static String login(){
    return "$url/api/login.php";
  }
  static String registrasi() {
    return "$url/api/registrasi.php";
  }
  static String getProduk() {
    return "$url/api/get_produk.php";
  }
 }