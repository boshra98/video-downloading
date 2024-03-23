import 'package:flutter/material.dart';
import 'package:video_downloading/core/constant/color.dart';
import 'package:video_downloading/view/widget/auth/logoauth.dart';
import 'package:video_downloading/view/widget/language/custombuttomlang.dart';

import 'package:get/get_utils/get_utils.dart';

import '../../widget/auth/custombuttomauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/customtextbodyauth.dart';



class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle:true,
            backgroundColor: AppColor.backgroundcolor,
            elevation: 0.0,
            title: Text('Sign In', style:Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.grey))
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 30),
            child:ListView(children: [
             const  LogoAuth(),
              // SizedBox(height: 20,) ,
              CustomTextTitleAuth(text: "2".tr ) ,
             const  SizedBox(height: 10) ,
             const  CustomTextBodyauth(text: "sign in with your email and password or continue with social media"),
             const  SizedBox(height: 15) ,
             const CustomTextFormAuth(
                hinttext: "Enter your Email",
                iconData: Icons.email_outlined ,
                labeltext: "Email",

              ) ,

            const   CustomTextFormAuth(
                hinttext: "Enter your Password",
                iconData: Icons.lock_outline,
                labeltext: "password",
                //mycontrller
              ) ,
             const Text("forget password",textAlign:TextAlign.end
                ,) ,
              CustomButtomAuth(text:"Sign In",onPressed:(){},),
            const  SizedBox(height: 30,),
            const  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account ?"),
                  InkWell(child: Text("Sign Up" , style: TextStyle(color:AppColor.primaryColor , fontWeight: FontWeight.bold )),
                  )
                ],
              )
            ]),
        ),

    );


  }

}
