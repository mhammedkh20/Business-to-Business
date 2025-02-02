import 'package:b2b_app/core/components/my_text.dart';
import 'package:b2b_app/future/messages/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';

class AudioMessageWidget extends StatefulWidget {
  final MessageModel message;
  final Color senderColor;
  final Color inActiveAudioSliderColor;
  final Color activeAudioSliderColor;
  final Color iconColor;

  const AudioMessageWidget({
    Key? key,
    required this.message,
    required this.senderColor,
    required this.inActiveAudioSliderColor,
    required this.activeAudioSliderColor,
    required this.iconColor,
  }) : super(key: key);

  @override
  _AudioMessageWidgetState createState() => _AudioMessageWidgetState();
}

class _AudioMessageWidgetState extends State<AudioMessageWidget> {
  final player = AudioPlayer();
  Duration? duration = Duration.zero;
  Duration seekBarPosition = Duration.zero;
  bool isPlaying = false;

  @override
  void initState() {
    setData();
    super.initState();
  }

  void setData() async {
    Uri.parse(widget.message.voicePath!).isAbsolute
        ? duration = await player.setUrl(widget.message.voicePath!)
        : duration = await player.setFilePath(widget.message.voicePath!);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            isPlaying ? player.pause() : play();
            setState(() {
              isPlaying = !isPlaying;
            });
          },
          icon: SvgPicture.asset(
            isPlaying
                ? 'assets/images/ic_play.svg'
                : 'assets/images/ic_pus.svg',
            color: widget.iconColor,
          ),
        ),
        Slider(
            activeColor: widget.activeAudioSliderColor,
            inactiveColor: widget.inActiveAudioSliderColor,
            max: player.duration?.inMilliseconds.toDouble() ?? 1,
            value: player.position.inMilliseconds.toDouble(),
            onChanged: (d) {
              player.stop();
              setState(() {
                isPlaying = false;

                player.seek(Duration(milliseconds: d.toInt()));
              });
            }),
        if (duration != null) ...[
          MyText(
            title: _printDuration(duration! - player.position),
            fontSize: 12,
            color: widget.iconColor,
          ),
          // SizedBox(width: 5.w),
          // SvgPicture.asset(
          //   'assets/images/message/ic_2check.svg',
          //   width: 14.r,
          // ),
        ]
      ],
    );
  }

  /// this function is used to play audio wither its from url or path file
  void play() {
    if (player.duration != null && player.position >= player.duration!) {
      player.seek(Duration.zero);
      setState(() {
        isPlaying = false;
      });
    }
    print(player.duration);
    print(player.position);
    player.play();

    player.positionStream.listen((duration) {
      // duration == player.duration;
      setState(() {
        seekBarPosition = duration;
      });
      if (player.duration != null && player.position >= player.duration!) {
        player.stop();
        player.seek(Duration.zero);
        setState(() {
          isPlaying = false;
          seekBarPosition = Duration.zero;
        });
      }
    });
  }

  /// function used to print the duration of the current audio duration
  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    String hoursString =
        duration.inHours == 0 ? '' : "${twoDigits(duration.inHours)}:";
    return "$hoursString$twoDigitMinutes:$twoDigitSeconds";
  }
}
