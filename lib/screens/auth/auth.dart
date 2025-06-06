// ignore_for_file: unnecessary_library_name

library auth;

import 'package:animate_do/animate_do.dart';
import 'package:clean_arch/clean_arch.dart';
import 'package:flutter/material.dart';
import 'package:sinflix_app/core/app_async_button.dart';
import 'package:sinflix_app/core/app_textfield.dart';
import 'package:sinflix_app/core/app_validators.dart';
import 'package:sinflix_app/core/keyboard_closer.dart';
import 'package:sinflix_app/core/storage_keys.dart';
import 'package:sinflix_app/main.dart';
import 'package:sinflix_app/repository/auth/auth_repository.dart';
import 'package:sinflix_app/schemas/http/login_request_schema/login_request_schema.dart';
import 'package:sinflix_app/screens/auth/src/components/app_extra_login_comp.dart';
import 'package:sinflix_app/screens/auth/src/components/app_redirect_register_comp.dart';
import 'package:sinflix_app/services/user_service.dart';

part 'src/controller/__init__.dart';
part 'src/service/__init__.dart';
part 'src/view/__init__.dart';
