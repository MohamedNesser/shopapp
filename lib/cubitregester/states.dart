import 'package:ShopApp/model/login_model.dart';

abstract class shopregaserstates{}

class shopregasteritialstate extends shopregaserstates{}
class shopregasterloadingstate extends shopregaserstates{}
class shopregasterscussesstate extends shopregaserstates{
  final shoploginmodel loginmodel;

  shopregasterscussesstate(this.loginmodel);
}
class shopregastererrorstate extends shopregaserstates{
  final  error;
  shopregastererrorstate(this.error);
}


class shopregasterchangepasswordsufix extends shopregaserstates{}