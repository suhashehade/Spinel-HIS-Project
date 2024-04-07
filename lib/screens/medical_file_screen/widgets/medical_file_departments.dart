import 'package:flutter/material.dart';
import 'package:his_project/screens/medical_file_screen/widgets/medical_file_department.dart';

class MedicalFileDepartments extends StatelessWidget {
  const MedicalFileDepartments({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            MedicalFileDepartment(
              depName: "قائمة بمواعيدي",
              depIcon:
                  '<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><path fill="#8DC63F" d="M19 19H5V8h14m-3-7v2H8V1H6v2H5c-1.11 0-2 .89-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2h-1V1m-1 11h-5v5h5z"/></svg>',
            ),
            MedicalFileDepartment(
              depName: "نتائج تحليل المختبر",
              depIcon:
                  '<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 32 32"><path fill="#8DC63F" d="m22.12 24.438l-3.36-7.847c-.33-.768-.6-2.08-.6-2.916s.513-1.52 1.14-1.52s1.14-.514 1.14-1.14s-.684-1.14-1.52-1.14h-6.84c-.836 0-1.52.512-1.52 1.14s.513 1.14 1.14 1.14s1.14.684 1.14 1.52s-.27 2.148-.6 2.917L8.88 24.44c-.33.768-.6 1.74-.6 2.157s.342 1.103.76 1.52s1.444.76 2.28.76h8.36c.835 0 1.86-.34 2.28-.76s.76-1.102.76-1.52s-.27-1.39-.6-2.157zM16.583 7.625a1.082 1.082 0 1 0 2.166 0a1.083 1.083 0 1 0-2.166.001zm-2.915.167a.5.5 0 1 0 0-1a.5.5 0 0 0 0 1m1.917-2.5a1.584 1.584 0 1 0-.002-3.164a1.584 1.584 0 0 0 .002 3.162z"/></svg>',
            ),
            MedicalFileDepartment(
              depName: "الأشعة صور وتقارير",
              depIcon:
                  '<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 20 20"><path fill="#8DC63F" d="M11 13.5a.5.5 0 1 1 1 0a.5.5 0 0 1-1 0M7.5 13a.5.5 0 1 0 0 1a.5.5 0 0 0 0-1M3 4.5A2.5 2.5 0 0 1 5.5 2h8A2.5 2.5 0 0 1 16 4.5v11a2.5 2.5 0 0 1-2.5 2.5h-8A2.5 2.5 0 0 1 3 15.5zm7 1a.5.5 0 0 0-1 0V6H7.5a.5.5 0 0 0 0 1H9v1H6.5a.5.5 0 0 0 0 1H9v1H6.5a.5.5 0 0 0 0 1H9v1H7.5a1.5 1.5 0 1 0 1.415 1h1.17a1.5 1.5 0 1 0 1.415-1H10v-1h2.5a.5.5 0 0 0 0-1H10V9h2.5a.5.5 0 0 0 0-1H10V7h1.5a.5.5 0 0 0 0-1H10z"/></svg>',
            ),
          ],
        ),
        Row(
          children: [
            MedicalFileDepartment(
              depName: "الأدوية النشطة",
              depIcon:
                  '<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><path fill="#8DC63F" d="m20.91 13.332l-7.578 7.577a5.41 5.41 0 0 0 7.577-7.577"/><path fill="#8DC63F" fill-rule="evenodd" d="m12.235 19.885l7.65-7.65l-8.12-8.12l-7.65 7.65zm-2.356-8.592a1 1 0 1 1-1.414 1.414a1 1 0 0 1 1.414-1.414m2.828 4.243a1 1 0 1 0-1.414-1.415a1 1 0 0 0 1.414 1.415m0-7.071a1 1 0 1 1-1.414 1.414a1 1 0 0 1 1.414-1.414m2.828 4.242a1 1 0 1 0-1.414-1.414a1 1 0 0 0 1.414 1.414" clip-rule="evenodd"/><path fill="#8DC63F" d="m3.09 10.668l7.578-7.577a5.41 5.41 0 0 0-7.577 7.577"/></svg>',
            ),
            MedicalFileDepartment(
              depName: "المؤشرات الحيوية",
              depIcon:
                  '<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><path fill="#8DC63F" d="M7.5 4A5.5 5.5 0 0 0 2 9.5c0 .5.09 1 .22 1.5H6.3l1.27-3.37c.3-.8 1.48-.88 1.86 0L11.5 13l.59-1.42c.13-.33.48-.58.91-.58h8.78c.13-.5.22-1 .22-1.5A5.5 5.5 0 0 0 16.5 4c-1.86 0-3.5.93-4.5 2.34C11 4.93 9.36 4 7.5 4M3 12.5a1 1 0 0 0-1 1a1 1 0 0 0 1 1h2.44L11 20c1 .9 1 .9 2 0l5.56-5.5H21a1 1 0 0 0 1-1a1 1 0 0 0-1-1h-7.6l-.93 2.3c-.4 1.01-1.55.87-1.92.03L8.5 9.5l-.96 2.33c-.15.38-.49.67-.94.67z"/></svg>',
            ),
            MedicalFileDepartment(
              depName: "الوصفات الطبية",
              depIcon:
                  '<svg xmlns="http://www.w3.org/2000/svg" width="0.75em" height="1em" viewBox="0 0 384 512"><path fill="#8DC63F" d="M64 0C28.7 0 0 28.7 0 64v384c0 35.3 28.7 64 64 64h256c35.3 0 64-28.7 64-64V160H256c-17.7 0-32-14.3-32-32V0zm192 0v128h128zm-96 240c0-8.8 7.2-16 16-16h32c8.8 0 16 7.2 16 16v48h48c8.8 0 16 7.2 16 16v32c0 8.8-7.2 16-16 16h-48v48c0 8.8-7.2 16-16 16h-32c-8.8 0-16-7.2-16-16v-48h-48c-8.8 0-16-7.2-16-16v-32c0-8.8 7.2-16 16-16h48z"/></svg>',
            ),
          ],
        ),
      ],
    );
  }
}
