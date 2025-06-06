// ignore_for_file: use_string_in_part_of_directives

part of add_photo;

class AddPhotoService extends CleanArchBaseService {
  @override
  void init() {}
  @override
  void dispose() {}

  Future<void> uploadImageWithProgress({
    required File file,
    required void Function(double) onProgress, // % ilerleme
    required VoidCallback onDone,
    required void Function(String) onError,
  }) async {
    final url = Uri.parse('https://caseapi.servicelabs.tech/user/upload_photo');

    final fileLength = await file.length();
    final stream = http.ByteStream(Stream.castFrom(file.openRead()));

    final multipartFile = http.MultipartFile(
      'file',
      stream,
      fileLength,
      filename: basename(file.path),
    );

    final request = http.MultipartRequest('POST', url)
      ..headers['Authorization'] =
          'Bearer ${CleanArchStorage.instance.get(StorageKeys.token.name)}'
      ..files.add(multipartFile);

    final streamedResponse = await request.send();

    int bytesTransferred = 0;

    streamedResponse.stream.listen(
      (chunk) {
        bytesTransferred += chunk.length;
        double progress = bytesTransferred / fileLength;
        onProgress(progress);
      },
      onDone: () async {
        onDone();
      },
      onError: (e) {
        onError(e.toString());
      },
      cancelOnError: true,
    );
  }
}
