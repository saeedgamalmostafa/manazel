class UserModel {
  UserModel({
    this.id,
    this.name,
    this.mobile,
    this.type,
    this.avatar,
    this.isActive,
    this.accessToken,
  });

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    type = json['type'];
    avatar = json['avatar'];
    isActive = json['is_active'];
    accessToken = json['access_token'];
  }

  num? id;
  String? name;
  String? mobile;
  dynamic type;
  String? avatar;
  bool? isActive;
  String? accessToken;

  UserModel copyWith({
    num? id,
    String? name,
    String? mobile,
    dynamic type,
    String? avatar,
    bool? isActive,
    String? accessToken,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        mobile: mobile ?? this.mobile,
        type: type ?? this.type,
        avatar: avatar ?? this.avatar,
        isActive: isActive ?? this.isActive,
        accessToken: accessToken ?? this.accessToken,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['mobile'] = mobile;
    map['type'] = type;
    map['avatar'] = avatar;
    map['is_active'] = isActive;
    map['access_token'] = accessToken;
    return map;
  }
}
