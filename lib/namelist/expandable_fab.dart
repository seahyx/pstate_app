import 'package:flutter/material.dart';

class ExpandableFab extends StatefulWidget {

	final void Function() onAddEntryTapped;

	const ExpandableFab({this.onAddEntryTapped});

	@override
	_ExpandableFabState createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab> with SingleTickerProviderStateMixin {

	bool isOpened = false;

	IconData currentIcon;

	final List<IconData> mainAnimIcons = [Icons.edit, Icons.save];

	AnimationController _animationController;
	Animation<Color> _animateColor;
	Animation<double> _translateButton;
	Animation<double> _scaleButton;

	final Curve _curve = Curves.easeOut;

	final double _fabHeight = 56.0;

	// Animate toggle open/close button
	void animate() {
		if (!isOpened) {
			// Opening animation
			_animationController.forward();
			currentIcon = mainAnimIcons[1];
		} else {
			// CLosing animation
			_animationController.reverse();
			currentIcon = mainAnimIcons[0];
		}
		isOpened = !isOpened;
	}

	// Toggle FAB widget
	Widget toggle() {
		return FloatingActionButton(
			backgroundColor: _animateColor.value,
			onPressed: animate,
			tooltip: 'Modify',
			child: Icon(currentIcon),
			heroTag: 'Modify',
		);
	}

	// Add entry FAB widget
	Widget addEntry() {
		return FloatingActionButton(
			backgroundColor: Colors.blue,
			onPressed: () {widget.onAddEntryTapped();},
			tooltip: 'Add Entry',
			child: Icon(Icons.add),
			heroTag: 'Add',
		);
	}

	@override
	void initState() {
		super.initState();

		currentIcon = isOpened ? mainAnimIcons[1] : mainAnimIcons[0];

		_animationController = AnimationController(
				vsync: this,
				duration: Duration(milliseconds: 200)
			)
			..addListener(() {
				setState(() {});
			});
		
		_animateColor = ColorTween(
				begin: Colors.blue,
				end: Colors.green,
			).animate(CurvedAnimation(
				parent: _animationController,
				curve: Interval(0.00, 1.00, curve: _curve),
			));
		
		_translateButton = Tween<double>(
				begin: _fabHeight,
				end: -14.0,
			).animate(CurvedAnimation(
				parent: _animationController,
				curve: Interval(0.0, 0.75, curve: _curve),
			));
		
		_scaleButton = Tween<double>(
				begin: 0.0,
				end: 1.0,
			).animate(CurvedAnimation(
				parent: _animationController,
				curve: Interval(0.0, 1.00, curve: _curve),
			));
	}

	@override
	dispose() {
		_animationController.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext buildContext) {
		return Column(
			children: <Widget>[
				Transform(
					transform: Matrix4.translationValues(
						0.0,
						_translateButton.value,
						0.0)
						..scale(_scaleButton.value),
					child: addEntry(),
				),
				toggle(),
			],
			mainAxisAlignment: MainAxisAlignment.end,
		);
	}
}