import 'dart:developer';

import 'package:b2b_app/future/add_ads/models/my_media.dart';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

part 'add_service_state.dart';

class AddServiceCubit extends Cubit<AddServiceState> {
  AddServiceCubit() : super(AddServiceInitial());

  static AddServiceCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  List<MyMedia> media = [];
  Future pickMedia() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
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
      emit(AddServiceInitial());
    }
  }

  Future deleteMedia(int index) async {
    media.removeAt(index);
    emit(AddServiceInitial());
  }

  List<MyMedia> productImages = [];
  Future pickProductImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );

    if (result != null) {
      log(result.files.single.path!);
      String? newPath;
      if (result.files.single.extension == 'mp4') {
        newPath = await getTunmp(result.files.single.path!);
      }
      productImages.add(MyMedia(
          file: result.files.single,
          thum: result.files.single.extension == 'mp4' ? newPath! : null));
      emit(AddServiceInitial());
    }
  }

  Future deleteProductImage(int index) async {
    productImages.removeAt(index);
    emit(AddServiceInitial());
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
