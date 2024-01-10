import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:victory_link_movies/presentation/main/view/main_view.dart';
import 'package:victory_link_movies/presentation/movie_details/view/movie_details_view.dart';
import 'package:victory_link_movies/utils/resources/strings_manager.dart';

import '../../app/di.dart';

class Routes {
  static const String mainRoute = "/main";
  static const String movieDetails = "/movieDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainRoute:
        initMainModule();
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.movieDetails:
        final args = settings.arguments as MovieDetailsArguments;
        initMovieDetailsModule();
        return MaterialPageRoute(
            builder: (_) => MovieDetailsView(
                  movieId: args.movieId,
                ));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRouteFound.tr()),
              ),
              body: Center(child: Text(AppStrings.noRouteFound.tr())),
            ));
  }
}
