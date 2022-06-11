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

  // ------- change these defaults as needed -----------

  String?         _uiInfo       = '- no data yet -';
  final int?      _min          = 0;  // low end of integer range
  final int?      _max          = 12; // high end on int range
  final int?      _itemCount    = 5;  // how many #s to grab?  





  // ------- meaty method below ------------------------  

  int getRandomInt ( int min, int max, [ String exclude = ''] ) {

     // Method to return a random int within a given range.
     // Also accepts an "exclude" parameter, of numbers to exclude
     // (as a string, with integers separated by a comma)

    Random    _rnd;
    int       _r = 0;
    bool?    _rNoGood = true;

    List<String> excludeArray = exclude.split(',');
    int      i = 0;
    bool?    _excludeFound = false;

    max++; // increment upper range by 1

    _rnd = Random();
    while ( _rNoGood == true ) {
      _r = min + _rnd.nextInt(max - min);
      // check excludes
      if ( exclude != '' ) {
        _excludeFound = false;
        // loop through excludes... if you find it, exit
        for ( i=0; i < excludeArray.length; i++ ) {
          if( excludeArray[i] == _r.toString()) {
            _excludeFound = true; 
            // print ('excluded # ${excludeArray[i]} found!'); 
          }
        }
        if( _excludeFound == false ) {
          // because the # generated was not in excluded list,
          // the # is good!!
          _rNoGood = false;
        }
        else {
          // # was found in  excluded list, so the # is no good
          _rNoGood = true;
        }
      }
      else {
        // print ('no excluded list!');
        // because there is no excluded list,
        // the # found must be valid
        _rNoGood = false;  
      }
    }
    return _r;
  }








  // ------- helper method below ------------------------  

  void _go() {

    // Method executes when "go!" button clicked..

    int i = 0;
    String? str = 'Generating $_itemCount random numbers\nranging from $_min to $_max. (Possibly\nwith some excluded numbers --\ncheck source code.)\n(View console for results...)';
    setState(() {
      _uiInfo = str;
    });
    print (' --- Go! ---');
    for(i=0; i < _itemCount!; i++ ){
      print ( '${(i+1).toString() }. ${getRandomInt(_min!, _max!, '0,1,2,5,10,11').toString()}');
    }
  }






  // ------- the visible ui ----------------------------

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