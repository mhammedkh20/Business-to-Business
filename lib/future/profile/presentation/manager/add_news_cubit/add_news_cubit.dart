import 'dart:developer';
import 'package:b2b_app/future/add_ads/models/my_media.dart';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

part 'add_news_state.dart';

class AddNewsCubit extends Cubit<AddNewsState> {
  ImagePicker instance = ImagePicker();

  AddNewsCubit() : super(AddNewsInitial());

  static AddNewsCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  List<MyMedia> media = [];
  Future pickMedia() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'mp4'],
    );

    if (result != null) {
      log(result.files.single.path!);
      String? newPath;
      if (result.files.single.extension == 'mp4') {
        newPath = await getTunmp(result.files.single.path!);
      }
      media.add(MyMedia(
          file: result.files.single,
          thum: result.files.single.extension == 'mp4' ? newPath! : null));
      emit(AddNewsInitial());
    }
  }

  Future deleteMedia(int index) async {
    media.removeAt(index);
    emit(AddNewsInitial());
  }

  List<String> hashtag = [];
  Future addHashtag(String hash) async {
    hashtag.add(hash);
    emit(AddNewsInitial());
  }

  Future deleteHashtag(int index) async {
    hashtag.removeAt(index);
    emit(AddNewsInitial());
  }

  Future<String> getTunmp(String path) async {
    // final thumbnailFile = await VideoCompress.getFileThumbnail(path);

    final thumbnailFile = await VideoThumbnail.thumbnailFile(
      video: path,
      // thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.PNG,
      quality: 100,
    );
    return thumbnailFile!;
  }
}
