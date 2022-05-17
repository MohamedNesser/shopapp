import 'package:ShopApp/cubit/states.dart';
import 'package:ShopApp/dio/Dio_halber.dart';
import 'package:ShopApp/model/login_model.dart';
import 'package:ShopApp/network/end_point.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class shoplogincubit extends Cubit<shoploginstates> {
  shoplogincubit() : super(shoplogininitialstate());
  shoploginmodel loginmodel;
  static shoplogincubit get(context) => BlocProvider.of(context);

  void userlogin({@required String email, @required String password}) {
    Diohalper.pustdata(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      emit(shoplogininloadingstate());
      print(value.data);
      loginmodel= shoploginmodel.fromjson(value.data);
      emit(shoplogininscussesstate(loginmodel));
    }).catchError((error) {
      emit(shoploginerrorstate(error));
    });
  }

  IconData suffix= Icons.visibility_outlined;
  bool ispressd=true;
  void changesuffix(){
    ispressd=!ispressd;
    suffix=ispressd ?Icons.visibility:Icons.visibility_off;
    emit(shoploginchangepasswordsufix());
  }
}
