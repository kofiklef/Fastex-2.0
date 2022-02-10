import 'package:fastex/src/features/Cart/models/productModel.dart';
import 'package:http/http.dart' as http;

class FastexAPI {
  var authority = "ktuapi.bsmtsports.com";

  // Future<http.Response> fetchFoods() async {
  //   var authority = "https://fastexapi.azurewebsites.net";
  //   final url = Uri.http(authority, "/api/Products/GetAllProducts");
  //   final response = await http.get(url);
  //   return http.get(Uri.parse("https://fastexapi.azurewebsites.net/api/Products/GetAllProducts"));
  // }

  Future<List<Product>> fetchFoods() async {
    final url = Uri.http(authority, "/api/Products/GetAllProducts");
    final response = await http.get(url);
    return productFromJson(response.body);
  }
}
