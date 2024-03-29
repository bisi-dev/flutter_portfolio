import 'package:defiscan/core/app_core.dart';

import '../../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  void _splashAnimation() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInCirc);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    _animationController.forward().then((val) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.top]);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoute.home, (route) => false);
    });
  }

  @override
  void initState() {
    super.initState();
    _splashAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: FadeTransition(
        opacity: _animation,
        child: Center(
          child: Image.asset(
            Theme.of(context).brightness == Brightness.light
                ? AppImage.darkLogoImage
                : AppImage.lightLogoImage,
            height: 100,
            width: 100,
            package: App.pkg,
          ),
        ),
      ),
    );
  }
}
