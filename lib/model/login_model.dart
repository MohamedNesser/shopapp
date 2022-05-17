class shoploginmodel{
  bool status;
  String message;
  userdata data;
  shoploginmodel.fromjson(Map<String,dynamic>json){
    status = json['status'];
    message = json['message'];
    data = json['data'] !=null?userdata.fromjson(json['data']) :null;
  }
}

class userdata{
  int id;
  String name;
  String email;
  String phone;
  String image;
  int points;
  int credit;
  String token;
  userdata({
    this.id,
    this.name,
    this.email ,
    this.phone,
    this.image,
    this.points,
    this.credit,
    this.token,

});
  userdata.fromjson(Map<String,dynamic>json){
    id=json['id'];
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    image=json['image'];
    points=json['points'];
    credit=json['credit'];
    token=json['token'];

  }
}