import 'package:Tochka_Sbora/style/styles/text_style.dart';
import 'package:flutter/material.dart';

class chooseLocation extends StatelessWidget {
  const chooseLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Center(
                child: SizedBox(width: 350, height: 35, child: findCity())),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: Cities())
        ],
      ),
    );
  }
}

class findCity extends StatelessWidget {
  const findCity({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: 'Найти город...',
          hintStyle: TextStylee.second_text),
    );
  }
}

class Cities extends StatelessWidget {
  const Cities({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) => const cityTyle(), itemCount: 50);
  }
}

class cityTyle extends StatelessWidget {
  const cityTyle({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
      "city",
      style: TextStylee.second_text,
    ));
  }
}
