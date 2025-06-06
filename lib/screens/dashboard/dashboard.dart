// ignore_for_file: unnecessary_library_name

library dashboard;

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_arch/clean_arch.dart';

import 'package:favorite_button/favorite_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sinflix_app/core/app_loading_bar.dart';

import 'package:sinflix_app/core/custom_page_animation.dart';
import 'package:sinflix_app/repository/transactions/transactions_repository.dart';
import 'package:sinflix_app/schemas/http/movies_schema/movies_schema.dart';
import 'package:sinflix_app/schemas/http/user_profile_response_schema/user_profile_response_schema.dart';

import 'package:sinflix_app/screens/add_photo/add_photo.dart';
import 'package:sinflix_app/screens/dashboard/src/pages/limited_offers_modal.dart';
import 'package:sinflix_app/services/user_service.dart';

part 'src/controller/__init__.dart';
part 'src/service/__init__.dart';
part 'src/view/__init__.dart';
