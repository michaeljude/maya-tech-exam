import 'package:dio/dio.dart';
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

  @POST('/users')
  Future<void> logout();
}
