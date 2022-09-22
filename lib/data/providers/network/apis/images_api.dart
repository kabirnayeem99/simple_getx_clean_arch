import '../api_endpoint.dart';
import '../api_provider.dart';
import '../api_request_representable.dart';

class PhotosApi extends APIRequestRepresentable {
  @override
  get body => null;

  PhotosApi._();

  PhotosApi.getPhotos() : this._();

  @override
  String get endpoint => APIEndpoint.placeholderApi;

  @override
  HTTPMethod get method => HTTPMethod.get;

  @override
  String get path => "/photos";

  @override
  Map<String, String>? get query => {};

  @override
  Future request() => APIProvider.instance.request(this);

  @override
  String get url => endpoint + path;

  @override
  Map<String, String>? get headers => {};
}
