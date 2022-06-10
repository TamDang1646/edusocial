import 'package:my_app/constains/mock_data.dart';

class Posts {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? postAddress;
  String? postTime;
  String? title;
  int? like;
  int? comment;
  String? images;
  String? avatarUrl;
  int? share;

  Posts(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.gender,
      this.postAddress,
      this.postTime,
      this.title,
      this.like,
      this.comment,
      this.images,
      this.avatarUrl,
      this.share});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    gender = json['gender'];
    postAddress = json['post_address'];
    postTime = json['post_time'];
    title = json['title'];
    like = json['like'];
    comment = json['comment'];
    images = json['images'];
    avatarUrl = json['avatarUrl'];
    share = json['share'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['gender'] = gender;
    data['post_address'] = postAddress;
    data['post_time'] = postTime;
    data['title'] = title;
    data['like'] = like;
    data['comment'] = comment;
    data['images'] = images;
    data['avatarUrl'] = avatarUrl;
    data['share'] = share;
    return data;
  }
}

class PostServices {
  Future<List<Posts>> getPosts() async {
    List<Posts> post = mockPosts.map((e) => Posts.fromJson(e)).toList();
    return post;
  }
}
