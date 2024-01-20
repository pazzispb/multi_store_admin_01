import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:multi_store_admin_01/views/screens/widgets/categories_widget.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({super.key});

  static const String routeName = r"\CategoriesScreen";

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  dynamic _image;
  String? fileName;

  late String _categoryName;

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

  _uploadCategoryImageToStorage(image) async{
    var ref = _firebaseStorage.ref().child('CategoriesImage').child(fileName!);
    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadURL = await taskSnapshot.ref.getDownloadURL();
    return downloadURL;
  }

  _uploadToFireStore() async{
    EasyLoading.show();
    if(_formKey.currentState!.validate()){
      if(_image != null){
        var imageURL = await _uploadCategoryImageToStorage(_image);
        await _firebaseFirestore.collection('Categories').doc(fileName).set({
          "image": imageURL,
          "categories": _categoryName
        }).whenComplete(() {
          EasyLoading.dismiss();
          setState(() {
            _image = null;
            _formKey.currentState!.reset();
          });
        });
      }
      else{
        EasyLoading.dismiss();
      }
    }
    else{
      EasyLoading.dismiss();
    }
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
            ),
            const SizedBox(
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
                            : const Center(child: Text('Upload Picture...')),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            pickImage();
                          },
                          child: const Text('Load Picture'))
                    ],
                  ),
                ),
                Flexible(child: SizedBox(
                  width: 200,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Enter a category name',
                        hintText: 'Enter a category name'
                      ),
                      onChanged: (value){
                        _categoryName = value;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please, Category name must not be empty';
                        }
                        else{
                          return null;
                        }
                      },
                    ),
                )),
                ElevatedButton(onPressed: () {
                  _uploadToFireStore();
                }, child: const Text('Save'))
              ],
            ),
            Divider(),
            CategoriesWidget()
        
          ],
        ),
      ),
    );
  }
}
