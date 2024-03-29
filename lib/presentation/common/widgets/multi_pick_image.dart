import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../app/constants.dart';
import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/strings_manager.dart';
import '../../../utils/resources/values_manager.dart';
import '../state_renderer/dialogs.dart';
import 'custom_text_button.dart';

class MutliPickImageWidget extends StatefulWidget {
  final Function(List<XFile>? images) onPickedImages;
  List<XFile>? selectedBeforeImages;
  final String titleText;
  final String btnText;
  final Widget btnIcon;
  final Color btnBackgroundColor;
  bool addMultiplePhotos;
  double? fontSize;

  MutliPickImageWidget(this.onPickedImages, this.titleText, this.btnText,
      this.btnIcon, this.btnBackgroundColor,
      {this.addMultiplePhotos = true,
      this.fontSize,
      this.selectedBeforeImages});

  @override
  State<MutliPickImageWidget> createState() => _MutliPickImageWidgetState();
}

class _MutliPickImageWidgetState extends State<MutliPickImageWidget> {
  final ImagePicker imgpicker = ImagePicker();
  List<XFile> imagefiles = [];

  @override
  void initState() {
    super.initState();
  }

  openImages() async {
    showModalBottomSheet(
        elevation: 10,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (ctx) => Container(
              height: 150,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkWell(
                    onTap: () async {
                      try {
                        FocusManager.instance.primaryFocus?.unfocus();
                        var pickedFiles = await imgpicker.pickMultiImage(
                            imageQuality: Constants.IMAGE_QUALITY_COMPRESS);

                        imagefiles = pickedFiles;
                        widget.onPickedImages(imagefiles);
                        setState(() {});
                      } catch (e) {
                        ShowDialogHelper.showErrorMessage(
                            e.toString(), context);
                      }
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppStrings.gallery.tr(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  const SizedBox(height: 32),
                  InkWell(
                    onTap: () async {
                      try {
                        var pickedFile = await imgpicker.pickImage(
                            source: ImageSource.camera,
                            imageQuality: Constants.IMAGE_QUALITY_COMPRESS);

                        imagefiles.add(pickedFile!);
                        widget.onPickedImages(imagefiles);
                        setState(() {});
                      } catch (e) {
                        ShowDialogHelper.showErrorMessage(
                            e.toString(), context);
                      }
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppStrings.camera.tr(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 16, 8, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.titleText,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: ColorManager.titlesTextColor),
          ),
          imagefiles.isNotEmpty
              ? Wrap(
                  children: imagefiles.map((imageone) {
                    return Stack(
                      children: [
                        Card(
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.file(File(imageone.path)),
                          ),
                        ),
                        Positioned(
                          top: 4,
                          right: 4,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                imagefiles
                                    .removeAt(imagefiles.indexOf(imageone));
                              });
                            },
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }).toList(),
                )
              : Container(),
          widget.addMultiplePhotos == false && imagefiles.length > 0
              ? Container()
              : CustomTextButton(
                  margin: 0,
                  text: widget.btnText.tr(),
                  isWaitToEnable: false,
                  fontSize: widget.fontSize,
                  backgroundColor: widget.btnBackgroundColor,
                  icon: widget.btnIcon,
                  onPressed: () {
                    openImages();
                  },
                ),
        ],
      ),
    );
  }
}
