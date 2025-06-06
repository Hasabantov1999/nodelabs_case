// ignore_for_file: unnecessary_library_name

library auth_repository;

import 'package:clean_arch/clean_arch.dart';
import 'package:sinflix_app/core/network_exception_handler.dart';
import 'package:sinflix_app/schemas/http/login_request_schema/login_request_schema.dart';
import 'package:sinflix_app/schemas/http/login_response_schema/login_response_schema.dart';
import 'package:sinflix_app/schemas/http/register_request_schema/register_request_schema.dart';
import 'package:sinflix_app/schemas/http/register_response_schema/register_response_schema.dart';
import 'package:sinflix_app/schemas/http/user_profile_response_schema/user_profile_response_schema.dart';

part 'src/repo/__init__.dart';
part 'src/provider/auth_provider.dart';
part 'src/provider/src/http/__init__.dart';
part 'src/provider/src/mock/__init__.dart';
