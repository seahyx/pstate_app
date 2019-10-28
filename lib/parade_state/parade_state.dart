import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:pstate_app/consts.dart';

class ParadeStateWidget extends StatefulWidget {

	// Background decoration
	static const BoxDecoration decoration = BoxDecoration(
		gradient: LinearGradient(
			begin: Alignment.topLeft,
			end: Alignment.bottomRight,
			colors: [Colors.blue, Colors.purple]
		)
	);

	ParadeStateWidget({Key key}) : super(key: key);

	@override
	_PSWidgetState createState() => _PSWidgetState();
}

class _PSWidgetState extends State<ParadeStateWidget> {

	static const double cardPadding = Consts.cardPadding;
	static const double borderRadius = Consts.borderRadius;

	String testText = '';

	CalendarController _calendarController;

	void onDaySelected(DateTime date, List events) {
		print('The date selected is $date');

		setState(() {
			testText = 'The date selected is $date';
		});
	}

	@override
	void initState() {
		super.initState();

		_calendarController = CalendarController();
		// _calendarController.setSelectedDay(_calendarController.selectedDay, runCallback: true);

		WidgetsBinding.instance
				.addPostFrameCallback((_) => _calendarController.setSelectedDay(_calendarController.selectedDay, runCallback: true));
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
				_buildCard(_buildCalendar(_calendarController, onDaySelected)),
				_buildCard(Text(testText))
			],
		);
	}

	TableCalendar _buildCalendar(
		CalendarController calendarController,
		OnDaySelected onDaySelected) {
		return TableCalendar(
			calendarController: calendarController,
			calendarStyle: CalendarStyle(
				selectedStyle: TextStyle(
					color: Colors.white,
					fontWeight: FontWeight.bold
				),
				todayStyle: TextStyle(
					fontSize: 14.0,
				)
			),
			headerStyle: HeaderStyle(
				centerHeaderTitle: true,
				formatButtonShowsNext: false
			),
			onDaySelected: onDaySelected,
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