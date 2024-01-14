import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadBannerScreen extends StatefulWidget {
  UploadBannerScreen({super.key});

  static const String routeName = r"\UploadBannerScreen";

  @override
  State<UploadBannerScreen> createState() => _UploadBannerScreenState();
}

class _UploadBannerScreenState extends State<UploadBannerScreen> {
  dynamic _image;
  String? fileName;

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);

    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
        fileName = result.files.first.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Upload Banner',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade500,
                          borderRadius: BorderRadius.circular(10)),
                      child: _image != null
                          ? Image.memory(
                              _image,
                              fit: BoxFit.cover,
                            )
                          : Center(child: Text('Upload Banner...')),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          pickImage();
                        },
                        child: Text('Load Banner'))
                  ],
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text('Save'))
            ],
          ),
        ],
      ),
    );
  }
}
