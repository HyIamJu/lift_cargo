import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lift_cargo_control/constants/app_assets.dart';
import 'package:lift_cargo_control/constants/app_colors.dart';

import '../../../constants/app_styles.dart';
import '../../../shared/utils/date_formating.dart';
import '../../../widgets/custom_container_button.dart';
import '../../dialogs/error_dialog.dart';

class Loginview extends StatelessWidget {
  const Loginview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 17),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----------------------------------------------
            // DATEFORMAT SECTION
            // ----------------------------------------------
            _dateFormatSection(),
            const Gap(14),
            // ----------------------------------------------
            // SCAN BADGES
            // ----------------------------------------------
            _scanBadgeSection(context),
          ],
        ),
      ),
    );
  }

  Expanded _scanBadgeSection(BuildContext context) {
    return Expanded(
      flex: 8,
      child: GestureDetector(
        onTap: () {
          context.goNamed('home');
        },
        onDoubleTap: () {
          showErrorDialog(
            context,
            title: 'Badge kamu belum terdaftar',
            desc: 'Silahkan daftarkan badge kamu agar memiliki akses',
            miliseconds: 2000,
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: _borderStyle,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.icYourBadge),
              const Text(
                'Silahkan tap badge kamu disebelah layar!',
                style: AppStyles.title2Medium,
              ),
              const Text(
                'Agar bisa menggunakan cargo lift.',
                style: AppStyles.label2Regular,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _dateFormatSection() {
    return Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: _borderStyle,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              formatDateString(DateTime.now().toString(), toFormat: "HH:mm"),
              style: AppStyles.heading1SemiBold,
            ),
            const Gap(12),
            Text(
              formatDateString(
                DateTime.now().toString(),
                toFormat: "dd MMM yyyy",
              ),
              style: AppStyles.label1Regular,
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // const Text(
          //   '21 Agustus 2024, 15.10',
          //   style: AppStyles.label1SemiBold,
          // ),
          const Spacer(),
          CustomContainerButton(
            iconPath: SvgPicture.asset(AppIcons.icHistory),
            text: 'History',
            onTap: () {
              context.goNamed('history');
            },
          )
        ],
      ),
    );
  }
}

BoxDecoration get _borderStyle => BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: AppColors.grey.shade400),
    );
