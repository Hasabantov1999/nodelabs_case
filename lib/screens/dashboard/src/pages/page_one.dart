part of '../../dashboard.dart';

class _PageOne extends StatefulWidget {
  const _PageOne({
    required this.controller,
  });
  final DashboardController controller;

  @override
  State<_PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<_PageOne>
    with AutomaticKeepAliveClientMixin<_PageOne> {
  @override
  bool get wantKeepAlive => true; // Sayfanın durumu korunacak
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PageView.builder(
      controller: widget.controller.moviePageController,
      scrollDirection: Axis.vertical,
      itemCount: widget.controller.movies.length,
      itemBuilder: (context, index) {
        return MovieComponent(
          controller: widget.controller,
          movie: widget.controller.movies[index],
        );
      },
    );
  }
}
