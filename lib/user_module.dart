


class User {

  final int id;

  final String firstname;
  final String lastname;
  final String useremail;
  final String useravatar;

  const User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.useremail,
    required this.useravatar,


  });


  static User fromJson(json) =>
      User(

        id: json["id"],
        firstname: json["first_name"],
        lastname: json["last_name"],
        useravatar: json["avatar"],
        useremail: json["email"],

      );
}