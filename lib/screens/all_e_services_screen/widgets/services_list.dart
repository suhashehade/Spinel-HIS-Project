import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_project/common/service.dart';
import 'package:his_project/utils/consts_res.dart';

class ServicesList extends StatelessWidget {
  const ServicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Service(
              serviceName: ConstRes.reserveAppointment.tr,
              serviceIcon: ConstRes.reserveAppointmentIcon,
            ),
            Service(
              serviceName: ConstRes.lifeCare.tr,
              serviceIcon: ConstRes.lifeCareIcon,
            ),
            Service(
              serviceName: ConstRes.emergency.tr,
              serviceIcon: ConstRes.emergencyIcon,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Service(
              serviceName: ConstRes.homeCare.tr,
              serviceIcon: ConstRes.homeCareIcon,
            ),
            Service(
              serviceName: ConstRes.comprehensiveExamination.tr,
              serviceIcon: ConstRes.comprehensiveExaminationIcon,
            ),
            Service(
              serviceName: ConstRes.pharmacy.tr,
              serviceIcon: ConstRes.pharmacyIcon,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Service(
              serviceName: ConstRes.fileDetails.tr,
              serviceIcon: ConstRes.fileDetailsIcon,
            ),
            Service(
              serviceName: ConstRes.familyFiles.tr,
              serviceIcon: ConstRes.familyFilesIcon,
            ),
            Service(
              serviceName: ConstRes.payment.tr,
              serviceIcon: ConstRes.visaIcon,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Service(
              serviceName: ConstRes.childrenVaccine.tr,
              serviceIcon: ConstRes.childrenVaccineIcon,
            ),
            Service(
              serviceName: ConstRes.insuranceUpdate.tr,
              serviceIcon: ConstRes.cardIcon,
            ),
            Service(
              serviceName: ConstRes.assignments.tr,
              serviceIcon: ConstRes.assignmentsIcon,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Service(
              serviceName: ConstRes.waterConsume.tr,
              serviceIcon: ConstRes.waterIcon,
            ),
            Service(
              serviceName: ConstRes.calculator.tr,
              serviceIcon: ConstRes.calculatorIcon,
            ),
            Service(
              serviceName: ConstRes.transformMesurments.tr,
              serviceIcon: ConstRes.twoWaysArrows,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Service(
              serviceName: ConstRes.tasks.tr,
              serviceIcon: ConstRes.tasksIcon,
            ),
            Service(
              serviceName: ConstRes.bloodDonation.tr,
              serviceIcon: ConstRes.bloodIcon,
            ),
            Service(
              serviceName: ConstRes.covid19.tr,
              serviceIcon: ConstRes.covid19Icon,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Service(
              serviceName: ConstRes.virtualTour.tr,
              serviceIcon: ConstRes.view360Icon,
            ),
            Service(
              serviceName: ConstRes.smartWatches.tr,
              serviceIcon: ConstRes.smartWatchIcon,
            ),
            Service(
              serviceName: ConstRes.parking.tr,
              serviceIcon: ConstRes.parkingIcon,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Service(
              serviceName: ConstRes.news.tr,
              serviceIcon: ConstRes.microphoneIcon,
            ),
            Service(
              serviceName: ConstRes.contactUs.tr,
              serviceIcon: ConstRes.contactUsIcon,
            ),
          ],
        )
      ],
    );
  }
}
