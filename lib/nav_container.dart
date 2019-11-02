import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class NavContainerWidget extends StatelessWidget {

	final double cardPadding = 6.0;

	final Widget body;

	NavContainerWidget({Key key, this.body}) : super(key: key);

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
					margin: EdgeInsets.only(top: _appBarHeight, bottom: _appBarHeight),
					padding: EdgeInsets.all(cardPadding),
				)
			),
			color: Theme.of(buildContext).backgroundColor,
		);
	}
}