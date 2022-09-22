import 'dart:math';

import 'package:simple_getx_clean_arch/data/datasources/mock_image_data_source.dart';
import 'package:simple_getx_clean_arch/domain/entity/post.dart';

class PhotoItemDto {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  PhotoItemDto(
      {this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  PhotoItemDto.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['albumId'] = albumId;
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['thumbnailUrl'] = thumbnailUrl;
    return data;
  }
}

extension PhotoItemDtoParsing on PhotoItemDto {
  Post mapToPost({int index = 0}) {
    return Post(
        id: (id ?? 0) + index,
        title: title ?? "",
        body: "",
        thumbnail: MockImageDataSource.mockImage(),
        type: PostType.image,
        likeCount: Random().nextInt(53),
        commentCount: Random().nextInt(12),
        isLiked: Random().nextBool(),
        comments: List.empty());
  }
}
