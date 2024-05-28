//importando o pacote http
import 'package:http/http.dart' as http;
import 'package:flutter_webapi_first_course/services/http_interceptors.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

class JournalService{
  static const String url = "http://192.168.0.29:3000/";
  static const String resource = "learnhttp/";

  http.Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  //método que concatena as strings
  String getUrl(){
    return "$url$resource";
  }

  //método para registrar na API
  register(String content){
    client.post(Uri.parse(getUrl()), body:{
      "content": content
    });
  }

  //método de retorno
  Future<String> get() async {
    http.Response response = await client.get(Uri.parse(getUrl()));
    return response.body;
  }
}