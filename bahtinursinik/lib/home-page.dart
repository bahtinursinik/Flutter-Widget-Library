import 'package:bahtinursinik/MyWidgets/CreditCardDesign.dart';
import 'package:bahtinursinik/MyWidgets/ResponsibleDataTable.dart';
import 'package:bahtinursinik/pages/custom_date_picker.dart';
import 'package:bahtinursinik/pages/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class MyWidgetLibrary extends StatefulWidget {
  const MyWidgetLibrary({super.key});

  @override
  State<MyWidgetLibrary> createState() => _MyWidgetLibraryState();
}

class _MyWidgetLibraryState extends State<MyWidgetLibrary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "My Widget Library",
        style: TextStyle(color: Colors.white),
      )),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: DashboardItem(
                    title: 'Text Form Field',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TextFormFieldDesign(),
                          ));
                    },
                  ),
                ),
                Expanded(
                  child: DashboardItem(
                    title: 'Date Picker',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomDatePage(),
                          ));
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: DashboardItem(
                    title: 'Datatable',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResponsibleDataTable(),
                          ));
                    },
                  ),
                ),
                Expanded(
                  child: DashboardItem(
                    title: 'Bank Card',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreditCard(),
                          ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final String title;
  final Function? onTap;

  const DashboardItem({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      child: InkWell(
        onTap: () async {
          onTap!();
        },
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 22.0),
          ),
        ),
      ),
    );
  }
}
