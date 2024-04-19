import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lift/domain/login/view/login_view.dart';
import 'package:get/get.dart';
import 'package:lift/core/device/nav/nav_slide_from_bottom.dart';


class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  SplashService splashScreen = SplashService();

  @override
  void initState() {
    splashScreen.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.accentColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          color: colors.accentColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "세상의",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "모든",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const Divider(
                height: 30,
                thickness: 1,
                color: Colors.white,
              ),
              const Text(
                "인재들을",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "올리다",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50,),
              Expanded(child: Container(
                alignment: Alignment.topCenter,
                child:  const CupertinoActivityIndicator(
                    radius: 20,
                    animating: true,
                    color: Colors.white),
              )),
              const SizedBox(
                width: double.maxFinite,
                child: Text(
                  "LIFT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
