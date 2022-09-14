import 'package:flutter/material.dart';

//this is the defualt height of the AppBar widget  ===  i n this particular module we are trying to customize that! i mean its height
final double kToolbarHeight = 56.0;
double appBarHeight(BuildContext context) {
  return screenAwareSize(kToolbarHeight, context);
}

const double kBaseHeight = 650.0;
double screenAwareSize(double size, BuildContext context) {
  double drawingHeight =
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
  return size * drawingHeight / kBaseHeight;
}

// this module is to show off MediaQuery which i most likely gona use 

//In flutter we use MediaQuery class to access the screen size (height and width ) mostly but it has also other uses

// 56 * someRondomNumber/650

//this someRondomNumber is a little less(the top padding) from the height of the screen rendering this app


/*


a stack with non positioned children
Stack(
  children:<Widget>[
    child:Text('hello world'),
    child:Text('hello world'),
    child:Text('hello world'),
    child:Text('hello world'),
  ],
  alignement:'horizontal'
)
a stack with positioned children 

Stack(
  children:[
    positioned(
      top: 100 , 
      child:Text('first positioned widget in the stack')
    ),
    
    positioned(
      top: 200 , 
      child:Text('second one')
    ),  
    positioned(
      top: 300 , 
      child:Text('third one')
    ),
  ]
)

*/