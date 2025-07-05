import 'package:data_json_serializable/data_json_serializable.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'maya_api_repository.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class MayaApiRepository {
  factory MayaApiRepository(final Dio dio, {final String baseUrl}) =
      _MayaApiRepository;

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

  @POST('/posts')
  @Headers(<String, String>{
    'Accept': '*/*',
    'Connection': 'keep-alive',
  })
  Future<void> sendMoney({
    @Field('amount') required final double amount,
    @Field('recipient') required final String recipient,
  });

  @POST('/users')
  Future<void> logout();
}
