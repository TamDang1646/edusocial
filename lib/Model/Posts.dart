import '../constains/posts.dart';
import 'Comment.dart';

class Posts {
  int? id;
  String? userId;
  String? avatar;
  String? userName;
  String? createAt;
  String? title;
  List<Images>? images;
  int? like;
  int? share;
  List<Comment>? comment;
  String? postAddress;
  String? postTime;

  Posts(
      {this.id,
      this.userId,
      this.avatar,
      this.userName,
      this.createAt,
      this.title,
      this.images,
      this.like,
      this.share,
      this.comment,
      this.postAddress,
      this.postTime});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    avatar = json['avatar'];
    userName = json['userName'];
    createAt = json['createAt'];
    title = json['title'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    like = json['like'];
    share = json['share'];
    if (json['comment'] != null) {
      comment = <Comment>[];
      json['comment'].forEach((v) {
        comment!.add(new Comment.fromJson(v));
      });
    }
    postAddress = json['postAddress'];
    postTime = json['postTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['avatar'] = this.avatar;
    data['userName'] = this.userName;
    data['createAt'] = this.createAt;
    data['title'] = this.title;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['like'] = this.like;
    data['share'] = this.share;
    if (this.comment != null) {
      data['comment'] = this.comment!.map((v) => v.toJson()).toList();
    }
    data['postAddress'] = this.postAddress;
    data['postTime'] = this.postTime;
    return data;
  }
}

class Images {
  String? url;
  int? id;

  Images({this.url, this.id});

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['id'] = this.id;
    return data;
  }
}

class PostServices {
  Future<List<Posts>> getPosts() async {
    List<Posts> post = posts.map((e) => Posts.fromJson(e)).toList();
    return post;
  }
}
