import 'package:flutter/material.dart';
import 'package:flutter_app3/widgets/second_page.dart';

class ThirdPage extends StatefulWidget {
  ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
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
                const Text('Third Window',
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
                  onPressed: _back,
                  child: const Text('Back'),
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
    Navigator.of(context).pushNamed('/first');
  }



  void _back() {
    Navigator.of(context).pop();
  }
}
