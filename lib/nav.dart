import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'nav_container.dart';
import 'dashboard/dashboard.dart';
import 'parade_state/parade_state.dart';

class NavWidget extends StatefulWidget {
	
	@override
	_NavWidgetState createState() => _NavWidgetState();
}

class _NavWidgetState extends State<NavWidget> {

	int _currentIndex = 0;

	String _appBarTitle = 'Placeholder';

	List<Widget> _children;

	final List<String> _titles = [
		'Dashboard',
		'Parade State',
	];

	void onTabTapped(int index) {
		setState(() {
			_currentIndex = index;
			_appBarTitle = _titles[index];
		});
	}

	@override
	void initState() {
		_children = [
			NavContainerWidget(
				body: DashboardWidget(onTabTapped: onTabTapped,),),
			NavContainerWidget(
				body: ParadeStateWidget(),)
		];

		super.initState();
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
					Positioned(
						top: 0.0,
						left: 0.0,
						right: 0.0,
						child: AppBar(
							title: Text(_appBarTitle),
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
							],
							backgroundColor: Theme.of(buildContext).backgroundColor,
							elevation: 0.0,
							selectedItemColor: Theme.of(buildContext).primaryColorDark,
						),
					)
				],
			),
		);
	}
}