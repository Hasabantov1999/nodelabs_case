// ignore_for_file: use_string_in_part_of_directives

part of transactions_repository;

class TransactionsHttpProvider implements TransactionsRepository {
  @override
  Future<MoviesSchema> getMovies(int page) async {
    final res = await CleanArchNetworkManager.instance.send(
      path: "/movie/list",
      type: RequestType.GET,
      queryParameters: {
        "page": page,
      },
    );
    return res.throwOrExceptionModel<MoviesSchema>(
      model: MoviesSchema(),
    );
  }

  @override
  Future<MoviesSchema> getFavoriteMovies() async {
    final res = await CleanArchNetworkManager.instance.send(
      path: "/movie/favorites",
      type: RequestType.GET,
    );
    return res.throwOrExceptionModel<MoviesSchema>(
      model: MoviesSchema(),
    );
  }

  @override
  Future<bool> addFavorite(String id) async {
    final res = await CleanArchNetworkManager.instance.send(
      path: "/movie/favorite",
      queryParameters: {
        "favoriteId": id,
      },
      type: RequestType.POST,
    );
    if(res==null){
      return Future.value(false);
    }
    if(res.statusCode==200){
      return Future.value(true);
    }else{
      return Future.value(false);
    }

  }
}
