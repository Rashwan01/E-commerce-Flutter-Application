class User {
  String tokenType;
  String workType;
  String surname;
  String firstName;
  String lastName;
  String username;
  int userId;
  int businessId;
  String accessToken;
  int expiresIn;
  String refreshToken;

  User(
      {this.tokenType,
      this.workType,
      this.surname,
      this.firstName,
      this.lastName,
      this.username,
      this.userId,
      this.businessId,
      this.accessToken,
      this.expiresIn,
      this.refreshToken});

  User.fromJson(Map<String, dynamic> json) {
    tokenType = json['token_type'];
    workType = json['work_type'];
    surname = json['surname'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    userId = json['user_id'];
    businessId = json['business_id'];
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token_type'] = this.tokenType;
    data['work_type'] = this.workType;
    data['surname'] = this.surname;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['username'] = this.username;
    data['user_id'] = this.userId;
    data['business_id'] = this.businessId;
    data['access_token'] = this.accessToken;
    data['expires_in'] = this.expiresIn;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}
