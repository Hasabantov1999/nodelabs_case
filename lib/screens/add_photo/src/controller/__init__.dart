// ignore_for_file: use_string_in_part_of_directives

part of add_photo;

class AddPhotoController extends CleanArchBaseController {
  XFile? photo;
  ValueNotifier<PhotoState> state = ValueNotifier(PhotoState.empty);
  double loadPer = 0;
  
}


enum PhotoState{
  empty,
  loading,
  done
}