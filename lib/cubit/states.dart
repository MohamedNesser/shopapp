import 'package:ShopApp/model/login_model.dart';

abstract class shoploginstates{}

class shoplogininitialstate extends shoploginstates{}
class shoplogininloadingstate extends shoploginstates{}
class shoplogininscussesstate extends shoploginstates{
  final shoploginmodel loginmodel;

  shoplogininscussesstate(this.loginmodel);
}
class shoploginerrorstate extends shoploginstates{
  final  error;
  shoploginerrorstate(this.error);
}


class shoploginchangepasswordsufix extends shoploginstates{}