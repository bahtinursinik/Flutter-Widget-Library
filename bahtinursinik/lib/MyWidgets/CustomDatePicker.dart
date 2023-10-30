import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const CustomDatePicker({Key? key, required this.onDateSelected})
      : super(key: key);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.onDateSelected(picked); // Seçilen tarihi geri bildirin
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ElevatedButton.icon(
          icon: const Icon(Icons.calendar_month),
          onPressed: () => _selectDate(context),
          label: const Text('Select Date'),
          style: ElevatedButton.styleFrom(minimumSize: const Size(350, 50)),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
