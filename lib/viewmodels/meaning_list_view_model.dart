import 'package:flutter/material.dart';
import 'package:turkce_sozluk_mvvm/page_status.dart';
import 'package:turkce_sozluk_mvvm/services/dictionary_service.dart';
import 'package:turkce_sozluk_mvvm/viewmodels/meaning_view_model.dart';

class MeaningListViewModel extends ChangeNotifier{
  late MeaningViewModel meaningViewModel;
  PageStatus status= PageStatus.initial;
  Future<void> getMeanings(String word)async{
    status= PageStatus.loading;
    List<String> meanings =await DictionaryService().searchWord(word);
    meaningViewModel= MeaningViewModel(word: word, meanings: meanings);
    status= meanings.isNotEmpty ? PageStatus.success : PageStatus.notfound;
    notifyListeners();
  }

}