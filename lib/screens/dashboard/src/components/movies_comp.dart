import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_arch/clean_arch.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sinflix_app/repository/transactions/transactions_repository.dart';
import 'package:sinflix_app/schemas/http/movies_schema/movies_schema.dart';
import 'package:sinflix_app/screens/dashboard/dashboard.dart';

class MovieComponent extends StatelessWidget {
  const MovieComponent({
    super.key,
    required this.movie,
    required this.controller,
  });
  final Movies movie;
  final DashboardController controller;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: FadeIn(
            delay: Duration(seconds: 1),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: movie.poster ?? "",
                  errorWidget: (context, url, error) {
                    return Image.asset(
                      CA.assets.images(
                        "Dashboard_ExampleBg.png",
                      ),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 140.w) +
                        context.padding.horizontalNormal,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: FutureBuilder(
                              future: CleanArchInjector.getInstance<
                                      TransactionsRepository>()
                                  .getFavoriteMovies(),
                              builder: (context, snapshot) {
                                bool isFav = false;
                                for (var mov
                                    in snapshot.data?.movies ?? <Movies>[]) {
                                  if (mov.id == movie.id) {
                                    isFav = true;
                                  }
                                }
                                return FavoriteButton(
                                  isFavorite: isFav,
                                  valueChanged: (favorite) {
                                    CleanArchInjector.getInstance<
                                            TransactionsRepository>()
                                        .addFavorite(
                                      movie.id ?? "",
                                    );
                                  },
                                );
                              }),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              CA.assets.images("home_example_movie_logo.svg"),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CleanArchText(
                                  movie.title ?? "",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 278.w,
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      children: [
                                        TextSpan(text: movie.description ?? ""),
                                        TextSpan(
                                          text: "Daha Fazlası",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 100.w +
              MediaQuery.paddingOf(context)
                  .bottom, // karanlık kısmın yüksekliği
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.2],
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
