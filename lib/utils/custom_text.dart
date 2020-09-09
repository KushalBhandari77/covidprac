import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  String text;
  Color color;
  double size;
  CustomText({@required this.text,this.color,this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: Color==null?color: Theme.of(context).primaryColor,fontSize: size==null?14:size,),);
  }
}
