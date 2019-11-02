import 'package:flutter/material.dart';
import 'nav.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

	final ThemeData defWhiteTheme = ThemeData(
		brightness: Brightness.light,
		primaryColor: Colors.grey,
		backgroundColor: Colors.grey[300],
		primaryColorDark: Colors.black87,
		primaryColorLight: Colors.white24,

		appBarTheme: AppBarTheme(
			color: Colors.transparent,
			elevation: 0,
			textTheme: TextTheme(title: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),),
		),

		textTheme: TextTheme(
			headline: TextStyle(color: Colors.grey[800], fontSize: 32.0, fontWeight: FontWeight.bold,),
			display1: TextStyle(color: Colors.black87, fontSize: 32.0, fontWeight: FontWeight.bold,)
		),
	);
	
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Title',
			home: NavWidget(),
			theme: defWhiteTheme,
		);
	}

}