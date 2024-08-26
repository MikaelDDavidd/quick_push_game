/*
import 'package:animated_background/animated_background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:game/app/data/app_colors.dart';
import 'package:game/app/data/app_string.dart';
import 'package:game/app/data/asset_strings.dart';
import 'package:game/app/widgets/text_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../controllers/home_controller.dart';
import 'package:game/app/widgets/left_corner.dart';
import 'package:game/app/widgets/right_corner.dart';

class LoginView extends GetView<HomeController> {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This is set to use MediaQUery to definy the relative percentage of the screen for the width:
    final widthSize = MediaQuery.of(context).size.width;

    // This is set to use MediaQUery to definy the relative percentage of the screen for the height:
    final heightSize = MediaQuery.of(context).size.height;

    return Obx(
      () => Scaffold(
        backgroundColor: AppColors
            .gameColorsTheme[controller.homeThemeIndex.value].background,
        body: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: const ParticleOptions(
              baseColor: Colors.white,
              minOpacity: 0.05,
              maxOpacity: 0.25,
              particleCount: 15,
              spawnMinSpeed: 50,
              spawnMaxSpeed: 100,
            ),
          ),
          vsync: controller,
          child: Stack(
            children: [
              RightCorner(
                height: heightSize * 0.8,
                width: widthSize * 0.4,
                cornerColor: AppColors
                    .gameColorsTheme[controller.homeThemeIndex.value].primary,
              ),
              LeftCorner(
                cornerColor: AppColors
                    .gameColorsTheme[controller.homeThemeIndex.value].primary,
                height: heightSize * 0.4,
                width: widthSize * 0.2,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: widthSize * 0.4,
                      child: TextNeumorphic(
                        fontWidth: 0.15,
                        borderResult: true,
                        intensityResult: 1,
                        borderWidth: 6,
                        text: AppStrings.gameNameString,
                      ),
                    ),
                    SizedBox(
                      height: heightSize * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPaint(
                          painter: HorizontalLinePainter(),
                          child: Container(
                            width: 200.0,
                            height: 1.0,
                            color: Colors.black, // Cor da linha
                          ),
                        ),
                        SizedBox(
                          width: heightSize * 0.02,
                        ),
                        TextNeumorphic(
                          fontWidth: 0.04,
                          borderResult: true,
                          intensityResult: 0.5,
                          text: 'Login',
                        ),
                        SizedBox(
                          width: heightSize * 0.02,
                        ),
                        CustomPaint(
                          painter: HorizontalLinePainter(),
                          child: Container(
                            width: 200.0,
                            height: 1.0,
                            color: Colors.black, // Cor da linha
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: heightSize * 0.1,
                    ),
                    Container(
                      height: heightSize * 0.1,
                      width: widthSize * 0.1,
                      child: NeumorphicButton(
                        style: const NeumorphicStyle(
                          intensity: 0.5,
                        ),
                        onPressed: () {
                          signInWithGoogle();
                        },
                        child: Image.asset(
                          AssetStrings.googleImage,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HorizontalLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.0;

    double startY = size.height / 2;
    double endY = size.height / 2;

    canvas.drawLine(Offset(0, startY), Offset(size.width, endY), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

signInWithGoogle() async {
  GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

  print(userCredential.user?.displayName);
}*/
