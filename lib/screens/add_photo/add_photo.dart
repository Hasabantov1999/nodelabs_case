// ignore_for_file: unnecessary_library_name

library add_photo;

import 'package:clean_arch/clean_arch.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:sinflix_app/core/storage_keys.dart';
import 'package:sinflix_app/screens/add_photo/src/components/select_image_comp.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sinflix_app/services/user_service.dart';
part 'src/controller/__init__.dart';
part 'src/service/__init__.dart';
part 'src/view/__init__.dart';
