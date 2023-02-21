import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fuck_you_generator/words.dart';
import 'package:http/http.dart';
import 'package:restart_app/restart_app.dart';

void main() {
  runApp(const MyApp());
}

// void _restartApp() async {
//   await FlutterRestart.restartApp();
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Fuck you!',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Words>? words;
  String? _currentWords = "";
  final _data = ;

  @override
  void initState() {
    super.initState();
    words = getWords();
  }

  // void _callWords() {
  //   var api = new Words();
  //   setState(() {
  //     _currentWords =
  //   });
  // }

  Future _refreshData() async {
    await Future.delayed(Duration(seconds: 3));
    _data.clear();
    _data.addAll(generateWordPairs().take(20));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bad words'),
        centerTitle: true,
      ),
      body: FutureBuilder<Words>(
        future: words,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var badwords = snapshot.data?.insult;
            var number = snapshot.data?.number;
            print(badwords);
            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text('${snapshot.data?.insult}'),
                      ),
                    );
                  }),
            );

            //   Center(
            //   child: Column(
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(top: 16),
            //         child: Text(
            //           '${badwords}',
            //           style: TextStyle(fontSize: 28.0),
            //         ),
            //       ),
            //       IconButton(
            //         tooltip: 'Restart',
            //         onPressed: () {
            //           print(badwords);
            //           Restart.restartApp();
            //         },
            //         icon: Icon(
            //           Icons.restart_alt,
            //           color: Colors.green,
            //           size: 60,
            //         ),
            //       ),
            //     ],
            //   ),
            // );
          } else if (snapshot.hasError) {
            return Text('Error');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
