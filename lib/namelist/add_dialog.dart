import 'package:flutter/material.dart';
import 'package:pstate_app/consts.dart';
import 'package:pstate_app/obj_classes/person.dart';

class AddDialog extends StatefulWidget {

	final void Function(BuildContext, Person) onDonePressed;

	final VoidCallback onCancelPressed;

	AddDialog({this.onDonePressed, this.onCancelPressed});

	AddDialogState createState() => AddDialogState();
}

class AddDialogState extends State<AddDialog> {
	
	static const borderRadius = Consts.borderRadius;

	static const List<String> ranks = ['REC', 'PTE', 'LCP', 'CPL', 'CFC', 'SCT', '3SG', 'ME1', 'ME2', 'ME3', 'ME4', 'ME5', 'ME6', 'ME7', 'ME8'];

	String currentRankSel = ranks[0];

	final TextEditingController nameFieldController = TextEditingController();

	bool doneEnabled = false;

	@override
	void dispose() {
		nameFieldController.dispose();

		super.dispose();
	}
	
	@override
	Widget build(BuildContext buildContext) {
		return AlertDialog(
			title: Text('Add Entry'),
			content: SingleChildScrollView(
				child: Column(
					children: <Widget>[
						DropdownButton<String>(
							value: currentRankSel,
							items: ranks.map<DropdownMenuItem<String>>(
								(String value) {
									return DropdownMenuItem<String>(
										value: value,
										child: Text(value),
									);
								}
							).toList(),
							onChanged: (String newValue) {
								setState(() {
									currentRankSel = newValue;
								});
							},
						),
						SizedBox(height: 2,),
						TextField(
							controller: nameFieldController,
							decoration: InputDecoration(
								border: OutlineInputBorder(),
								labelText: 'Full Name',
								hintText: 'Full Name',
							),
							textCapitalization: TextCapitalization.words,
							autocorrect: false,
							onChanged: (text) {
								if (text.length != 0) {
									if (!doneEnabled) {
										setState(() {
											doneEnabled = true;
										});
									}
								} else {
									if (doneEnabled) {
										setState(() {
											doneEnabled = false;
										});
									}
								}
							},
						),
					],
					crossAxisAlignment: CrossAxisAlignment.start,
				),
			),
			actions: <Widget>[
				FlatButton(
					child: Text('Cancel'),
					onPressed: widget.onCancelPressed ?? () {
						Navigator.pop(buildContext);
					},
					textColor: Colors.red,
				),
				FlatButton(
					child: Text('Done'),
					onPressed: !doneEnabled ? null : () {
						Person person = Person(
							rank: currentRankSel,
							fullName: nameFieldController.text
						);
						widget.onDonePressed(buildContext, person);
					},
				),
			],
		);
  	}

}