import 'package:flutter/material.dart';

class AVSpanishAdminApp extends StatefulWidget {
  const AVSpanishAdminApp({Key? key}) : super(key: key);

  @override
  State<AVSpanishAdminApp> createState() => _AvSpanishAppState();
}

class _AvSpanishAppState extends State<AVSpanishAdminApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text('AV Spanish Admin')),
        ));
  }
}
