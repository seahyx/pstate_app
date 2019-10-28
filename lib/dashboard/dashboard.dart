import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pstate_app/consts.dart';

import 'info_card.dart';
import 'button_card.dart';
import 'package:pstate_app/namelist/namelist.dart';

class DashboardWidget extends StatelessWidget {

	static const double cardPadding = Consts.cardPadding;
	static const double cardMargin = Consts.cardMargin;

	// Background decoration
	static const BoxDecoration decoration = BoxDecoration(
		gradient: LinearGradient(
			begin: Alignment.topLeft,
			end: Alignment.bottomRight,
			colors: [Colors.red, Colors.purple]
		)
	);

	final void Function(int) onTabTapped;

	DashboardWidget({Key key, this.onTabTapped}) : super(key: key);

	Widget column1(BuildContext buildContext) {
		return Expanded(
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
						onPressed: () {
							onTabTapped(1);
						},
					),
					ButtonCard(
						icon: Icons.edit,
						title: 'Edit Name List',
						cardPadding: cardPadding,
						cardMargin: cardMargin,
						onPressed: () {
							Navigator.push(
								buildContext,
								MaterialPageRoute(builder: (buildContext) => NamelistWidget())
							);
						},
					),
				],
			),
		);
	}

	Widget column2(BuildContext buildContext) {
		return Expanded(
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
						onPressed: () {},
					),
				],
			),
		);
	}

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
						column1(buildContext),
						column2(buildContext)
					],
					crossAxisAlignment: CrossAxisAlignment.start,
				),
			],
			crossAxisAlignment: CrossAxisAlignment.start,
		);
	}
}

