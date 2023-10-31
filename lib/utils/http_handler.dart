import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:project_structure/config/api_url.dart';

import 'app_preferences.dart';
class HttpHandler {
  static String statPointUrl = ApiUrl.baseUrl;
  static Future<Map<String, String>> getHeaders() async {
     String? token = AppPreferences.getToken() ;
    if (token != null) {
      debugPrint("Token:------ -- '$token'");
      return {
        'Authorization': 'Bearer $token',
      };
    } else {
      return {};
    }
  }
  static Future<http.Response> getHttpMethod({@required String? url, headers}) async {
    var header = await getHeaders();
    debugPrint("Get Url -- '$statPointUrl$url'");
    debugPrint("Get Header -- '$header'");
    http.Response response = await http.get(
      Uri.parse("$statPointUrl$url"),
      headers: headers ?? header,
    );
    debugPrint("Get Response Code -- '${response.statusCode}'");
    debugPrint("Get Response -- '${response.body}'");
    if (response.statusCode == 200 ) {
      debugPrint("In Get '${response.statusCode}'");
      return response;
    }
    else if (response.statusCode == 401) {
      debugPrint("In Get '${response.statusCode}'");
      return response;
    }
    else {
      debugPrint("In Get 'else - ${response.statusCode}'");
      return response;
    }
  }
  static Future<http.Response> postHttpMethod({@required String? url, Map<String, dynamic>? data}) async {
    var header = await getHeaders();
    debugPrint("Post URL -- '$statPointUrl$url'");
    debugPrint("Header -- $header");

    http.Response response = await http.post(
      Uri.parse("$statPointUrl$url"),
       headers: header,
      body: data,
    );

    debugPrint("Post Response Code -- '${response.statusCode}'");
    debugPrint("Post Response -- '${response.body}'");
    if (response.statusCode == 200 ) {
      debugPrint("In post '${response.statusCode}'");
      return response;
    }
    else if (response.statusCode == 401) {
      debugPrint("In post '${response.statusCode}'");
      return response;
    }
    else {
      debugPrint("In post - ${response.statusCode}'");
      return response;
    }
  }
  static Future<http.Response> multiPathHttpMethod({@required String? url, required Map<String, String> data,String? imageKey , String? imagePath}) async {
    var header = await getHeaders();
    debugPrint("Post URL -- '$statPointUrl$url'");
    debugPrint("Header -- $header");

    var request = http.MultipartRequest('POST', Uri.parse("$statPointUrl$url"));
    request.fields.addAll(data);
    if(imagePath!=null && imageKey != null){
      request.files.add(await http.MultipartFile.fromPath(imageKey,imagePath ));
    }
    request.headers.addAll(header);

    http.StreamedResponse streamedResponse = await request.send();
    http.Response response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200 ) {
      debugPrint("In post '${response.statusCode}'");
      return response;
    }
    else if (response.statusCode == 401) {
      debugPrint("In post '${response.statusCode}'");
      return response;
    }
    else {
      debugPrint("In post - ${response.statusCode}'");
      return response;
    }
  }
  static Future<http.Response> deleteHttpMethod({@required String? url}) async {
    var header = await getHeaders();
    debugPrint("Delete URL -- '$statPointUrl$url'");
    debugPrint("Delete Header -- '$header'");
    http.Response response = await http.delete(
      Uri.parse("$statPointUrl$url"),
      headers: header,
    );
    debugPrint("Delete Response Code -- '${response.statusCode}'");
    debugPrint("Delete Response -- '${response.body}'");
    if (response.statusCode == 200) {
      debugPrint("In Delete '${response.statusCode}'");
      return response;
    }
    else if (response.statusCode == 401) {
      debugPrint("In Get '${response.statusCode}'");
      return response;
    }
    else {
      debugPrint("In Delete 'else - ${response.statusCode}'");
      return response;
    }
  }
}
