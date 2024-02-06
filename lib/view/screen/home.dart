import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        centerTitle:true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('home page', style:Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.grey))
    ),
    );
  }



}
