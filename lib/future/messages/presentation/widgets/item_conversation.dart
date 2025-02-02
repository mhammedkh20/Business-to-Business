import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/future/messages/models/conversation_model.dart';
import 'package:b2b_app/future/messages/presentation/manager/messages_cubit/messages_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemConversation extends StatelessWidget {
  final ConversationModel conversation;
  final int index;
  final GestureTapCallback? onTap;
  final Function(bool?)? onChangedSelected;

  const ItemConversation({
    Key? key,
    required this.conversation,
    required this.index,
    required this.onTap,
    required this.onChangedSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: AppColors.TRANSPARENT,
          child: Slidable(
            key: ValueKey('${conversation.id}'),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {
                MessagesCubit.get(context).deleteConversation(conversation.id);
              }),
              children: [
                SlidableAction(
                  onPressed: (BuildContext context) {
                    MessagesCubit.get(context)
                        .deleteConversation(conversation.id);
                  },
                  backgroundColor: AppColors.RED,
                  foregroundColor: AppColors.WHITE,
                  icon: Icons.delete,
                  label: AppLocalizations.of(context)!.delete,
                ),
              ],
            ),
            child: Theme(
              data:
                  ThemeData(splashColor: AppColors.BASE_COLOR.withOpacity(.5)),
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(20.r),
                child: MyContainerShape(
                  enableShadow: false,
                  paddingHorizontal: 16,
                  paddingVertical: 16,
                  bgContainer: AppColors.TRANSPARENT,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyContainerShape(
                        height: 35.r,
                        width: 35.r,
                        bgContainer: AppColors.BASE_COLOR,
                        borderRadius: 30,
                        enableShadow: false,
                        child: conversation.image == null
                            ? const Icon(
                                Icons.person,
                                color: AppColors.WHITE,
                              )
                            : Image.asset(
                                'assets/images/message/image_massage.png',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  title: conversation.title,
                                  textOverflow: true,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                MyText(
                                  title: conversation.time,
                                  fontSize: 12,
                                  color: AppColors.GRAY3,
                                  fontWeight: FontWeight.w300,
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            MyText(
                              title: conversation.desc,
                              textOverflow: true,
                              maxLines: 2,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: AppColors.GRAY3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Divider(
          color: AppColors.GRAY3.withOpacity(.1),
          height: 1,
          thickness: 1,
        )
      ],
    );
  }
}
