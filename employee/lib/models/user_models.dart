class UserProfile {
  String id;
  String name;
  String username;
  String email;
  bool status;

  UserProfile({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.status,
  });

  UserProfile.fromJSON(Map<String, dynamic> json)
      : id = json['_id'],
        name = json['name'],
        username = json['username'],
        email = json['email'],
        status = json['status'];
}
