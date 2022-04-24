import 'package:bcommerce/utils/colors.dart';
import 'package:bcommerce/utils/dimentions.dart';
import 'package:bcommerce/widgets/small_text.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstaHalf;
  late String secondhalf;

  bool hiddenText = true;

  double textHeight = Dimentions.screenHeight / 7.56;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > textHeight) {
      firstaHalf = widget.text.substring(0, textHeight.toInt());
      secondhalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstaHalf = widget.text;
      secondhalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondhalf.isEmpty
          ? SmallText(text: firstaHalf)
          : Container(
              child: Column(
                children: [
                  SmallText(
                    text: hiddenText
                        ? (firstaHalf + " ...")
                        : (firstaHalf + secondhalf),
                    size: Dimentions.font16,
                    color: AppColors.paraColor,
                    height: 1.4,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        hiddenText = !hiddenText;
                      });
                    },
                    child: Row(
                      children: [
                        SmallText(
                          text: "Show More",
                          size: Dimentions.font16,
                          color: AppColors.mainColor,
                        ),
                        Icon(
                          hiddenText
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: AppColors.mainColor,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
