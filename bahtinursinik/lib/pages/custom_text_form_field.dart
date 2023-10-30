import 'package:bahtinursinik/MyWidgets/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldDesign extends StatefulWidget {
  const TextFormFieldDesign({super.key});

  @override
  State<TextFormFieldDesign> createState() => _TextFormFieldDesignState();
}

class _TextFormFieldDesignState extends State<TextFormFieldDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Form Field Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            heightSpacer(20),
            CustomTextFormField(
              hintText: ("Name"),
            ),
            heightSpacer(20),
            CustomTextFormField(
              hintText: ("Phone"),
              keyboardType: TextInputType.phone,
            ),
            heightSpacer(20),
            CustomTextFormField(
              hintText: ("E mail"),
              keyboardType: TextInputType.emailAddress,
            ),
            heightSpacer(20),
            CustomTextFormField(
              hintText: ("TC No"),
              keyboardType: TextInputType.number,
              inputFormatter: [
                LengthLimitingTextInputFormatter(11),
              ],
            ),
            heightSpacer(20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  title: const Text(
                    "In these textform areas, the keyboard type was changed according to different uses, a single special widget was changed and whichever was needed was created and used.", //Bu textformfieldlarda farklı kullanımlar için keyboard type değiştirilmiş ve hangisi lazımsa tek bir custom widget oluşturularak değiştirilerek kullanılmıştır.
                  ),
                  // content: content,
                  actions: [
                    ElevatedButton(
                        child: const Text(
                          "Ok",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ],
                );
              });
        },
        child: const Icon(Icons.question_mark),
      ),
    );
  }
}

Widget heightSpacer(double myHeight) => SizedBox(height: myHeight);
