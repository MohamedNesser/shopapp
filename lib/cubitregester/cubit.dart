import 'package:ShopApp/cubit/states.dart';
import 'package:ShopApp/cubitregester/states.dart';
import 'package:ShopApp/dio/Dio_halber.dart';
import 'package:ShopApp/model/login_model.dart';
import 'package:ShopApp/network/end_point.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class shopregistercubit extends Cubit<shopregaserstates> {
  shopregistercubit() : super(shopregasteritialstate());
  shoploginmodel loginmodel;
  static shopregistercubit get(context) => BlocProvider.of(context);

    void userregister({
      @required String email,
      @required String password ,
      @required String phone,
       @required String name
    }) {
    Diohalper.pustdata(
        url: REGISTER,
        data: {
          'email': email,
          'password': password,
          'name': name,     
          'phone': phone
        })
        .then((value) {
      emit(shopregasterloadingstate());
      print(value.data);
      loginmodel= shoploginmodel.fromjson(value.data);
      emit(shopregasterscussesstate(loginmodel));
    }).catchError((error) {
      emit(shopregastererrorstate(error));
    });
  }

  IconData suffix= Icons.visibility_outlined;
  bool ispressd=true;
  void changesuffix(){
    ispressd=!ispressd;
    suffix=ispressd ?Icons.visibility:Icons.visibility_off;
    emit(shopregasterchangepasswordsufix());
  }
}
