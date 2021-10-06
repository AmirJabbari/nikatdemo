
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {

  final ImagePicker _picker=ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextButton(
            child: Text("SelectImage",style: TextStyle(fontSize: 20),),
            onPressed: (){
              filePicker();
            },
          ),
          const SizedBox(height: 20),
          image == null ? Text("") : Image.file(File(image!.path),
          width: 250,
          fit: BoxFit.cover,)
        ],
      ),
    );
  }


  void filePicker() async{
    final XFile? selectedImage=await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image=selectedImage;
    });
  }
}
