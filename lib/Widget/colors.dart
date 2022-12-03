import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ColorsPanel extends StatefulWidget {
   Color? coloritem;
   ColorsPanel({Key? key,required this.coloritem}) : super(key: key);

  @override
  State<ColorsPanel> createState() => _ColorsPanelState();
}

class _ColorsPanelState extends State<ColorsPanel> {
  @override
  Widget build(BuildContext context) {
    return    Row(crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: widget.coloritem,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ],
    );
  }
}
