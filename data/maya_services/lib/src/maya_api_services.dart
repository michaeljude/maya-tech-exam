import 'package:data_json_serializable/data_json_serializable.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'maya_api_services.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class MayaApiServices {
  factory MayaApiServices(Dio dio, {String baseUrl}) = _MayaApiServices;

  @POST("/users")
  Future<List<AuthenticationDto>> login();

  @POST("/users") 
  Future<void> logout();
}
