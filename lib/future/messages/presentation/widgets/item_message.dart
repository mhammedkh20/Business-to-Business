import 'package:b2b_app/core/components/full_screen_widget.dart';
import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/future/messages/models/message_model.dart';
import 'package:b2b_app/future/messages/presentation/widgets/audio_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemMessage extends StatelessWidget {
  const ItemMessage({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MessageModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            Align(
              alignment: item.typeMessage == TypeMessage.PERSON
                  ? Alignment.center
                  : item.sender
                      ? AlignmentDirectional.centerEnd
                      : AlignmentDirectional.centerStart,
              child: Row(
                mainAxisAlignment: item.typeMessage == TypeMessage.PERSON
                    ? MainAxisAlignment.center
                    : item.sender
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (item.typeMessage == TypeMessage.PERSON) ...[
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          MyContainerShape(
                            height: 70.r,
                            width: 70.r,
                            bgContainer: AppColors.BASE_COLOR,
                            borderRadius: 70,
                            child: const Icon(
                              Icons.person,
                              size: 40,
                              color: AppColors.WHITE,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          MyText(
                            title: 'محمد بن عبد الله',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 18.h),
                        ],
                      ),
                    )
                  ],
                  if (item.typeMessage == TypeMessage.TEXT) ...[
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      // 32 char
                      width: (MediaQuery.of(context).size.width - 142.w),
                      decoration: BoxDecoration(
                        color: item.sender
                            ? AppColors.WHITE6
                            : AppColors.BASE_COLOR,
                        borderRadius: item.sender
                            ? const BorderRadiusDirectional.only(
                                bottomEnd: Radius.circular(0),
                                bottomStart: Radius.circular(20),
                                topEnd: Radius.circular(20),
                                topStart: Radius.circular(20),
                              )
                            : const BorderRadiusDirectional.only(
                                bottomEnd: Radius.circular(20),
                                bottomStart: Radius.circular(0),
                                topEnd: Radius.circular(20),
                                topStart: Radius.circular(20),
                              ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: item.sender
                                          ? AlignmentDirectional.topEnd
                                          : AlignmentDirectional.topStart,
                                      child: MyText(
                                        title: item.message,
                                        color: item.sender
                                            ? AppColors.GRAY3
                                            : AppColors.WHITE,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Align(
                                      alignment: item.sender
                                          ? AlignmentDirectional.topEnd
                                          : AlignmentDirectional.topStart,
                                      child: MyText(
                                        title: '23 يونيو 2020 11:29 م',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: item.sender
                                            ? AppColors.GRAY3
                                            : AppColors.WHITE,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                  if (item.typeMessage == TypeMessage.PHOTO &&
                      item.image != null) ...[
                    Container(
                      height: 100.r,
                      width: 100.r,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Stack(
                        children: [
                          PositionedDirectional(
                            top: 0,
                            bottom: 0,
                            start: 0,
                            end: 0,
                            child: FullScreenWidget(
                              heroTag: item.id,
                              image: item.image!,
                              disposeLevel: DisposeLevel.Low,
                              child: Hero(
                                tag: "${item.id}",
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: InteractiveViewer(
                                    child: Image.file(
                                      item.image!,
                                      height: 100.r,
                                      width: 100.r,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          PositionedDirectional(
                              bottom: 10.h,
                              end: 10.w,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  MyText(
                                    title: '12:59 AM',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.GRAY,
                                  ),
                                  SizedBox(width: 5.w),
                                ],
                              ))
                        ],
                      ),
                    )
                  ],
                  if (item.typeMessage == TypeMessage.VOICE) ...[
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.h,
                      ),
                      // 32 char
                      decoration: BoxDecoration(
                        color: item.sender
                            ? AppColors.WHITE6
                            : AppColors.BASE_COLOR,
                        borderRadius: BorderRadius.circular(20.r),
                      ),

                      child: AudioMessageWidget(
                        message: item,
                        activeAudioSliderColor: item.sender
                            ? AppColors.BASE_COLOR
                            : AppColors.WHITE,
                        iconColor: item.sender
                            ? AppColors.BASE_COLOR
                            : AppColors.WHITE,
                        senderColor: AppColors.WHITE,
                        inActiveAudioSliderColor: AppColors.GRAY,
                      ),
                    ),
                  ]
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
