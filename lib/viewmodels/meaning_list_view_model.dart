import 'package:flutter/material.dart';
import 'package:turkce_sozluk_mvvm/page_status.dart';
import 'package:turkce_sozluk_mvvm/services/dictionary_service.dart';
import 'package:turkce_sozluk_mvvm/viewmodels/meaning_view_model.dart';
enum Status { initial, loading, notfound, success }

class MeaningListViewModel extends ChangeNotifier{

   MeaningViewModel meaningViewModel= MeaningViewModel(word: '' ,meanings: []);
   Status status= Status.initial;
  Future<void> getMeanings(String word)async{
    status= Status.loading;
    notifyListeners();
    List<String> meanings =await DictionaryService().searchWord(word);
    meaningViewModel= MeaningViewModel(word: word, meanings: meanings);
    status= meanings.isNotEmpty ? Status.success : Status.notfound;
    notifyListeners();
  }

}