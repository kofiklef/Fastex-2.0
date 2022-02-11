import 'package:fastex/src/features/Authentication/data/models/authModels.dart';
import 'package:fastex/src/features/Cart/models/productModel.dart';
import 'package:http/http.dart' as http;

class FastexAPI {
  var authority = "fastexapi.azurewebsites.net";

  Future<List<Product>> fetchFoods() async {
    final url = Uri.https(authority, "/api/Products/GetAllProducts");
    final response = await http.get(url);
    return productFromJson(response.body);
  }

  Future register(String email, String password) async {
    final url = Uri.http(authority, "/api/Users/AddUser");
    final response = await http.post(url);
    return authServiceFromJson(response.body);
  }

  Future login(String email, String password) async {
    final url = Uri.http(authority, "/api/Users/AddUser", {"email" : email});
    final response = await http.post(url);
    return authServiceFromJson(response.body);
  }
}
