class UserDetails {
final String displayName;
final String email;
final String photoUrl;

UserDetails({
  required this.email,
  required this.photoUrl,
  required this.displayName,
});

factory UserDetails.fromJson(Map<String , dynamic> login) {
  return UserDetails(email: login['email'], photoUrl: login['photoUrl'], displayName: login['displayName']);

}
//to store data in new instance of map
Map<String , dynamic> toJson() {
  final Map<String, dynamic> data = <String , dynamic>{};

  data['displayName'] = displayName;
  data['photoUrl'] = photoUrl;
  data['email'] = email;
  return data;
}
}