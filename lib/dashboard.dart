import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {

	final double cardPadding = 8.0;

	@override
	Widget build(BuildContext buildContext) {

		// Get height of a standard AppBar
		AppBar appBar = AppBar(title: Text('Placeholder'),);
		final _appBarHeight = appBar.preferredSize.height;

		return Container(
			child: SafeArea(
				child: Container(
					child: Column(
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
											StatusTmrCard(cardPadding),
											StatusTdyCard(cardPadding),
										]
									),
									TableRow(
										children: <Widget>[
											ViewStatusCard(cardPadding),
											SetTmrStatusCard(cardPadding),
										]
									)
								],
							),
						],
						crossAxisAlignment: CrossAxisAlignment.start,
					),
					margin: EdgeInsets.fromLTRB(0.0, _appBarHeight, 0.0, _appBarHeight),
					padding: EdgeInsets.all(cardPadding),
				)
			),
			decoration: BoxDecoration(
				gradient: LinearGradient(
					begin: Alignment.topLeft,
					end: Alignment.bottomRight,
					colors: [Colors.red, Colors.purple]
				)
			)
		);
	}
}

class StatusTmrCard extends StatelessWidget {

	final double cardPadding;

	final double borderRadius = 8.0;

	StatusTmrCard(this.cardPadding);

	@override
	Widget build(BuildContext buildContext) {
		return Card(
			child: Container(
				child: Column(
					children: <Widget>[
						Container(
							child: Center(
								child: Text('Your Parade State Tomorrow (31/09/19)', style: TextStyle(color: Colors.black, fontSize: 16.0),),
							),
							margin: EdgeInsets.all(8.0),
						),
						Container(
							child: Center(
								child: Text('P', style: TextStyle(color: Colors.black, fontSize: 32.0),),
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

class StatusTdyCard extends StatelessWidget {

	final double cardPadding;

	final double borderRadius = 8.0;

	StatusTdyCard(this.cardPadding);

	@override
	Widget build(BuildContext buildContext) {
		return Card(
			child: Container(
				child: Column(
					children: <Widget>[
						Container(
							child: Center(
								child: Text('Your Parade State Today (30/09/19)', style: TextStyle(color: Colors.black, fontSize: 16.0),),
							),
							margin: EdgeInsets.all(8.0),
						),
						Container(
							child: Center(
								child: Text('NSDC', style: TextStyle(color: Colors.black, fontSize: 32.0),),
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

class ViewStatusCard extends StatelessWidget {

	final double cardPadding;

	final double borderRadius = 8.0;

	ViewStatusCard(this.cardPadding);

	@override
	Widget build(BuildContext buildContext) {
		return Card(
			child: Container(
				child: Column(
					children: <Widget>[
						Container(
							child: Container(
								child: Icon(Icons.list, size: 50.0, color: Colors.white,),
								margin: EdgeInsets.all(cardPadding * 2),
							),
							height: 100,
						),
						Container(
							child: Text(
								'View Parade State',
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

class SetTmrStatusCard extends StatelessWidget {

	final double cardPadding;

	final double borderRadius = 8.0;

	SetTmrStatusCard(this.cardPadding);

	@override
	Widget build(BuildContext buildContext) {
		return Card(
			child: Container(
				child: Column(
					children: <Widget>[
						Container(
							child: Container(
								child: Icon(Icons.assignment_turned_in, size: 50.0, color: Colors.white,),
								margin: EdgeInsets.all(cardPadding * 2),
							),
							height: 100,
						),
						Container(
							child: Text(
								'Update Parade State for Tmr',
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

