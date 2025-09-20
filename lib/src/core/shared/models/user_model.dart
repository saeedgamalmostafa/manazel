class UserModel {
  UserModel({
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.type,
    this.avatar,
    this.isActive,
    this.preferences,
    this.accessToken,
  });

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    type = json['type'];
    avatar = json['avatar'];
    isActive = json['is_active'];
    accessToken = json['access_token'];
    preferences = json['preferences'] != null
        ? UserPreferences.fromJson(json['preferences'])
        : null;
  }

  num? id;
  String? name;
  String? mobile;
  String? email;
  dynamic type;
  String? avatar;
  bool? isActive;
  String? accessToken;
  UserPreferences? preferences;

  UserModel copyWith({
    num? id,
    String? name,
    String? mobile,
    String? email,
    dynamic type,
    String? avatar,
    bool? isActive,
    String? accessToken,
    UserPreferences? preferences,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        mobile: mobile ?? this.mobile,
        email: email ?? this.email,
        type: type ?? this.type,
        avatar: avatar ?? this.avatar,
        isActive: isActive ?? this.isActive,
        accessToken: accessToken ?? this.accessToken,
        preferences: preferences ?? this.preferences,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['mobile'] = mobile;
    map['email'] = email;
    map['type'] = type;
    map['avatar'] = avatar;
    map['is_active'] = isActive;
    map['access_token'] = accessToken;
    if (preferences != null) {
      map['preferences'] = preferences!.toJson();
    }
    return map;
  }
}

class UserPreferences {
  bool? notification;
  String? theme;
  String? language;

  UserPreferences({
    this.notification,
    this.theme,
    this.language,
  });

  UserPreferences.fromJson(dynamic json) {
    notification = json['notification'];
    theme = json['theme'];
    language = json['language'];
  }

  UserPreferences copyWith({
    bool? notification,
    String? theme,
    String? language,
  }) =>
      UserPreferences(
        notification: notification ?? this.notification,
        theme: theme ?? this.theme,
        language: language ?? this.language,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['notification'] = notification;
    map['theme'] = theme;
    map['language'] = language;
    return map;
  }
}
