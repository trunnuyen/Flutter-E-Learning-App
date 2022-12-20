import 'package:online_learning_app/Controllers/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_learning_app/public/color.dart';

class SelectionButton extends StatelessWidget {
  var content = "";
  var selectedButton = "";
  var icon;
  SelectionButton(
      {Key? key,
      required this.content,
      required this.selectedButton,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool selected;
    content == selectedButton ? selected = true : selected = false;
    var _controller = Get.find<HomeController>();
    return InkWell(
      onTap: () {
        _controller.selectedButton.value = content;
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
        decoration: BoxDecoration(
            border: Border.all(color: primary, width: 2),
            color: selected ? primary : Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Icon(
              icon,
              color: selected ? Colors.white : primary,
            ),
            Text(
              content,
              style: TextStyle(
                  color: selected ? Colors.white : primary,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
