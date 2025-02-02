import 'dart:developer';

import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_icon_button.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/future/messages/presentation/manager/messages_cubit/messages_cubit.dart';
import 'package:b2b_app/future/messages/presentation/widgets/item_record_voice.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextFieldChat extends StatelessWidget {
  final VoidCallback onPressedSendMessage;
  final VoidCallback onPressedSelectImage;
  final VoidCallback onPressedPickImage;
  final VoidCallback onPressedVoiceMessage;
  final VoidCallback onTap;
  final Function(String?, bool)? handleRecord;
  final TextEditingController controller;
  final FocusNode focusNode;

  const MyTextFieldChat({
    required this.onPressedSendMessage,
    required this.onPressedSelectImage,
    required this.onPressedPickImage,
    required this.onPressedVoiceMessage,
    required this.controller,
    required this.focusNode,
    required this.handleRecord,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesCubit, MessagesState>(
      builder: (context, state) {
        bool enabled = MessagesCubit.get(context).enabledOptionChat;
        if (MessagesCubit.get(context).selectRecordMessage) {
          return MyItemRecordVoice(
            recordinNoteHintText:
                AppLocalizations.of(context)!.recordingInProgress,
            onSlideToCancelRecord: () {
              log('sssssssss');
            },
            handleImageSelect: (XFile file) {},
            handleRecord: handleRecord,
            containerColor: Colors.white,
            imageAttachmentFromGalary: 'imageAttachmentFromGalary',
            imageAttachmentFromCamery: 'imageAttachmentFromCamery',
            imageAttachmentCancelText: 'imageAttachmentCancelText',
            imageAttachmentTextColor: Colors.white30,
            disableInput: false,
          );
        } else {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: AppColors.WHITE,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 5,
                  blurRadius: 20,
                  color: AppColors.BLACK.withOpacity(.05),
                ),
              ],
            ),
            child: Row(
              children: [
                SizedBox(width: 8.w),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1000),
                  child: MyContainerShape(
                    borderRadius: 20,
                    bgContainer: AppColors.BASE_COLOR,
                    child: enabled
                        ? MyIconButton(
                            iconData: Icons.close,
                            colorIcon: AppColors.WHITE,
                            onPressed: () {
                              MessagesCubit.get(context).changeEnabledOption();
                            },
                          )
                        : MyIconButton(
                            colorIcon: AppColors.WHITE,
                            iconData: Icons.add,
                            onPressed: () {
                              MessagesCubit.get(context).changeEnabledOption();
                            },
                          ),
                  ),
                ),
                SizedBox(width: 8.w),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: SizedBox(
                    width: enabled ? 150.w : 0,
                    child: Row(
                      children: [
                        MyContainerShape(
                          borderRadius: 20,
                          bgContainer: AppColors.BASE_COLOR,
                          child: MyIconButton(
                            svgPath: 'assets/images/ic_image.svg',
                            onPressed: onPressedSelectImage,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        MyContainerShape(
                          borderRadius: 20,
                          bgContainer: AppColors.BASE_COLOR,
                          child: MyIconButton(
                            svgPath: 'assets/images/ic_camera.svg',
                            onPressed: onPressedPickImage,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (enabled) ...[
                  const Expanded(child: SizedBox()),
                ] else ...[
                  Expanded(
                    child: TextField(
                      controller: controller,
                      focusNode: focusNode,
                      minLines: 1,
                      onTap: onTap,
                      maxLines: 5,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        fillColor: AppColors.TRANSPARENT,
                        filled: true,
                        hintStyle: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.GRAY3,
                          fontFamily: 'Montserrat',
                        ),
                        hintText: AppLocalizations.of(context)!.writeAMessage,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
                GestureDetector(
                  onTap: onPressedVoiceMessage,
                  child: SvgPicture.asset(
                    'assets/images/ic_mic.svg',
                    width: 24.r,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 8.r),
                  child: GestureDetector(
                    onTap: onPressedSendMessage,
                    child: SvgPicture.asset(
                      'assets/images/ic_send_message.svg',
                      width: 40.r,
                      height: 40.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
