// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'dart:math';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _random = new Random();

  int getRandomInt ( int min, int max ) {
    
     // method to return a randm # within a given range

    Random rnd;
    int r;

    max++; // increment upper range by 1

    rnd = Random();
    r = min + rnd.nextInt(max - min);
    return r;
  }

  String?         _uiInfo       = '- no data yet -';
  final int?      _min          = 0;
  final int?      _max          = 10;
  final int?      _itemCount    = 11;

  void _go() {
    int i = 0;
    String? str = 'Generating $_itemCount random numbers\nranging from $_min to $_max.\n(View console for results...)';
    setState(() {
      _uiInfo = str;
    });
    print (' --- Go! ---');
    for(i=0; i < _itemCount!; i++ ){
      print ( '${(i+1).toString() }. ${getRandomInt(_min!, _max!).toString()}');
    }
  }

  // This widget is the root of your application.
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blue,
                  child: Center(
                    child: 
                    Text( _uiInfo! ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blueAccent[100],
                  child: Center(
                    child: 
                    Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: ElevatedButton(
                              child: Text('go!'),
                              onPressed: () {
                                _go();
                              },
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 5,
                          child: Center(
                            child: 
                            Text( 'Press "go!" then check the console...' ),
                          ),
                        ),                        
                      ],
                    ),
                  ),
                ),
              ),              
            ],
          ),
        ),
      ),
    );
  }
}