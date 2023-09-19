import 'package:flutter/material.dart';
import 'package:money_management/screens/home_screen.dart';
import 'package:money_management/shared/network/shared.styles/colors.dart';

import '../shared/shared_components/components.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      navigateToFinish(context, const HomeScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage('assets/images/project-management.png'),
              width: screenWidth(context) / 1.5,
            ),
            SizedBox(
              height: screenHeight(context) / 40,
            ),
            Text(
              "قم بأدارة مصاريفك الان",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 22,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
