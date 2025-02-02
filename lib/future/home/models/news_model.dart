import 'package:b2b_app/future/home/models/media.dart';

class NewsModel {
  int? id;
  String? title;
  String? description;
  String? likesCount;
  String? commentsCount;
  String? viewsCount;
  String? repostsCount;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? imageUrl;
  String? createdAtFormatted;
  List<String>? imagesUrl;
  String? sourceName;
  bool? isAuthLike;
  bool? isAuthRepost;
  String? activeTitle;
  int? active;
  List<Media>? media;

  NewsModel(
      {this.id,
      this.title,
      this.description,
      this.likesCount,
      this.commentsCount,
      this.viewsCount,
      this.repostsCount,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.imageUrl,
      this.createdAtFormatted,
      this.imagesUrl,
      this.sourceName,
      this.isAuthLike,
      this.isAuthRepost,
      this.activeTitle,
      this.active,
      this.media});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    likesCount = json['likes_count'];
    commentsCount = json['comments_count'];
    viewsCount = json['views_count'];
    repostsCount = json['reposts_count'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    imageUrl = json['image_url'];
    createdAtFormatted = json['created_at_formatted'];
    imagesUrl = json['images_url'].cast<String>();
    sourceName = json['source_name'];
    isAuthLike = json['is_auth_like'];
    isAuthRepost = json['is_auth_repost'];
    activeTitle = json['active_title'];
    active = json['active'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['likes_count'] = this.likesCount;
    data['comments_count'] = this.commentsCount;
    data['views_count'] = this.viewsCount;
    data['reposts_count'] = this.repostsCount;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['image_url'] = this.imageUrl;
    data['created_at_formatted'] = this.createdAtFormatted;
    data['images_url'] = this.imagesUrl;
    data['source_name'] = this.sourceName;
    data['is_auth_like'] = this.isAuthLike;
    data['is_auth_repost'] = this.isAuthRepost;
    data['active_title'] = this.activeTitle;
    data['active'] = this.active;
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
