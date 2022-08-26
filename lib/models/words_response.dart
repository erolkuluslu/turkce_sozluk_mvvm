class WordsResponse {
  List<MeaningList>? meaningList;
  WordsResponse({this.meaningList});
  WordsResponse.fromJson(Map<String, dynamic> json) {
    if (json['anlamlarListe'] != null) {
      json["anlamlarliste"]
          .forEach((a) => meaningList?.add(MeaningList.fromJson(a)));
    }
    ;
  }
}

class MeaningList {
  String? meaning;
  MeaningList({this.meaning});
  MeaningList.fromJson(Map<String, dynamic> json) {
    meaning = json['anlam'];
  }
}
