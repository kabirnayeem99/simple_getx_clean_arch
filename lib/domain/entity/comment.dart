class Comment {
  int id;
  String comment;
  bool isLiked;
  int likeCount;


  Comment({
    required this.id,
    required this.comment,
    required this.isLiked,
    required this.likeCount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Comment &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          comment == other.comment &&
          isLiked == other.isLiked &&
          likeCount == other.likeCount);

  @override
  int get hashCode =>
      id.hashCode ^ comment.hashCode ^ isLiked.hashCode ^ likeCount.hashCode;

  @override
  String toString() {
    return 'Comment{ id: $id, comment: $comment, isLiked: $isLiked, likeCount: $likeCount,}';
  }

  Comment copyWith({
    int? id,
    String? comment,
    bool? isLiked,
    int? likeCount,
  }) {
    return Comment(
      id: id ?? this.id,
      comment: comment ?? this.comment,
      isLiked: isLiked ?? this.isLiked,
      likeCount: likeCount ?? this.likeCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'comment': comment,
      'isLiked': isLiked,
      'likeCount': likeCount,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id'] as int,
      comment: map['comment'] as String,
      isLiked: map['isLiked'] as bool,
      likeCount: map['likeCount'] as int,
    );
  }

}
