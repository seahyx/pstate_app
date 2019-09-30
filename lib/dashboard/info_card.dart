import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {

	final double cardPadding;

	final double borderRadius = 8.0;
	
	final String title, value;

	InfoCard(this.cardPadding, this.title, this.value);

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
			margin: EdgeInsets.all(cardPadding),
			color: Color.fromRGBO(255, 255, 255, .75),
			elevation: 0,
		);
	}
}