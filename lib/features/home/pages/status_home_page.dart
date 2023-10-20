import 'package:flutter/material.dart';

class StatusHomePage extends StatefulWidget {
  const StatusHomePage({super.key});

  @override
  State<StatusHomePage> createState() => _StatusHomePageState();
}

class _StatusHomePageState extends State<StatusHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("data"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
    );
  }
}
