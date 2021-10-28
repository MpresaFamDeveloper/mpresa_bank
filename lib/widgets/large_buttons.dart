import 'package:flutter/cupertino.dart';
import 'package:mpresa_bank/components/colors.dart';

class AppLargeButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final String text;
  Function()? onTap;
  final bool? isBorder;

  AppLargeButton(
      {Key? key,
      this.backgroundColor,
      this.textColor,
      this.onTap,
      this.isBorder,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsetsDirectional.only(end: 30, start: 30),
        height: 60,
        width: MediaQuery.of(context).size.width - 60,
        decoration: BoxDecoration(
            color: AppColor.selectBackground,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: AppColor.mainColor)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
