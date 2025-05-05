import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ProgressHUD(
          key: UniqueKey(),
          opacity: .3,
          inAsyncCall: isApiCallProcess,
          child: Form(key: globalKey, child: loginUI()),
        ),
      ),
    );
  }

  loginUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            "https://image.pngaaa.com/766/8630766-middle.png",
            height: 100,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
