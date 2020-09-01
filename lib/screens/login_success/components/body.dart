import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/controllers/authController.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/size_config.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Welcome \n ${Get.find<AuthController>().userModel.user}",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Sign out",
            press: () async {
              await Get.find<AuthController>().logOut();
              Get.offAll(SplashScreen());
            },
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to home",
            press: () {},
          ),
        ),
        Spacer(),
      ],
    );
  }
}
