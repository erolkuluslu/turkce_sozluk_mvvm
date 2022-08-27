import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk_mvvm/viewmodels/meaning_list_view_model.dart';
import 'package:turkce_sozluk_mvvm/views/mean_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ChangeNotifierProvider(
        create: (context) => MeaningListViewModel(),
        child: const MeanListPage(),
      ),
    );
  }
}
