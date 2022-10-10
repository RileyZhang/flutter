import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Navigator2/MyRouteDelegate.dart';
import 'Navigator2/MyRouteParser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  final delegate = MyRouteDelegate(
    onGenerateRoute: (RouteSettings settings) {
      print("onGenerateRoute");
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) {
          return MyHomePage(title: 'Route: ${settings.name}');
        },
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    print("_MyAppState");
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routeInformationParser: MyRouteParser(),
      routerDelegate: delegate,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Is this being displayed?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('NO'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('YES'),
            ),
          ],
        );
      },
    );
  }

  void _removeLast() {
    final delegate = MyRouteDelegate.of(context);
    final stack = delegate.stack;
    if (stack.length > 2) {
      delegate.remove(stack[stack.length - 2]);
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    MyRouteDelegate.of(context).push('test');
  }

  @override
  Widget build(BuildContext context) {
    print("_MyHomePageState widget.title:${widget.title}");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'dialog',
            onPressed: _showDialog,
            tooltip: 'Show dialog',
            child: const Icon(Icons.message),
          ),
          const SizedBox(width: 12.0),
          FloatingActionButton(
            heroTag: 'remove',
            onPressed: _removeLast,
            tooltip: 'Remove last',
            child: const Icon(Icons.delete),
          ),
          const SizedBox(width: 12.0),
          FloatingActionButton(
            heroTag: 'add',
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

