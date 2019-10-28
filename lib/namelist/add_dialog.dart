import 'package:flutter/material.dart';
import 'package:pstate_app/consts.dart';

class AddDialog extends StatefulWidget {

	AddDialogState createState() => AddDialogState();
}

class AddDialogState extends State<AddDialog> {
	
	static const borderRadius = Consts.borderRadius;

	static const List<String> ranks = ['PTE', 'LCP', 'CPL', 'CFC', 'ME1', 'ME2', 'ME3'];

	String currentRankSel = 'PTE';
	
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
							decoration: InputDecoration(
								border: OutlineInputBorder(),
								labelText: 'Full Name',
								hintText: 'Full Name',
							),
							textCapitalization: TextCapitalization.words,
							autocorrect: false,
						),
					],
					crossAxisAlignment: CrossAxisAlignment.start,
				),
			)
		);
  	}

}