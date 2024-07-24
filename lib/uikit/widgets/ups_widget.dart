import 'package:flutter/material.dart';

class UpsWidget extends StatelessWidget {
  const UpsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("22.07.24"),
        centerTitle: true,

      ),
      body: Center(
        child: SizedBox.square(
          dimension: 500,
          child: Column(
            children: [
              const Text("Ups"),
              const Text("Problems"),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Try"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}