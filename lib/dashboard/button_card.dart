import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {

	final double cardPadding;

	final double cardMargin;

	final double borderRadius;

	final IconData icon;

	final String title;

	final VoidCallback onPressed;

	const ButtonCard({
		this.icon = Icons.info,
		this.title = 'Title',
		this.cardPadding = 8.0,
		this.cardMargin = 4.0,
		this.borderRadius = 8.0,
		this.onPressed});
	
	void onTap(BuildContext context) {
		Scaffold.of(context).showSnackBar(SnackBar(
			content: Text('Tap'),
		));
	}

	@override
	Widget build(BuildContext buildContext) {
		return Card(
			child: InkWell(
				child: Container(
					child: Row(
						children: <Widget>[
							Container(
								child: Icon(icon, size: 24.0, color: Colors.white,),
								margin: EdgeInsets.only(right: cardPadding * 2)
							),
							Flexible(
								child: Text(
									title,
									style: TextStyle(
										color: Colors.white,
										fontSize: 18.0,
										fontWeight: FontWeight.bold,
									),
								),
							),
						],
						crossAxisAlignment: CrossAxisAlignment.start,
					),
					width: double.infinity,
					margin: EdgeInsets.all(cardPadding * 2),
				),
				onTap: onPressed,
				borderRadius: BorderRadius.circular(borderRadius),
			),
			shape: RoundedRectangleBorder(
				borderRadius: BorderRadius.circular(borderRadius)
			),
			margin: EdgeInsets.all(cardMargin),
			color: Color.fromRGBO(0, 0, 0, .5),
			elevation: 0,
		);
	}
}
