import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FruitText extends StatelessWidget {
  final text;
  const FruitText({Key? key, this.text = "Fruit Market"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22.sp, color: Colors.white),
    );
  }
}
