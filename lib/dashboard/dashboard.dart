import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'info_card.dart';
import 'button_card.dart';

class DashboardWidget extends StatelessWidget {

	final double cardPadding = 8.0;

	// Background decoration
	final BoxDecoration decoration = BoxDecoration(
		gradient: LinearGradient(
			begin: Alignment.topLeft,
			end: Alignment.bottomRight,
			colors: [Colors.red, Colors.purple]
		)
	);

	@override
	Widget build(BuildContext buildContext) {

		return Column(
			children: <Widget>[
				Container(
					child: Text(
						'Welcome, Ying Xiang',
						style: TextStyle(color: Colors.white, fontSize: 32.0),
					),
					margin: EdgeInsets.fromLTRB(cardPadding, 0.0, 0.0, cardPadding),
				),
				Table(
					children: <TableRow>[
						TableRow(
							children: <Widget>[
								InfoCard(
									cardPadding,
									'Your Parade State Tomorrow (2/10/19)',
									'P/GD'
								),
								InfoCard(
									cardPadding,
									'Your Parade State Today (1/10/19)',
									'NSDC'
								),
							]
						),
						TableRow(
							children: <Widget>[
								ButtonCard(
									cardPadding,
									Icons.list,
									'View Parade State'
								),
								ButtonCard(
									cardPadding, 
									Icons.assignment_turned_in, 
									'Update Parade State for Tmr'
								),
							]
						)
					],
				),
			],
			crossAxisAlignment: CrossAxisAlignment.start,
		);
	}
}

