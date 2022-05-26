import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
                const Text('First Window',
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
                  onPressed: _goChange,
                  child: const Text('Change this page on second'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white70, // background
                    onPrimary: Colors.white, // foreground
                  ),
                ),
                ElevatedButton(
                  onPressed: _creatingChain,
                  child: const Text('Creating chain'),
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
    Navigator.of(context).pushNamed('/second');
  }
  void _goChange() {
    Navigator.of(context).pushReplacementNamed('/second');
  }
  void _creatingChain(){
    Navigator.defaultGenerateInitialRoutes(Navigator.of(context), '/third/second');
  }
}
