class Personnel {

	String rank;

	String fullName;

	bool isRegular;


	Personnel({this.rank, this.fullName, this.isRegular});

	String get getRankName => '$rank $fullName';
}