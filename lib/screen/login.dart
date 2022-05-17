import 'package:ShopApp/cubit/cubit.dart';
import 'package:ShopApp/cubit/states.dart';
import 'package:ShopApp/screen/home.dart';
import 'package:ShopApp/screen/register.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class shoploginscreen extends StatelessWidget {
   var emailcontroler=TextEditingController();
   var pasworrdcontroler=TextEditingController();
  var formkey=GlobalKey<FormState>();
  void sumbit(){

  }
   @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>shoplogincubit(),
      child: BlocConsumer<shoplogincubit,shoploginstates>(

        listener:(context,state){
          if(state is shoplogininscussesstate){
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
             Navigator.push(context,MaterialPageRoute(builder: (context)=>homeScreen()));
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
                          Text("Login",style:Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.black
                          )),
                          SizedBox(height: 10,),
                          Text("Login now to app store",style:Theme.of(context).textTheme.headline6),
                          SizedBox(height: 20,),
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
                            obscureText:shoplogincubit.get(context).ispressd ,
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
                                        shoplogincubit.get(context).changesuffix();
                                          },
                                      child: Icon(shoplogincubit.get(context).suffix)),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
                              )

                          ),
                          SizedBox(height: 15,),
                          ConditionalBuilder(
                            condition: state is! shoplogininloadingstate,
                          builder: (context)=>Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Container(
                              height: 35,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: (){
                                  if(formkey.currentState.validate()){
                                    shoplogincubit.get(context).userlogin(
                                        email:emailcontroler.text,
                                        password: pasworrdcontroler.text);
                                  }

                                },
                                child: Text('Login',style:Theme.of(context).textTheme.headline6.copyWith(
                                    color: Colors.white
                                )),

                              ),
                            ),
                          ),
                            fallback: (context)=>Center(child: CircularProgressIndicator()),
                          ),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text("Don't have an account?"),
                              TextButton(onPressed: (){
                                Navigator.push(context,MaterialPageRoute(builder:(context)=>RegisterScreen()));
                              }, child: Text('Register now'))

                            ],
                          )
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
