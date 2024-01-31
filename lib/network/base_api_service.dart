
typedef PostBody = Map<String, dynamic>;

abstract class BaseApiService {
  Future<dynamic> getResponse(Uri uri);
}