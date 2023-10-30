import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../MyWidgets/CustomDatePicker.dart';

class CustomDatePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _CustomDatePageState createState() => _CustomDatePageState();
}

class _CustomDatePageState extends State<CustomDatePage> {
  String? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  void handleDateSelected(DateTime date) {
    setState(() {
      selectedDate = DateFormat('dd-MM-yyyy').format(date);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Date Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CustomDatePicker(onDateSelected: handleDateSelected),
            const SizedBox(height: 20),
            Text(
              'Selected Date: $selectedDate',
              style: const TextStyle(fontSize: 24),
            ),
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
                    "The created date picker can be used on multiple pages. The date selected from the calendar is instantly displayed on the screen..", //Oluşturulan tarih seçici birden fazla sayfada kullanılabilir. Takvimden seçilen tarih anında ekranda görüntülenir.
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
