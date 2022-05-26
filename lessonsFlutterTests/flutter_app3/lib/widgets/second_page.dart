import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = (MediaQuery.of(context).size.height);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: screenHeight,
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Second Window',
                    style: TextStyle(color: Colors.white70)),
                ElevatedButton(
                  onPressed: _go,
                  child: const Text('Go'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white70, // background
                    onPrimary: Colors.white, // foreground
                  ),
                ),
                ElevatedButton(
                  onPressed: _back,
                  child: const Text('Back'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white70, // background
                    onPrimary: Colors.white, // foreground
                  ),
                ),
                ElevatedButton(
                  onPressed: _backAndRemoveAll,
                  child: const Text('go and delete all back'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white70, // background
                    onPrimary: Colors.white, // foreground
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _go() {
    Navigator.of(context).pushNamed('/third');
  }

  void _back() {
    Navigator.of(context).pop();
  }
  void _backAndRemoveAll() {
    Navigator.of(context).pushNamedAndRemoveUntil('/second', ModalRoute.withName('/'));
  }
}
