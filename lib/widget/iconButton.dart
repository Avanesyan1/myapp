import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:MyApp/global/const.dart';

class MyProfileIconButton extends StatelessWidget {
  String text;
  Color textColor;
  double text_size;
  FontWeight text_weight;
  Color color;
  Color borderColor;
  VoidCallback onTap;
  IconData icon;
  
  MyProfileIconButton({
    super.key, 
    required this.text, 
    required this.textColor, 
    required this.text_size, 
    required this.text_weight, 
    required this.color, 
    required this.borderColor, 
    required this.onTap,
    required this.icon
    });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: sv15,
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(15.0)
        ),
        child: Center(
          child: Padding(
            padding: lr10,
            child: Row(
              mainAxisAlignment: spb,
              children: [
                Text(
                  text, 
                  style: TextStyle(
                    color:  textColor, 
                    fontSize: text_size, 
                    fontWeight: text_weight
                        ),
                ),
                Icon(icon,color: textColor,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}