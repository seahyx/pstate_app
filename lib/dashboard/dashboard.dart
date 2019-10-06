import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'info_card.dart';
import 'button_card.dart';

class DashboardWidget extends StatelessWidget {

	static const double cardPadding = 8.0;
	static const double cardMargin = 8.0;

	// Background decoration
	static const BoxDecoration decoration = BoxDecoration(
		gradient: LinearGradient(
			begin: Alignment.topLeft,
			end: Alignment.bottomRight,
			colors: [Colors.red, Colors.purple]
		)
	);

	DashboardWidget({Key key}) : super(key: key);

	@override
	Widget build(BuildContext buildContext) {

		return Column(
			children: <Widget>[
				Container(
					child: Text(
						'Welcome, Ying Xiang',
						style: TextStyle(color: Colors.white, fontSize: 32.0),
					),
					margin: EdgeInsets.fromLTRB(cardPadding, 0.0, cardPadding, cardPadding),
				),
				Row(
					children: <Widget>[
						Expanded(
							child: Column(
								children: <Widget>[
									InfoCard(
										title: 'Your Parade State Tomorrow (2/10/19)',
										value: 'P/GD',
										cardPadding: cardPadding,
										cardMargin: cardMargin,
									),
									ButtonCard(
										icon: Icons.list,
										title: 'View Parade State',
										cardPadding: cardPadding,
										cardMargin: cardMargin,
									),
									ButtonCard(
										icon: Icons.edit,
										title: 'Edit Name List',
										cardPadding: cardPadding,
										cardMargin: cardMargin,
									),
								],
							),
						),
						Expanded(
							child: Column(
								children: <Widget>[
									InfoCard(
										title: 'Your Parade State Today (1/10/19)',
										value: 'NSDC',
										cardPadding: cardPadding,
										cardMargin: cardMargin,
									),
									ButtonCard(
										icon: Icons.assignment_turned_in, 
										title: 'Update Parade State for Tmr',
										cardPadding: cardPadding,
										cardMargin: cardMargin,
									),
								],
							),
						)
					],
					crossAxisAlignment: CrossAxisAlignment.start,
				),
			],
			crossAxisAlignment: CrossAxisAlignment.start,
		);
	}
}

