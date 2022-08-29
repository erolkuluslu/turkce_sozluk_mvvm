
import 'package:flutter/material.dart';
class SignLanguage extends StatelessWidget {
  final String word;
  const SignLanguage({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double cardHeight=150;
    double cardWidth=88;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(width: 10),
        Expanded(
          child: SizedBox(
            width: width,
            height: height * 0.12,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: word.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: cardWidth,
                          height: cardHeight,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Image.network(
                                'https://sozluk.gov.tr/assets/img/isaret/${word[index]}.gif'),
                          ),
                        ),
                      ),
                      Text(
                        word[index].toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  );
                }),
          ),
        ),
        const SizedBox(width: 10),
      ],

    );
  }
}
