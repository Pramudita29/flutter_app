import 'package:first_flutter_app/core/common/my_card.dart';
import 'package:flutter/material.dart';
// import 'package:listview_class/core/common/my_card.dart';
// import 'package:listview_class/view/show_snackbar_view.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Text View"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 1; i < 10; i++) ...{
                GestureDetector(
                    onTap: () {},
                    child: CardWidget(
                        title: "Card$i",
                        color: i.isEven ? Colors.blue : Colors.amber))
              }
            ],
          ),
        ));
  }
}
