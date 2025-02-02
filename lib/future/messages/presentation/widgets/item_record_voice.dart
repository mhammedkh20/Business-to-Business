// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/core/utils/app_colors.dart';
import 'package:b2b_app/future/messages/presentation/manager/messages_cubit/messages_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:record/record.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyItemRecordVoice extends StatefulWidget {
  /// Height of the slider. Defaults to 70.
  final double height;
  double? width;

  /// The button widget used on the moving element of the slider. Defaults to Icon(Icons.chevron_right).
  final Widget sliderButtonContent;

  /// hit text to be shown for recording voice note
  final String recordinNoteHintText;

  /// The Icon showed to send a text
  final IconData sendTextIcon;

  /// texts shown wen trying to chose image attachment from galary
  final String imageAttachmentFromGalary;

  /// texts shown wen trying to chose image attachment from camera
  final String imageAttachmentFromCamery;

  /// texts shown wen trying to chose image attachment cancel text
  final String imageAttachmentCancelText;

  /// image attachment text color
  final Color imageAttachmentTextColor;

  /// the color of the outer container and the color used to hide
  /// the text on slide
  final Color containerColor;

  /// The callback when slider is completed. This is the only required field.
  final VoidCallback onSlideToCancelRecord;

  /// function to handle the selected image
  final Function(XFile) handleImageSelect;

  /// function to handle the recorded audio
  final Function(String? path, bool cnaceled)? handleRecord;

  /// use this flag to disable the input
  final bool disableInput;

  bool isText = false;

  MyItemRecordVoice({
    Key? key,
    this.height = 70,
    required this.recordinNoteHintText,
    this.sliderButtonContent = const Icon(
      Icons.chevron_right,
      color: Colors.white,
      size: 25,
    ),
    this.sendTextIcon = Icons.send,
    required this.onSlideToCancelRecord,
    this.handleRecord,
    required this.handleImageSelect,
    required this.containerColor,
    required this.imageAttachmentFromGalary,
    required this.imageAttachmentFromCamery,
    required this.imageAttachmentCancelText,
    required this.imageAttachmentTextColor,
    required this.disableInput,
  }) : assert(height >= 25);

  @override
  State<StatefulWidget> createState() {
    return MyItemRecordVoiceState();
  }
}

