import 'package:b2b_app/core/utils/app_bottom_sheet.dart';
import 'package:b2b_app/future/home/models/news_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:b2b_app/core/components/my_contianer_shape.dart';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:like_button/like_button.dart';

class PostWidget extends StatelessWidget {
  final NewsModel? news;

  const PostWidget({
    super.key,
    this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    MyContainerShape(
                      height: 50.r,
                      width: 50.w,
                      borderRadius: 50,
                      bgContainer: AppColors.BASE_COLOR,
                      child: const Icon(
                        Icons.person,
                        color: AppColors.WHITE,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    const Flexible(
                      child: MyText(
                        title: 'محمد بن عبد الله',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    SizedBox(
                      height: 22.h,
                      child: const VerticalDivider(
                        width: 0,
                        thickness: 1,
                        color: AppColors.GRAY3,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    MyText(
                      title: (news != null && news!.createdAt != null)
                          ? news!.createdAt ?? ""
                          : 'قبل 7 ساعات',
                      fontSize: 12,
                      color: AppColors.GRAY3,
                      fontWeight: FontWeight.w300,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  AppBottomSheet.listReportingBottomSheet(context);
                },
                child: SvgPicture.asset(
                  'assets/images/ic_inform.svg',
                  width: 20.r,
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 62.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      textAlign: TextAlign.start,
                      title: news != null && news!.description != null
                          ? news!.description ?? ""
                          : 'سيارة لاندكروزر فكسار 2006 للبدل بربع نيسان',
                    ),
                    SizedBox(height: 12.h),
                    MyContainerShape(
                      borderRadius: 16,
                      height: 200.h,
                      width: double.infinity,
                      child: news != null && news!.imageUrl != null
                          ? Image.network(
                              news!.imageUrl!,
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.error);
                              },
                              loadingBuilder: (BuildContext context,
                                  Widget image,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return image;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                            )
                          : Image.asset(
                              'assets/images/im_placeholder.png',
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                            ),
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LikeButton(
                          size: 22.r,
                          likeCountAnimationDuration:
                              const Duration(milliseconds: 300),
                          circleColor: const CircleColor(
                            start: Color(0xff61F1A8),
                            end: Color(0xff0C9851),
                          ),
                          likeCountPadding:
                              EdgeInsetsDirectional.only(start: 8.w),
                          bubblesColor: const BubblesColor(
                            dotPrimaryColor: Color(0xff33b5e5),
                            dotSecondaryColor: Color(0xff0099cc),
                          ),
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              Icons.favorite,
                              color: isLiked ? AppColors.RED : AppColors.GRAY3,
                              size: 22.r,
                            );
                          },
                          likeCount: news != null && news!.likesCount != null
                              ? int.parse(news!.likesCount!)
                              : 0,
                          countBuilder:
                              (int? count, bool isLiked, String text) {
                            var color = isLiked ? AppColors.GRAY3 : Colors.grey;
                            Widget result;
                            if (count == 0) {
                              result = MyText(
                                title: AppLocalizations.of(context)!.love,
                                fontWeight: FontWeight.w300,
                                color: AppColors.GRAY,
                                height: 0,
                              );
                            } else {
                              result = Text(
                                text,
                                style: TextStyle(color: color),
                              );
                            }
                            return result;
                          },
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/ic_comment.svg'),
                            SizedBox(width: 8.w),
                            MyText(
                              title: news != null && news!.commentsCount != null
                                  ? news!.commentsCount!
                                  : '0',
                              fontSize: 14,
                              color: AppColors.GRAY3,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/ic_retwet.svg'),
                            SizedBox(width: 8.w),
                            MyText(
                              title: news != null && news!.repostsCount != null
                                  ? news!.repostsCount!
                                  : '0',
                              fontSize: 14,
                              color: AppColors.GRAY3,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/ic_views.svg'),
                            SizedBox(width: 8.w),
                            MyText(
                              title: news != null && news!.viewsCount != null
                                  ? news!.viewsCount!
                                  : '0',
                              fontSize: 14,
                              color: AppColors.GRAY3,
                            )
                          ],
                        ),
                        SvgPicture.asset('assets/images/ic_shear.svg'),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/ic_trend.svg',
                          width: 16.r,
                          height: 16.r,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 6.w),
                        const MyText(
                          title: 'ممول',
                          fontSize: 10,
                          color: AppColors.GRAY3,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
