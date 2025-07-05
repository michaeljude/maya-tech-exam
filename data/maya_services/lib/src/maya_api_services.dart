import 'package:data_json_serializable/data_json_serializable.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'maya_api_services.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class MayaApiServices {
  factory MayaApiServices(final Dio dio, {final String baseUrl}) =
      _MayaApiServices;

  @POST('/users')
  Future<void> signIn({
    @Field('email') required final String email,
    @Field('password') required final String password,
  });

  @GET('/users')
  @Headers(<String, String>{
    'Accept': '*/*',
    'Accept-Encoding': 'gzip, deflate, br',
    'Connection': 'keep-alive',
  })
  Future<List<AuthenticationDto>> getUsers();

  @POST('/users')
  Future<void> logout();
}
