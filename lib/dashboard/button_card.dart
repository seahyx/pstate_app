import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {

	final double cardPadding;

	final double cardMargin;

	final double borderRadius;

	final IconData icon;

	final String title;

	final VoidCallback onPressed;

	final Color color;

	const ButtonCard({
		this.icon = Icons.info,
		this.title = 'Title',
		this.cardPadding = 8.0,
		this.cardMargin = 4.0,
		this.borderRadius = 8.0,
		this.onPressed,
		this.color = Colors.white});
	
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
								child: Icon(icon, size: 24.0, color: Colors.black87,),
								margin: EdgeInsets.only(right: cardPadding * 2)
							),
							Flexible(
								child: Text(
									title,
									style: TextStyle(
										color: Colors.black87,
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
			color: color,
		);
	}
}
