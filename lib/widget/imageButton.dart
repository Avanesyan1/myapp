import 'package:flutter/material.dart';
import 'package:shopping_app/global/const.dart';

class MyIconButton extends StatelessWidget {
  String image_path;
  String text;
  Color textColor;
  double text_size;
  FontWeight text_weight;
  Color color;
  Color borderColor;
  VoidCallback onTap;
  
  MyIconButton({
    super.key, 
    required this.image_path,
    required this.text, 
    required this.textColor, 
    required this.text_size, 
    required this.text_weight, 
    required this.color, 
    required this.borderColor, 
    required this.onTap
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
          child: Row(
            mainAxisAlignment: center,
            children: [
              Image.asset(image_path, height: 24,),
              const SizedBox(width: 10,),  
              Text(
                text, 
                style: TextStyle(
                  color:  textColor, 
                  fontSize: text_size, 
                  fontWeight: text_weight
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}