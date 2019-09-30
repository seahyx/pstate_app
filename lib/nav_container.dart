import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class NavContainerWidget extends StatelessWidget {

	final double cardPadding = 8.0;

	final Widget body;

	final BoxDecoration decoration;

	NavContainerWidget(this.body, this.decoration);

	@override
	Widget build(BuildContext buildContext) {

		// Get height of a standard AppBar
		AppBar appBar = AppBar(title: Text('Placeholder'),);
		final _appBarHeight = appBar.preferredSize.height;

		return Container(
			child: SafeArea(
				child: Container(
					child: SingleChildScrollView(
						child: body,
					),
					margin: EdgeInsets.fromLTRB(0.0, _appBarHeight, 0.0, _appBarHeight),
					padding: EdgeInsets.all(cardPadding),
				)
			),
			decoration: decoration,
		);
	}
}