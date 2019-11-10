import 'package:pstate_app/obj_classes/personnel.dart';
import 'package:intl/intl.dart';

/// Singleton for personnel and parade state data

class NamelistManager {

	static final NamelistManager _namelistManager = NamelistManager._internal();

	factory NamelistManager() {
		return _namelistManager;
	}

	NamelistManager._internal();



	List<Personnel> namelist;

	Map<DateTime, Map<Personnel, ParadeStatus>> paradeState;

	void init() {
		// TODO get namelist from server
	}

	void refresh() {
		// TODO get namelist from server
	}


	void addPersonnel(Personnel personnel) {
		namelist.add(personnel);
	}

	void addStatus(DateTime date, Personnel personnel, ParadeStatus status) {

		DateTime cleanDate = formatDate(date);

		// Gets state list if date exists, otherwise create empty state list on new date
		Map<Personnel, ParadeStatus> stateList = paradeState.putIfAbsent(
			cleanDate,
			() => Map<Personnel, ParadeStatus>()	// Create empty state list
		);

		// Updates parade state if it exists; adds if not
		stateList.update(personnel, (oldStatus) => status, ifAbsent: () => status);
	}

	String generateStatePersonnel(DateTime date, Personnel personnel) {
		
		DateTime cleanDate = formatDate(date);

		ParadeStatus status;

		print('${status == null}');

		if (paradeState.containsKey(cleanDate)) {
			if (paradeState[cleanDate].containsKey(personnel)) {
				status = paradeState[cleanDate][personnel];
			}
		}

		return status == null ? null : '${personnel.getRankName} - ${status.generateString}';
	}

	String generateStateAll(DateTime date) {

		DateTime cleanDate = formatDate(date);

		if (!paradeState.containsKey(cleanDate)) {
			return null;

		} else {

			DateFormat formatter = DateFormat('ddMMyy');

			String result = 'Parade state for ${formatter.format(cleanDate)}\n\n';

			paradeState[cleanDate].forEach((personnel, status) {
				result += '${personnel.getRankName} - ${generateStatePersonnel(cleanDate, personnel) ?? ''}\n';
			});

			print(result);

			return result;
		}
	}

	DateTime formatDate(DateTime date) => DateTime(date.year, date.month, date.day);

}

class ParadeStatus {

	// List of common parade states
	static const List states = [
		'NSDC',
		'P',
		'OFF',
		'GD',
		'MA',
		'MC',
		'LL',
		'OL',
	];

	String stateAM;
	String statePM;

	DateTime startDate;
	DateTime endDate;


	ParadeStatus({this.stateAM, this.statePM, this.startDate, this.endDate});


	bool get hasDate => this.startDate != null && this.endDate != null;

	bool get hasState => this.stateAM != null;

	String generateString() {
		if (hasState) {
			return hasDate ? '$stateAM TILL $endDate' : statePM == null ? '$stateAM' : '$stateAM/$statePM';
		} else {
			return "";
		}
	}
}