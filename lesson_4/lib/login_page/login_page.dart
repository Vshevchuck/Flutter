import 'package:flutter/material.dart';
import 'package:whe/utils/text_styles/Texts_styles.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = (MediaQuery.of(context).size.height);
    return SafeArea(
        child: Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background_logo.jpg"),
              fit: BoxFit.cover),
        ),
        child: Container(
          height: screenHeight,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenHeight / 1.5,
              child: Column(
                children: [
                  Text(
                    'Welocme Back!',
                    style: TextsStyles.welcomeTextStyle,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Sign in to your profile",
                    style: TextsStyles.signInTestStyle,
                  ),
                  SizedBox(height: 32.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: TextField(
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white70),
                            hintText: 'username@gmail.com',
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2.0, color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.0, color: Colors.white60)),
                            isCollapsed: true,
                            contentPadding: EdgeInsets.only(top: 16.0),
                            prefixIcon: Icon(
                              Icons.account_circle_rounded,
                              color: Colors.white60,
                            ))),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: TextField(
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                        obscureText: true,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white70),
                            hintText: 'password',
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2.0, color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.0, color: Colors.white60)),
                            isCollapsed: true,
                            contentPadding: EdgeInsets.only(top: 16.0),
                            prefixIcon: Icon(
                              Icons.key,
                              color: Colors.white60,
                            ))),
                  ),GoogleSign(callBack: () => setState(() {}))
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

class GoogleSign extends StatefulWidget {
  final Function callBack;
  const GoogleSign({Key? key,required this.callBack}) : super(key: key);

  @override
  State<GoogleSign> createState() => _GoogleSignState();
}

class _GoogleSignState extends State<GoogleSign> {
  GoogleSignInAccount? _currentUser;

  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      return Column(children: [
        ListTile(
          leading: GoogleUserCircleAvatar(
            identity: user,
          ),
          title: Text(user.displayName ?? ''),
          subtitle: Text(user.email),
        ),
        const Text("Singed in successfully"),
        ElevatedButton(
          onPressed: singOut,
          child: Text('Sign out'),
        )
      ]);
    } else {
      return Column(
        children: [
          Text('You are not singed in'),
          ElevatedButton(onPressed: singIn, child: Text('Sing In'))
        ],
      );
    }
  }

  void singOut() {
    _googleSignIn.disconnect();
    widget.callBack();
  }

  Future<void> singIn() async {
    try{
      await _googleSignIn.signIn();
      widget.callBack();
    }catch(e){
      print('error sing in $e');
    }
  }
}
