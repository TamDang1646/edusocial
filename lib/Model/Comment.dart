class Comment {
  int? id;
  String? title;
  int? like;
  String? createAt;
  int? userId;
  String? userName;
  String? userAvatar;

  Comment({this.id, this.title, this.like, this.createAt, this.userId, this.userName, this.userAvatar});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    like = json['like'];
    createAt = json['createAt'];
    userId = json['userId'];
    userName = json['userName'];
    userAvatar = json['userAvatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['like'] = this.like;
    data['createAt'] = this.createAt;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['userAvatar'] = this.userAvatar;
    return data;
  }
}
