import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: PageSelector(),
      ),
    );
  }
}

class PageSelector extends StatelessWidget {
  const PageSelector({Key? key}) : super(key: key);

  static const kIcons = <Icon>[
    Icon(Icons.event),
    Icon(Icons.home),
    Icon(Icons.android),
    Icon(Icons.alarm),
    Icon(Icons.face),
    Icon(Icons.language),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: kIcons.length,
      // Use a Builder here, otherwise DefaultTabController.of(context) below
      // returns null.
      child: Builder(
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TabPageSelector(),
              Expanded(
                child: IconTheme(
                  data: IconThemeData(
                    size: 128.0,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: TabBarView(children: kIcons),
                ),
              ),
              ElevatedButton(
                child: Text('SKIP'),
                onPressed: () {
                  final TabController controller =
                      DefaultTabController.of(context)!;
                  if (!controller.indexIsChanging) {
                    controller.animateTo(kIcons.length - 1);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
