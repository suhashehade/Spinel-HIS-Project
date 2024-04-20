import 'package:flutter/material.dart';
import 'package:his_project/screens/pathology_test_screen/widgets/pathology_test_item.dart';
import 'package:his_project/utils/consts_res.dart';

class PathologyTestList extends StatelessWidget {
  const PathologyTestList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ConstRes.pathologyList
          .map((t) => PathologyTestItem(
                doctorName: t.doctorName,
                testName: t.testName,
                departmentName: t.departmentName,
                date: t.date,
                status: t.status,
              ))
          .toList(),
    );
  }
}
