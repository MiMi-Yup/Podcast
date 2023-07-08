import 'dart:io';

import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:join_podcast/common/widgets/m_text_field.dart';
import 'package:join_podcast/models/category_model.dart';
import 'package:join_podcast/presentation/channel/new_podcast/createNewPodcast/cubit/createNewPodcast_cubit.dart';

import '../../../../../manifest.dart';
import '../../../../../utils/alert_util.dart';
import '../../../../bottom_bar/bottom_bar_route.dart';

class CreateNewPodcastScreen extends StatelessWidget {
  CreateNewPodcastScreen({super.key});

  // final File? _image;
  // final XFile? _xFile;
  final TextEditingController _podcastName = TextEditingController();
  final TextEditingController _podcastDescription = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  // Future<void> _getImageFromGallery() async {
  //     final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
  //     if (pickedImage != null) {
  //       //context.read<CreateNewPodcastCubit>().changeImage(pickedImage);
  //       setState(() {
  //         _image = File(pickedImage.path);
  //       });
  //     }
  //   }

  // Future<void> _getImageFromCamera() async {
  //   final pickedImage = await ImagePicker().pickImage(
  //       source: ImageSource.camera);
  //   if (pickedImage != null) {
  //     setState(() {
  //       _image = File(pickedImage.path);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Create Podcast'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
                context); // Quay lại màn hình trước đó khi nhấn nút quay lại
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Podcast Details',
              style: mST24M,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24),
                    Text(
                      'Tên podcast',
                      style: mST14M,
                    ),
                    SizedBox(height: 8),
                    MTextField(
                      controller: _podcastName,
                    ),
                    SizedBox(height: 32),
                    Text('Mô tả podcast', style: mST14M),
                    SizedBox(height: 8),
                    MTextField(
                      controller: _podcastDescription,
                      maxLine: 3,
                    ),
                    SizedBox(height: 32),
                    Text('Thể loại', style: mST14M),
                    SizedBox(height: 8),
                    FutureBuilder<List<CategoryModel>?>(
                        future: context
                            .read<CreateNewPodcastCubit>()
                            .getAllCategories(),
                        builder: (context, snapshot) =>
                            snapshot.hasData && (snapshot.data?.length ?? 0) > 0
                                ? DropdownButtonFormField<CategoryModel>(
                                    decoration: InputDecoration(
                                      labelText: 'Category',
                                      border: OutlineInputBorder(),
                                    ),
                                    items: snapshot.data
                                        ?.map((category) =>
                                            DropdownMenuItem<CategoryModel>(
                                              value: category,
                                              child: Text(category.name ?? ''),
                                            ))
                                        .toList(),
                                    onChanged: (selectedCategory) {
                                      // TODO: Xử lý khi chọn category
                                    },
                                  )
                                : SizedBox.shrink()),
                    SizedBox(height: 32),
                    /*Text(
                          'Ngôn ngữ',
                          style: mST14M
                      ),
                      SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Language',
                          border: OutlineInputBorder(),
                        ),
                        items: ['English', 'Spanish', 'French']
                            .map((language) =>
                            DropdownMenuItem<String>(
                              value: language,
                              child: Text(language),
                            ))
                            .toList(),
                        onChanged: (selectedLanguage) {
                          // TODO: Xử lý khi chọn ngôn ngữ
                        },
                      ),
                      SizedBox(height: 32),*/
                    BlocBuilder<CreateNewPodcastCubit, CreateNewPodcastState>(
                        builder: (context, state) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                state.image != null
                                    ? GestureDetector(
                                        onTap: () async {
                                          final file = await _picker.pickImage(
                                              source: ImageSource.gallery);
                                          if (file != null) {
                                            context
                                                .read<CreateNewPodcastCubit>()
                                                .changeImage(file);
                                          }
                                        },
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image(
                                                  height: 64.0,
                                                  width: 64.0,
                                                  fit: BoxFit.cover,
                                                  image: state.image == null
                                                      ? NetworkImage(
                                                          state.initImage)
                                                      : FileImage(File(
                                                              state.image!))
                                                          as ImageProvider),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                ),
                                                child: IconButton(
                                                  onPressed: () async {
                                                    final file =
                                                        await _picker.pickImage(
                                                            source: ImageSource
                                                                .gallery);
                                                    if (file != null) {
                                                      context
                                                          .read<
                                                              CreateNewPodcastCubit>()
                                                          .changeImage(file);
                                                    }
                                                  },
                                                  icon: Icon(
                                                    Icons.edit,
                                                    size: 16.0,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () async {
                                          final file = await _picker.pickImage(
                                              source: ImageSource.gallery);
                                          if (file != null) {
                                            context
                                                .read<CreateNewPodcastCubit>()
                                                .changeImage(file);
                                          }
                                        },
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.camera_alt,
                                              size: 32.0,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(height: 8.0),
                                            Text(
                                              'Upload an image',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ],
                            )),
                  ],
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    BlocListener<CreateNewPodcastCubit, CreateNewPodcastState>(
                  listener: (context, state) {
                    switch (state.state) {
                      case Status.success:
                        XMDRouter.popNamedAndRemoveUntil(
                            routerIds[BottomBarRoute]!);
                        break;
                      case Status.error:
                        AlertUtil.hideLoading();
                        AlertUtil.showToast(
                            MultiLanguage.of(context).systemError);
                        break;
                      case Status.submitting:
                        AlertUtil.showLoading();
                        break;
                      default:
                        break;
                    }
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Xử lý khi nhấn nút Save Podcast
                      context
                          .read<CreateNewPodcastCubit>()
                          .changePodcastName(_podcastName.text);
                      context
                          .read<CreateNewPodcastCubit>()
                          .changePodcastDes(_podcastDescription.text);
                      //context.read<CreateNewPodcastCubit>().changeImage(_xFile!);
                      context
                          .read<CreateNewPodcastCubit>()
                          .changeCategory('6476f739a362eabb03003e33');
                      //print("${_podcastName.text}/${_podcastDescription.text}");
                      context.read<CreateNewPodcastCubit>().createPodcast();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Màu nền xanh lá
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Góc bo tròn
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 24.0),
                      child: Text(
                        'Save Podcast',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }

  // void _showImageOptions() {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           ListTile(
  //             leading: Icon(Icons.camera_alt),
  //             title: Text('Take Camera Picture'),
  //             onTap: () {
  //               Navigator.pop(context);
  //               _getImageFromCamera();
  //             },
  //           ),
  //           ListTile(
  //             leading: Icon(Icons.image),
  //             title: Text('Get Picture from Gallery'),
  //           onTap: () async {
  //             Navigator.pop(context);
  //             //_getImageFromGallery();
  //             final file =
  //                 await _picker.pickImage(source: ImageSource.gallery);
  //             if (file != null) {
  //               context.read<CreateNewPodcastCubit>().changeImage(file);
  //             }
  //           },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
