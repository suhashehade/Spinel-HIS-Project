import 'package:flutter/widgets.dart';
import 'package:his_project/utils/assets.dart';

class PatientInfoSection extends StatelessWidget {
  const PatientInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          SizedBox(
            height: 30.0,
            width: 30.0,
            child: ConstAssets.userIcon,
          ),
        ],
      ),
    );
  }
}
