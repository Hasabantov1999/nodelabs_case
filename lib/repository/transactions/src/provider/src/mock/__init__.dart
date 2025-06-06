// ignore_for_file: use_string_in_part_of_directives

part of transactions_repository;

class TransactionsMockProvider implements TransactionsRepository {
  @override
  Future<MoviesSchema> getMovies(int page) {
    throw UnimplementedError();
  }
  
  @override
  Future<MoviesSchema> getFavoriteMovies() {
    throw UnimplementedError();
  }
  
  @override
  Future<bool> addFavorite(String id) {
    throw UnimplementedError();
  }
  
}
