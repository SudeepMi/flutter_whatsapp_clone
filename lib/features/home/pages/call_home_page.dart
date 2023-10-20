import 'package:flutter/material.dart';

class CallHomePage extends StatefulWidget {
  const CallHomePage({super.key});

  @override
  State<CallHomePage> createState() => _CallHomePageState();
}

class _CallHomePageState extends State<CallHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("data"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.call),
      ),
    );
  }
}
