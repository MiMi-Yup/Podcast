import 'dart:io';

import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateNewEpisodeScreen extends StatefulWidget {
  const CreateNewEpisodeScreen({super.key});
  @override
  _PodcastEditingScreenState createState() => _PodcastEditingScreenState();
}
  class _PodcastEditingScreenState extends State<CreateNewEpisodeScreen> {

    File? _image;

    Future<void> _getImageFromGallery() async {
      final pickedImage = await ImagePicker().pickImage(
          source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _image = File(pickedImage.path);
        });
      }
    }

    Future<void> _getImageFromCamera() async {
      final pickedImage = await ImagePicker().pickImage(
          source: ImageSource.camera);
      if (pickedImage != null) {
        setState(() {
          _image = File(pickedImage.path);
        });
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
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
                        'Tên episode',
                        style: mST14M,
                      ),
                      SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),

                      SizedBox(height: 32),
                      Text(
                          'Mô tả episode',
                          style: mST14M
                      ),
                      SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 3,
                      ),
                      SizedBox(height: 32),
                      Text(
                          'Đổi ảnh nền',
                          style: mST14M
                      ),
                      SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _image != null
                              ? GestureDetector(
                            onTap: () {
                              _showImageOptions();
                            },
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.file(
                                    _image!,
                                    height: 64.0,
                                    width: 64.0,
                                    fit: BoxFit.cover,
                                  ),
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
                                      onPressed: () {
                                        _showImageOptions();
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
                            onTap: () {
                              _showImageOptions();
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
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Xử lý khi nhấn nút Save Podcast
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
                ],
              ),

            ],
          ),
        ),
      );
    }

    void _showImageOptions() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take Camera Picture'),
                onTap: () {
                  Navigator.pop(context);
                  _getImageFromCamera();
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Get Picture from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _getImageFromGallery();
                },
              ),
            ],
          );
        },
      );
    }
  }
