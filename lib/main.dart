import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VALUE NOTIFIER',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Color> colors = [Colors.red, Colors.yellow, Colors.orange, Colors.grey];
  late ValueNotifier<int> _colorNotifier;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _colorNotifier = ValueNotifier(0);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _colorNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _colorNotifier,
        builder: (_, int value, __) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: colors[value % colors.length],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _colorNotifier.value++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.change_circle_outlined),
      ),
    );
  }
}
