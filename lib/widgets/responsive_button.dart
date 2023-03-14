import 'package:flutter/material.dart';
import 'package:travox/widgets/app_text.dart';

import '../utils/colors.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  String? text;

  ResponsiveButton({
    Key? key,
    this.isResponsive = false,
    this.width = 110,
    this.text = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive==true?MediaQuery.of(context).size.width/1.4:width,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.textColor1, width: 3),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive==true?MainAxisAlignment.spaceBetween: MainAxisAlignment.center,
          children: [
            isResponsive==true?Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(width: MediaQuery.of(context).size.width/2.7,
                  child: Text(
                    text!,
                    softWrap: false,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      overflow: TextOverflow.fade,
                    ),
                  ),
              ),
            ) : Container(),
            Padding(
              padding: isResponsive==true?const EdgeInsets.only(right: 4): const EdgeInsets.only(right: 0),
              child: Image.asset("img/button-one.png",),
            ),
          ],
        ),
      ),
    );
  }
}
