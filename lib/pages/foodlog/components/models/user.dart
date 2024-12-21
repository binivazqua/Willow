class MyUser {
  late String name; // "I promised that it will be assigned before use"
  late String gender;
  late String likes;

  MyUser({required String n, required String g}) {
    name = n;
    gender = g;
  }

  void whatUserLikes(String l) {
    likes = l;
    print('The user likes ${likes}');
  }
}
