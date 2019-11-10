import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:pstate_app/namelist/add_dialog.dart';
import 'package:pstate_app/obj_classes/personnel.dart';
import 'expandable_fab.dart';

class NamelistWidget extends StatefulWidget {

	NamelistWidget({Key key}) : super(key: key);

	@override
	_NamelistWidgetState createState() => _NamelistWidgetState();
}

class _NamelistWidgetState extends State<NamelistWidget> {

	BuildContext buildContext;

	List<Personnel> _nameList = [
		Personnel(rank: 'ME3', fullName: 'Lua'),
		Personnel(rank: 'LCP', fullName: 'Jackson Tiong'),
		Personnel(rank: 'LCP', fullName: 'Seah Ying Xiang'),
		Personnel(rank: 'LCP', fullName: 'Law Kok Mun'),
		Personnel(rank: 'PTE', fullName: 'Ong Zheng Da'),
	];

	void onAddDialogDone(BuildContext buildContext, Personnel person) {
		Navigator.pop(buildContext);
		setState(() {
			_nameList.add(person);
		});
	}

	void onAddEntryTapped() {
		showDialog(
			context: buildContext,
			builder: (buildContext) {
				return AddDialog(onDonePressed: onAddDialogDone,);
			}
		);
	}
	
	@override
	Widget build(BuildContext buildContext) {
		this.buildContext = buildContext;

		return Scaffold(
			appBar: AppBar(
				title: Text('Name List'),
			),
			body: _nameListWidget(buildContext),
			floatingActionButton: ExpandableFab(
				onAddEntryTapped: onAddEntryTapped,
			),
		);
	}

	Widget _nameListWidget(BuildContext buildContext) {
		return ListView.separated(
			itemCount: _nameList.length,
			itemBuilder: (buildContext, index) {
				return ListTile(
					title: Text('${_nameList[index].rank} ${_nameList[index].fullName}'),
						onTap: () {
							print('${_nameList[index].rank} ${_nameList[index].fullName}');
						},
				);
			},
			separatorBuilder: (buildContext, index) {
				return Divider(
					height: 0,
				);
			},
		);
	}
}