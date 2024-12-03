import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lift_cargo_control/shared/extenstions/context_extenstion.dart';
import 'package:lift_cargo_control/shared/utils/date_formating.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_styles.dart';
import '../../../widgets/custom_container_button.dart';
import '../../dialogs/menu_dialog_settings.dart';
import 'sections/home_button_section_view.dart';
import 'sections/home_detail_information_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String liftStatus = '-';
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 17),
        child: Row(
          children: [
            // ----------------------------------------------
            // INFORMATION EMPLOYEE
            // ----------------------------------------------
            HomeDetailInformationView(
              liftStatus: liftStatus,
              flex: 3,
            ),
            const Gap(14),
            // ----------------------------------------------
            // BUTTON LIFT CARGO
            // ----------------------------------------------
            HomeButtonSectionView(
              flex: 2,
              onLiftStatusChanged: (String newStatus) {
                setState(() {
                  liftStatus = newStatus;
                });
              },
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            formatDateString(
              DateTime.now().toString(),
              toFormat: "dd MMMM yyyy, HH:mm",
            ),
            style: AppStyles.label1SemiBold,
          ),
          const Spacer(),
          SizedBox(
            height: context.fullHeight * 0.048,
            width: context.fullWidth * 0.12,
            child: Opacity(
              opacity: 0,
              child: TextField(
                keyboardType: TextInputType.none,
                controller: _controller,
                onTap: () {
                  _focusNode.requestFocus();
                },
                onEditingComplete: () {
                  print(
                      " result ---------------------- ${_controller.text} ----------------------");
                  _controller.clear();
                  _focusNode.requestFocus();
                },
                focusNode: _focusNode,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                  focusedBorder: _borderStyle,
                  enabledBorder: _borderStyle,
                  errorBorder: _borderStyle,
                  focusedErrorBorder: _borderStyle,
                ),
              ),
            ),
          ),
          const Gap(8),
          CustomContainerButton(
            iconPath: SvgPicture.asset(AppIcons.icHistory),
            text: 'History',
            onTap: () {
              context.goNamed('history');
            },
          ),
          const Gap(8),
          CustomContainerButton(
            iconPath: SvgPicture.asset(AppIcons.icSettings),
            text: 'Settings',
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => const MenuDialogSettings());
            },
          ),
          const Gap(8),
          CustomContainerButton(
            iconPath: SvgPicture.asset(AppIcons.icLogOut),
            text: 'Log Out',
            onTap: () {
              context.goNamed('login');
            },
          ),
        ],
      ),
    );
  }
}

OutlineInputBorder get _borderStyle => OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.r8),
      borderSide: BorderSide(
        color: AppColors.grey.shade400,
        width: AppSizes.s1,
      ),
    );
