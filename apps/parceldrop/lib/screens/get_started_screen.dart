import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';
import 'shape/bezier_container.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width * .20,
            top: -MediaQuery.of(context).size.height * .25,
            child: const BezierContainer(
              divisorPi: 3.5,
              divisorHeight: .5,
            ),
          ),
          Positioned(
            top: 240,
            child: SvgPicture.asset(
              "assets/svg/onboarding-3.svg",
              package: App.pkg,
            ),
          ),
          Positioned(
            top: 540,
            child: const Text(
              "Get Started",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                letterSpacing: -0.02,
              ),
            ),
          ),
          Positioned(
            top: 625,
            child: AppButton(
                onTap: () {},
                text: "Sign Up",
                buttonColor: Color(0xFF4661E4),
                textColor: Colors.white,
                hasBorder: false,
                height: 48,
                width: MediaQuery.of(context).size.width - 32),
          ),
          Positioned(
            top: 689,
            child: AppButton(
              onTap: () {},
              text: "Login",
              buttonColor: Colors.white,
              textColor: Color(0xFF4661E4),
              hasBorder: true,
              hasPadding: true,
              height: 48,
              width: MediaQuery.of(context).size.width - 32,
            ),
          ),
          Positioned(
            left: -MediaQuery.of(context).size.width * .5,
            bottom: -MediaQuery.of(context).size.height * .2,
            child: const BezierContainer(
              divisorPi: 0.8,
              divisorHeight: .5,
            ),
          ),
        ],
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  final void Function()? onTap;
  final double? height;
  final double? width;
  final String text;
  final Color buttonColor;
  final Color textColor;
  final bool hasBorder;
  final Color? borderColor;
  final double? fontSize;
  final Widget? child;
  final Widget? icon;
  final bool? loadingIcon;
  final bool hasPadding;

  const AppButton({
    Key? key,
    this.onTap,
    this.icon,
    this.height,
    this.width,
    required this.text,
    this.child,
    required this.buttonColor,
    required this.textColor,
    required this.hasBorder,
    this.loadingIcon = false,
    this.borderColor,
    this.hasPadding = false,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding:
          hasPadding ? EdgeInsets.symmetric(horizontal: 24) : EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width ?? double.infinity,
          height: height ?? 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: hasBorder
                ? Border.all(color: Color(0xFF4661E4))
                : const Border(),
            color: isDarkMode && hasBorder ? Color(0xFF101828) : buttonColor,
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? Container(),
              if (icon != null) SizedBox(width: 12),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: fontSize,
                        color: textColor,
                      ),
                    ),
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
