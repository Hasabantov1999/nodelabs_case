// ignore_for_file: use_string_in_part_of_directives

part of transactions_repository;

abstract class TransactionsRepository implements CleanArchBaseRepository {
  Future<MoviesSchema> getMovies(int page);
  Future<MoviesSchema> getFavoriteMovies();
  Future<bool> addFavorite(String id);
}
