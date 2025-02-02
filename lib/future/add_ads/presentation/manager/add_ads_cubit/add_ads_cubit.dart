import 'dart:developer';

import 'package:b2b_app/future/add_ads/models/my_media.dart';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:video_compress/video_compress.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

part 'add_ads_state.dart';

class AddAdsCubit extends Cubit<AddAdsState> {
  AddAdsCubit() : super(AddAdsInitial());

  static AddAdsCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  int indexTab = 0;
  changeIndexTap(int i) {
    indexTab = i;
    emit(AddAdsInitial());
  }

  int indexTabFinancing = 0;
  changeIndexTapFinancing(int i) {
    indexTabFinancing = i;
    emit(AddAdsInitial());
  }

  int categorySelected = -1;
  changeCategorySelected(int i) {
    categorySelected = i;
    emit(AddAdsInitial());
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
      emit(AddAdsInitial());
    }
  }

  Future deleteMedia(int index) async {
    media.removeAt(index);
    emit(AddAdsInitial());
  }

  List<String> hashtag = [];
  Future addHashtag(String hash) async {
    hashtag.add(hash);
    emit(AddAdsInitial());
  }

  Future deleteHashtag(int index) async {
    hashtag.removeAt(index);
    emit(AddAdsInitial());
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

  int formCount = 0;
  changeFormCount(int count) {
    formCount = count;
    emit(AddAdsInitial());
  }

  int numberCommunication = 0;
  changeNumberCommunication(int count) {
    numberCommunication = count;
    emit(AddAdsInitial());
  }

  resetAllData() {
    indexTab = 0;
    formCount = 0;
    numberCommunication = 0;
    categorySelected = -1;
    media.clear();
    hashtag.clear();
  }
}