class MyItemRecordVoiceState extends State<MyItemRecordVoice>
    with TickerProviderStateMixin {
  late Record record;
  double _position = 0;
  int _duration = 0;
  bool isRecording = false;
  int recordTime = 0;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer();

  double getPosition() {
    // log(_position.toString());
    if (_position < 0) {
      return 0;
    } else if (_position > widget.width! - widget.height) {
      return widget.width! - widget.height;
    } else {
      return _position;
    }
  }

  @override
  void initState() {
    super.initState();
    record = Record();
  }

  void updatePosition(details) {
    if (details is DragEndDetails) {
      setState(() {
        _duration = 600;
        if (_position > widget.width! - widget.height) {
          _position = widget.width! - widget.height;
        } else {
          _position = 0;
        }
      });
    } else if (details is DragUpdateDetails) {
      setState(() {
        _duration = 0;
        _position = details.localPosition.dx - (widget.height / 2);
      });
    }
  }

  void sliderReleased(details) {
    if (_position > widget.width! - widget.height) {
      widget.onSlideToCancelRecord();
    }
    updatePosition(details);
  }

  Permission micPermission = Permission.microphone;

  @override
  Widget build(BuildContext context) {
    // widget.isText = KeyboardVisibilityProvider.isKeyboardVisible(context);
    widget.width = MediaQuery.of(context).size.width * 0.95;

    return IgnorePointer(
      ignoring: widget.disableInput,
      child: AnimatedContainer(
        duration: Duration(milliseconds: _duration),
        curve: Curves.ease,
        height: widget.height,
        // width: widget.width,
        width: double.infinity,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          // color: Colors.grey.shade200,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 32,
              color: Color(0xFF087949).withOpacity(0.08),
            ),
          ],
        ),
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: <Widget>[
            Container(
              padding: EdgeInsetsDirectional.only(
                start: 10.w,
                end: 10.w,
              ),
              margin: EdgeInsetsDirectional.only(
                end: 10.w,
                start: 10.w,
              ),
              decoration: BoxDecoration(
                // color: kPrimaryColor.withOpacity(0.05),
                color: widget.containerColor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 0.0, right: 0),
                      child: isRecording
                          ? Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText(
                                    title:
                                        "${widget.recordinNoteHintText} ${StopWatchTimer.getDisplayTime(recordTime, hours: false)}",
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(
                              height: 50.h,
                              child: Center(
                                child: MyText(
                                  title: AppLocalizations.of(context)!
                                      .clickRecordAudioButton,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (!isRecording) {
                        MessagesCubit.get(context).setRecordMessage(false);
                      }
                    },
                    child: Icon(
                      isRecording ? Icons.delete : Icons.close,
                      color: isRecording
                          ? const Color(0xFFF03738)
                          : Colors.black38,
                    ),
                  ),
                ],
              ),
            ),
            PositionedDirectional(
              top: 10.h,
              start: widget.height / 2,
              bottom: 5.h,
              child: AnimatedContainer(
                height: 100.h,
                width: getPosition(),
                duration: Duration(milliseconds: _duration),
                curve: Curves.ease,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: widget.containerColor,
                ),
              ),
            ),
            AnimatedPositionedDirectional(
              duration: Duration(milliseconds: _duration),
              curve: Curves.bounceOut,
              start: getPosition(),
              top: 0,
              child: GestureDetector(
                onTapDown: (details) async {
                  // await record.hasPermission();
                },
                onLongPress: () async {
                  HapticFeedback.heavyImpact();

                  if (await micPermission.isGranted) {
                    if (!widget.isText) {
                      _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                      _stopWatchTimer.rawTime.listen((value) {
                        setState(() {
                          recordTime = value;
                        });
                        // print(
                        //     'rawTime $value ${StopWatchTimer.getDisplayTime(recordTime)}');
                      });
                      setState(() {
                        recordAudio();
                        isRecording = true;
                      });
                    }
                  }
                  if (await micPermission.isDenied) {
                    await Permission.microphone.request();
                  }
                },
                onLongPressMoveUpdate: (details) async {
                  if (!widget.isText && isRecording == true) {
                    setState(() {
                      _duration = 0;
                      if ('ar' == 'ar') {
                        _position = details.localPosition.dx * -1;
                      } else {
                        _position = details.localPosition.dx * 1;
                      }
                    });
                  }
                },
                onLongPressEnd: (details) async {
                  final res = await stopRecord();
                  // Stop
                  _stopWatchTimer.onExecute.add(StopWatchExecute.stop);

                  // Reset
                  _stopWatchTimer.onExecute.add(StopWatchExecute.reset);

                  if (!widget.isText && await micPermission.isGranted) {
                    if (_position > widget.width! - widget.height) {
                      log('canceled');

                      widget.handleRecord != null
                          ? widget.handleRecord!(res, true)
                          : null;

                      widget.onSlideToCancelRecord();
                    } else {
                      widget.handleRecord != null
                          ? widget.handleRecord!(res, false)
                          : null;
                    }

                    setState(() {
                      isRecording = false;
                    });
                    setState(() {
                      _duration = 600;
                      _position = 0;
                      isRecording = false;
                    });
                  }

                  // log(res ?? "");
                },
                child: AnimatedSize(
                  curve: Curves.easeIn,
                  duration: Duration(microseconds: 500),
                  child: Container(
                    margin: EdgeInsets.only(top: isRecording ? 0 : 8.h),
                    height: isRecording ? 60 : 45,
                    width: isRecording ? 60 : 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(widget.height / 2),
                      ),
                      color: AppColors.BASE_COLOR,
                    ),
                    child: isRecording
                        ? widget.sliderButtonContent
                        : Icon(
                            widget.isText ? widget.sendTextIcon : Icons.mic,
                            color: Colors.white,
                            size: 25.r,
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// function used to record audio
  void recordAudio() async {
    if (await record.isRecording()) {
      record.stop();
    }

    await record.start(
      // path: 'aFullPath/myFile.m4a', // required
      encoder: AudioEncoder.AAC, // by default
      bitRate: 128000, // by default
      // sampleRate: 44100, // by default
    );
  }

  /// function used to stop recording
  /// and returns the record path as a string
  Future<String?> stopRecord() async {
    return await record.stop();
  }
}


                    // ? usage 
              // MyItemRecordVoice(
              //   recordinNoteHintText: 'قم بتسجيل صوتي',
              //   onSlideToCancelRecord: () {
              //     log('sssssssss');
              //   },
              //   handleImageSelect: (XFile file) {},
              //   handleRecord: (path, cnaceled) {},
              //   containerColor: Colors.white,
              //   imageAttachmentFromGalary: 'imageAttachmentFromGalary',
              //   imageAttachmentFromCamery: 'imageAttachmentFromCamery',
              //   imageAttachmentCancelText: 'imageAttachmentCancelText',
              //   imageAttachmentTextColor: Colors.white30,
              //   disableInput: false,
              // )