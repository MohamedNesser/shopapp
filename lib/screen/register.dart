import 'package:ShopApp/cubitregester/cubit.dart';
import 'package:ShopApp/cubitregester/states.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatelessWidget {
  var emailcontroler=TextEditingController();
  var pasworrdcontroler=TextEditingController();
  var namecontroler=TextEditingController();
  var phonecontroler=TextEditingController();
  var formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>shopregistercubit(),
      child: BlocConsumer<shopregistercubit,shopregaserstates>(

        listener:(context,state){
          if(state is shopregasterscussesstate){
            if(state.loginmodel.status){
              print(state.loginmodel.message);
              Fluttertoast.showToast(
                  msg: state.loginmodel.message,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0
              );

            }else{
              Fluttertoast.showToast(
                  msg: state.loginmodel.message,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
          }
        } ,
        builder: (context,state){
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Register",style:Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.black
                          )),
                          SizedBox(height: 10,),
                          Text("Register now to app store",style:Theme.of(context).textTheme.headline6),
                          SizedBox(height: 20,),
                          TextFormField(
                              controller: phonecontroler,
                              validator:(String value){
                                if(value.isEmpty){
                                  return'please enter your phone number';
                                }
                                return null;
                              } ,
                              keyboardType: TextInputType.number,
                              decoration:InputDecoration(
                                  labelText: 'phone',
                                  prefix: Icon(Icons.phone),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
                              )

                          ),SizedBox(height: 10,),
                          TextFormField(
                              controller: namecontroler,
                              validator:(String value){
                                if(value.isEmpty){
                                  return'please enter your name';
                                }
                                return null;
                              } ,
                              keyboardType: TextInputType.text,
                              decoration:InputDecoration(
                                  labelText: 'name',
                                  prefix: Icon(Icons.person),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
                              )

                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                              controller: emailcontroler,
                              validator:(String value){
                                if(value.isEmpty){
                                  return'please enter your email';
                                }
                                return null;
                              } ,
                              keyboardType: TextInputType.emailAddress,
                              decoration:InputDecoration(
                                  labelText: 'email',
                                  prefix: Icon(Icons.email_outlined),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
                              )

                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                              obscureText:shopregistercubit.get(context).ispressd ,
                              controller: pasworrdcontroler,
                              validator:(String value){
                                if(value.isEmpty){
                                  return'please enter your password';
                                }
                                return null;
                              } ,
                              keyboardType: TextInputType.number,
                              decoration:InputDecoration(
                                  labelText: 'password',
                                  prefix: Icon(Icons.lock),

                                  suffixIcon: InkWell(

                                      onTap: (){
                                        shopregistercubit.get(context).changesuffix();
                                      },
                                      child: Icon(shopregistercubit.get(context).suffix)),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
                              )

                          ),
                          SizedBox(height: 15,),
                          ConditionalBuilder(
                            condition: state is! shopregasterloadingstate,
                            builder: (context)=>Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: Container(
                                height: 35,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: (){
                                    if(formkey.currentState.validate()){
                                      shopregistercubit.get(context).userregister(
                                       phone: phonecontroler.text,
                                          name: namecontroler.text,
                                          email:emailcontroler.text,
                                          password: pasworrdcontroler.text);
                                    }

                                  },
                                  child: Text('Register Now',style:Theme.of(context).textTheme.headline6.copyWith(
                                      color: Colors.white
                                  )),

                                ),
                              ),
                            ),
                            fallback: (context)=>Center(child: CircularProgressIndicator()),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
