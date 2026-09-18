class MyUser{
  static const String collectionName="Users";
  String uId;
  String email;
  String name;
  MyUser({required this.uId,required this.email,required this.name});
  MyUser.fromFireStore(Map<String,dynamic> data):this(
    uId: data['id'],
    name: data['name'],
    email: data['email']
  );
  Map<String,dynamic> toFireStore(){
    return {
      'id':uId,
      'email':email,
      'name':name
    };
  }
}