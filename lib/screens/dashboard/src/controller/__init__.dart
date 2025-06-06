// ignore_for_file: use_string_in_part_of_directives

part of dashboard;

class DashboardController extends CleanArchBaseController {
  final PageController pageController = PageController();
  List<Movies> movies = [];
  List<Movies> favoriteMovies = [];
  bool isLoading = true;
  bool animatePage = false;
  bool circleAnimate = false;
  bool animateRefreshOpacity = false;
  late PageController moviePageController;
  bool pullDownToAnimate = false;

  void animate() {
    animatePage = !animatePage;
    notifyListeners();
  }

  void goPageOne() {
    if (pageController.page == 1) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    }
  }

  void goPageTwo() {
    if (pageController.page == 0) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    }
  }

  int page = 1;
  void init() {
    CleanArchInjector.getInstance<TransactionsRepository>()
        .getMovies(page)
        .then((movieSchema) {
      for (var movie in movieSchema.movies ?? <Movies>[]) {
        movies.add(movie);
      }
      isLoading = false;

      notifyListeners();
      moviePageController = PageController(initialPage: movies.length - 1);
      Future.delayed(const Duration(milliseconds: 300), () {
        moviePageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 3000),
          curve: Curves.linearToEaseOut,
        );
        Future.delayed(const Duration(milliseconds: 3000), () {
          moviePageController.addListener(pageListener);
        });
      });
    });
  }

  @override
  void dispose() {
    moviePageController.removeListener(pageListener);
    super.dispose();
  }

  bool _isLoading = false;
  bool _hasReachedEnd = false;
  void pageListener() {
    final isLastPage = moviePageController.page?.round() == movies.length - 1;

    if (isLastPage && !_isLoading && !_hasReachedEnd) {
      fetchMoreMovies();
    }
  }

  Future<void> fetchMoreMovies() async {
    _isLoading = true;
    page = page + 1;
    try {
      final newItems =
          await CleanArchInjector.getInstance<TransactionsRepository>()
              .getMovies(page);
      if (newItems.movies!.isEmpty) {
        _hasReachedEnd = true;
      }
      movies.addAll(newItems.movies ?? []);
      notifyListeners();
    } catch (e) {
      CleanArchLog.instance.logError(e);
    }

    _isLoading = false;
  }

}
