import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {

	final double cardPadding;

	final double borderRadius = 8.0;

	final IconData icon;

	final String title;

	ButtonCard(this.cardPadding, this.icon, this.title);

	@override
	Widget build(BuildContext buildContext) {
		return Card(
			child: Container(
				child: Column(
					children: <Widget>[
						Container(
							child: Container(
								child: Icon(icon, size: 50.0, color: Colors.white,),
								margin: EdgeInsets.all(cardPadding * 2),
							),
							height: 100,
						),
						Container(
							child: Text(
								title,
								style: TextStyle(color: Colors.white, fontSize: 18.0),
							),
							margin: EdgeInsets.all(cardPadding * 2),
						)
					],
				),
				width: double.infinity,
			),
			shape: RoundedRectangleBorder(
				borderRadius: BorderRadius.circular(borderRadius)
			),
			margin: EdgeInsets.all(cardPadding),
			color: Color.fromRGBO(0, 0, 0, .5),
			elevation: 0,
		);
	}
}
