// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';

import 'package:image_picker/image_picker.dart';

Future<XFile?> showImagePicker(BuildContext context) {
  ImagePicker picker =ImagePicker();
  return showCupertinoModalPopup(
    context: context,
    builder: (_) => CupertinoActionSheet(
      title: Text('Fotoğraf Seç'),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () async {
            final picked = await picker.pickImage(source: ImageSource.camera);
            Navigator.pop(context, picked);
            // handle picked image
          },
          child: Text('Fotoğraf Çek'),
        ),
        CupertinoActionSheetAction(
          onPressed: () async {
            final picked = await picker.pickImage(source: ImageSource.gallery);
            Navigator.pop(context, picked);
            // handle picked image
          },
          child: Text('Galeriden Seç'),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Navigator.pop(context);
        },
        isDestructiveAction: true,
        child: Text(
          'Vazgeç',
          style: TextStyle(color: CupertinoColors.destructiveRed),
        ),
      ),
    ),
  );
}
