import '../api_endpoint.dart';
import '../api_provider.dart';
import '../api_request_representable.dart';

class PostsApi extends APIRequestRepresentable {
  @override
  get body => null;

  PostsApi._();

  PostsApi.getPosts() : this._();

  @override
  String get endpoint => APIEndpoint.placeholderApi;

  @override
  HTTPMethod get method => HTTPMethod.get;

  @override
  String get path => "/posts";

  @override
  Map<String, String>? get query => {};

  @override
  Future request() => APIProvider.instance.request(this);

  @override
  String get url => endpoint + path;

  @override
  Map<String, String>? get headers => {};
}
