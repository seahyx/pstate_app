import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ParadeStateWidget extends StatefulWidget {

	ParadeStateWidget({Key key}) : super(key: key);

	// Background decoration
	final BoxDecoration decoration = BoxDecoration(
		gradient: LinearGradient(
			begin: Alignment.topLeft,
			end: Alignment.bottomRight,
			colors: [Colors.blue, Colors.purple]
		)
	);

	@override
	_PSWidgetState createState() => _PSWidgetState();
}

class _PSWidgetState extends State<ParadeStateWidget> {

	final double cardPadding = 8.0;

	final double borderRadius = 8.0;

	CalendarController _calendarController;

	@override
	void initState() {
		super.initState();

		_calendarController = CalendarController();
	}

	@override
	void dispose() {
		_calendarController.dispose();

		super.dispose();
	}

	@override
	Widget build(BuildContext buildContext) {
		return Column(
			children: <Widget>[
				_buildCard(_buildCalendar()),
				_buildCard(Text('Testing testing 123'))
			],
		);
	}

	TableCalendar _buildCalendar() {
		return TableCalendar(
			calendarController: _calendarController,
			calendarStyle: CalendarStyle(
				selectedStyle: TextStyle(
					color: Colors.white,
					fontWeight: FontWeight.bold
				)
			),
			headerStyle: HeaderStyle(
				centerHeaderTitle: true,
				formatButtonShowsNext: false
			),
		);
	}

	Card _buildCard(Widget body) {
		return Card(
			child: Container(
				child: Center(
					child: body
				),
				width: double.infinity,
				margin: EdgeInsets.all(cardPadding),
			),
			shape: RoundedRectangleBorder(
				borderRadius: BorderRadius.circular(borderRadius)
			),
			margin: EdgeInsets.all(cardPadding),
			color: Color.fromRGBO(255, 255, 255, .75),
			elevation: 0.0,
		);
	}
}