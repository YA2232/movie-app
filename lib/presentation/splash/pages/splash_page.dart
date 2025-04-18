import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/config/assets/images/app_images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(AppImages.splahImage))),
      ),
    );
  }

  void redirect() async {
    await Future.delayed(Duration(seconds: 2));
    context.go("/home");
  }
}


// BlocListener<SplashCubit, SplashState>(
//       listener: (context, state) {
//         if (state is Authenticatd) {
//           context.go("/home");
//         } else if (state is UnAuthenticatd) {
//           context.go("/signin");
//         }
//       },
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   fit: BoxFit.cover, image: AssetImage(AppImages.splahImage))),
//         ),
//       ),
//     );
