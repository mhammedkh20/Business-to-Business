import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:b2b_app/future/profile/models/item_settings_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ImagePicker instance = ImagePicker();

  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  bool isExpanded = true;

  bool notifyExpanded = true;

  List<ItemSettingsModel> settings(BuildContext context) {
    return [
      ItemSettingsModel(
        icon: 'assets/images/ic_profile2.svg',
        title: AppLocalizations.of(context)!.profilePersonly,
      ),
      ItemSettingsModel(
        icon: 'assets/images/ic_app2.svg',
        title: AppLocalizations.of(context)!.aboutApplication,
      ),
      ItemSettingsModel(
        icon: 'assets/images/ic_qustion.svg',
        title: AppLocalizations.of(context)!.commonQuestions,
      ),
      ItemSettingsModel(
        icon: 'assets/images/ic_settings.svg',
        title: AppLocalizations.of(context)!.settings,
      ),
      ItemSettingsModel(
        icon: 'assets/images/ic_logout.svg',
        title: AppLocalizations.of(context)!.logout,
      ),
    ];
  }

  int indexTapCommon = 0;

  changeIndexTapCommon(int index) {
    indexTapCommon = index;
    emit(ProfileInitial());
  }

  List<String> images = [];
  Future pickImage() async {
    XFile? file = await instance.pickImage(source: ImageSource.gallery);
    if (file != null) {
      images.add(file.path);
      emit(ProfileInitial());
    }
  }

  int indexPageImage = 0;
  changeIndexIndecator(int index) {
    indexPageImage = index;
    emit(ProfileInitial());
  }

  String? photo;
  pickImageUser() async {
    final XFile? image = await instance.pickImage(source: ImageSource.gallery);
    if (image != null) {
      photo = image.path;

      emit(ProfileInitial());
    }
  }

  int indexTap = 0;
  changeIndexTap(int index) {
    indexTap = index;
    emit(ProfileInitial());
  }

  bool editConnectionData = false;
  changeEditConnection(bool status) {
    editConnectionData = status;
    emit(ProfileInitial());
  }

  bool editWorkData = false;
  changeEditWork(bool status) {
    editWorkData = status;
    emit(ProfileInitial());
  }

  bool editEducationData = false;
  changeEditEducation(bool status) {
    editEducationData = status;
    emit(ProfileInitial());
  }

  bool editAddressData = false;
  changeEditAddress(bool status) {
    editAddressData = status;
    emit(ProfileInitial());
  }

  String? urlFace = 'https://www.google.com/webhp?authuser=1';
  String? urlInstagram = 'https://www.google.com/webhp?authuser=1';
  String? urlTwitter = 'https://www.google.com/webhp?authuser=1';
  String? urlWhatsApp = 'https://www.google.com/webhp?authuser=1';

  fillSocial({
    String? urlFace,
    String? urlInstagram,
    String? urlTwitter,
    String? urlWhatsApp,
  }) {
    this.urlFace = urlFace;
    this.urlInstagram = urlInstagram;
    this.urlTwitter = urlTwitter;
    this.urlWhatsApp = urlWhatsApp;
    emit(ProfileInitial());
  }
}
