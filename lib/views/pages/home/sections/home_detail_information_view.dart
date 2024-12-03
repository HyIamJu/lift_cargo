import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lift_cargo_control/shared/utils/date_formating.dart';

import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import '../../../../widgets/custom_row_list.dart';

class HomeDetailInformationView extends StatelessWidget {
  final String liftStatus;
  final int flex;

  const HomeDetailInformationView(
      {super.key, required this.liftStatus, required this.flex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: _borderStyle,
        // alasan pake listview karna biar engga overflow abangkuh kalau ditab kicik
        child: ListView(
          children: [
            // ----------------------------------------------
            // Detail information employee
            // ----------------------------------------------
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPUNjiFBSAEiCYZl0XHhfYc7jWxVPQMOJjwQ&s',
                    width: 180,
                    height: 260,
                    fit: BoxFit.cover,
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(4),
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.icPersonEmployee),
                          const Gap(4),
                          const Flexible(
                            child: Text(
                              'Detail Information Employee',
                              style: AppStyles.title1Medium,
                            ),
                          ),
                        ],
                      ),
                      const Gap(8),
                      const Text(
                        'Mochammad Adib Soedibyo',
                        style: AppStyles.title1SemiBold,
                      ),
                      const Gap(10),
                      const Text(
                        'Store',
                        style: AppStyles.title2Regular,
                      ),
                      const CustomRowList(
                        name: 'No Badge',
                        nameTextStyle: AppStyles.label1SemiBold,
                        nameFlex: 2,
                        desc: '200546',
                        descFlex: 4,
                        descTextStyle: AppStyles.title2Regular,
                      ),
                      const CustomRowList(
                        name: 'DIV',
                        nameFlex: 2,
                        nameTextStyle: AppStyles.label1SemiBold,
                        desc: 'GAD',
                        descFlex: 4,
                        descTextStyle: AppStyles.title2Regular,
                      ),
                      const CustomRowList(
                        name: 'Dept',
                        nameFlex: 2,
                        nameTextStyle: AppStyles.label1SemiBold,
                        desc: 'DOT',
                        descFlex: 4,
                        descTextStyle: AppStyles.title2Regular,
                      ),
                      const CustomRowList(
                        name: 'Line Code',
                        nameFlex: 2,
                        nameTextStyle: AppStyles.label1SemiBold,
                        desc: 'GA22-1A',
                        descFlex: 4,
                        descTextStyle: AppStyles.title2Regular,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(8),
            const Divider(),
            const Gap(8),
            // ----------------------------------------------
            // Detail Information Lift Cargo Control
            // ----------------------------------------------
            Row(
              children: [
                SvgPicture.asset(AppIcons.icDetailInformation),
                const Gap(6),
                const Flexible(
                  child: Text(
                    'Detail Information Lift Cargo Control',
                    style: AppStyles.title1Medium,
                  ),
                ),
              ],
            ),
            const Gap(8),
            const CustomRowList(
              name: 'Location',
              nameFlex: 2,
              nameTextStyle: AppStyles.label1SemiBold,
              desc: 'Cargo 1',
              descFlex: 5,
              descTextStyle: AppStyles.title2Regular,
            ),
            const Gap(8),
            CustomRowList(
              name: 'Status',
              nameFlex: 2,
              nameTextStyle: AppStyles.label1SemiBold,
              desc: liftStatus,
              descTextStyle: AppStyles.label2SemiBold,
              descFlex: 5,
            ),
            const Gap(8),
            CustomRowList(
              name: 'Date Time',
              nameFlex: 2,
              nameTextStyle: AppStyles.label1SemiBold,
              desc: formatDateString(DateTime.now().toString(),
                  toFormat: 'dd MMMM yyyy, HH:mm'),
              descFlex: 5,
              descTextStyle: AppStyles.title2Regular,
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration get _borderStyle => BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: AppColors.grey.shade400),
    );
