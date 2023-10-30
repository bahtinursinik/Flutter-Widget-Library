import 'package:flutter/material.dart';

class ResponsibleDataTable extends StatelessWidget {
  final List<Map<String, dynamic>> data = [
    {
      'id': 1,
      'name': 'Bahtınur SİNİK',
      'email': 'bahtinurrsinikk@gmail.com',
      'age': 25,
    },
    {
      'id': 2,
      'name': 'Name Surname',
      'email': 'namesurname@example.com',
      'age': 28,
    },
    //other data
  ];

  ResponsibleDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive DataTable Example'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('No')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('E-posta')),
            DataColumn(label: Text('Age')),
          ],
          rows: data.map((item) {
            return DataRow(
              cells: [
                DataCell(Text(item['id'].toString())),
                DataCell(Text(item['name'])),
                DataCell(Text(item['email'])),
                DataCell(Text(item['age'].toString())),
              ],
            );
          }).toList(),
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
                    "The DataTable widget has various features such as column sorting, row selection, custom cell formatting, and customization of headers and cells..", //DataTable widget'ında sütun sıralama, satır seçimi, özel hücre biçimlendirme ve başlıkların ve hücrelerin özelleştirilmesi gibi çeşitli özellikler bulunur.
                  ),
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
