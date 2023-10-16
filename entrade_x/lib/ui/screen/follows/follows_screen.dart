import 'package:flutter/material.dart';

class IDataTable extends StatefulWidget {
  const IDataTable({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IDataTableState createState() => _IDataTableState();
}

class _IDataTableState extends State<IDataTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DataTable(
            columns: const [
              DataColumn(label: Text("Col#1")),
              DataColumn(label: Text("Col#2")),
              DataColumn(label: Text("Col#3")),
            ],
            rows: List.generate(
              5,
              (index) => DataRow(cells: [
                DataCell(Text("R#$index")),
                DataCell(Text("R#$index + 1")),
                DataCell(Text("R#3$index + 2")),
              ]),
            )),
      ),
    );
  }
}
