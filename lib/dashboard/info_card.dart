import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {

	final double cardPadding;

	final double cardMargin;

	final double borderRadius;
	
	final String title, value;

	final IconData icon;

	InfoCard({
		this.icon = Icons.info,
		this.title = 'Title',
		this.value = 'Value',
		this.cardPadding = 8.0,
		this.cardMargin = 4.0,
		this.borderRadius = 8.0,});

	@override
	Widget build(BuildContext buildContext) {
		return Card(
			child: Container(
				child: Column(
					children: <Widget>[
						Container(
							child: Center(
								child: Text(title, style: TextStyle(color: Colors.black, fontSize: 16.0),),
							),
							margin: EdgeInsets.all(8.0),
						),
						Container(
							child: Center(
								child: Text(value, style: TextStyle(color: Colors.black, fontSize: 32.0),),
							),
							height: 100,
						)
					],
					crossAxisAlignment: CrossAxisAlignment.start,
				),
				width: double.infinity,
			),
			shape: RoundedRectangleBorder(
				borderRadius: BorderRadius.circular(borderRadius)
			),
			margin: EdgeInsets.all(cardMargin),
			color: Color.fromRGBO(255, 255, 255, .75),
			elevation: 0,
		);
	}
}