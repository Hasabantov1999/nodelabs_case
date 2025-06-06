// ignore_for_file: use_string_in_part_of_directives

part of transactions_repository;

class TransactionsProvider implements TransactionsRepository {
  final TransactionsRepository provider;
  TransactionsProvider({
    required this.provider,
  });
  
  @override
  Future<MoviesSchema> getMovies(int page) {
    return provider.getMovies(page);
  }
  
  @override
  Future<MoviesSchema> getFavoriteMovies() {
   return provider.getFavoriteMovies();
  }
  
  @override
  Future<bool> addFavorite(String id) {
   return provider.addFavorite(id);
  }
}
