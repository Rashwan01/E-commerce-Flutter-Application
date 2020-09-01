class UserModel {
  String accessToken;
  String tokenType;
  int expiresIn;
  String user;

  UserModel({this.accessToken, this.tokenType, this.expiresIn, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    data['user'] = this.user;
    return data;
  }
}
