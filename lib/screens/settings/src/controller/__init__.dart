// ignore_for_file: use_string_in_part_of_directives

part of settings;

class SettingsController extends CleanArchBaseController {
  List<SelectLanguage> languages = [
    SelectLanguage(
      key: "tr",
      lang: "Türkçe",
    ),
     SelectLanguage(
      key: "en",
      lang: "English",
    ),
  ];
}

class SelectLanguage {
  final String lang;
  final String key;
  SelectLanguage({
    required this.key,
    required this.lang,
  });
}
