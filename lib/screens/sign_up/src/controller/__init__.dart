// ignore_for_file: use_string_in_part_of_directives

part of sign_up;

class SignUpController extends CleanArchBaseController {
 final TextEditingController nameController =TextEditingController();
 final TextEditingController emailController = TextEditingController();
 final TextEditingController passwordController =TextEditingController();
  final TextEditingController rePasswordController =TextEditingController();
 ValidationManager validationManager = ValidationManager();
}
