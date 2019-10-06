import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'nav_container.dart';
import 'placeholder.dart';
import 'dashboard/dashboard.dart';
import 'parade_state/parade_state.dart';

class NavWidget extends StatefulWidget {
	
	@override
	_NavWidgetState createState() => _NavWidgetState();
}

class _NavWidgetState extends State<NavWidget> {

	int _currentIndex = 0;

	String _appBarTitle = 'Placeholder';

	final List<Widget> _children = [
		NavContainerWidget(
			body: DashboardWidget(),
			decoration: DashboardWidget.decoration),
		NavContainerWidget(
			body: ParadeStateWidget(),
			decoration: ParadeStateWidget.decoration),
		PlaceholderWidget(Colors.lightBlue)
	];

	final List<String> _titles = [
		'Dashboard',
		'Parade State',
		'Settings',
	];

	void onTabTapped(int index) {
		setState(() {
			_currentIndex = index;
			_appBarTitle = _titles[index];
		});
	}

	@override
	Widget build(BuildContext buildContext) {
		
		_appBarTitle = _titles[_currentIndex];

		return Scaffold(
			body: Stack(
				children: <Widget>[
					Offstage(
						offstage: _currentIndex != 0,
						child: TickerMode(
							enabled: _currentIndex == 0,
							child: SizedBox.expand(
								child: _children[0],
							),
						),
					),
					Offstage(
						offstage: _currentIndex != 1,
						child: TickerMode(
							enabled: _currentIndex == 1,
							child: SizedBox.expand(
								child: _children[1],
							),
						),
					),
					Offstage(
						offstage: _currentIndex != 2,
						child: TickerMode(
							enabled: _currentIndex == 2,
							child: SizedBox.expand(
								child: _children[2]
							),
						),
					),
					Positioned(
						top: 0.0,
						left: 0.0,
						right: 0.0,
						child: AppBar(
							title: Text(_appBarTitle),
							backgroundColor: Colors.transparent,
							elevation: 0.0,
						),
					),
					Positioned(
						bottom: 0.0,
						left: 0.0,
						right: 0.0,
						child: BottomNavigationBar(
							currentIndex: _currentIndex,
							onTap: onTabTapped,
							items: [
								BottomNavigationBarItem(
									icon: Icon(Icons.home),
									title: Text(_titles[0])
								),
								BottomNavigationBarItem(
									icon: Icon(Icons.list),
									title: Text(_titles[1])
								),
								BottomNavigationBarItem(
									icon: Icon(Icons.settings),
									title: Text(_titles[2])
								),
							],
							backgroundColor: Colors.transparent,
							elevation: 0.0,
							selectedItemColor: Colors.white,
						),
					)
				],
			),
		);
	}
}