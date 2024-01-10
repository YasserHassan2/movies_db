import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:victory_link_movies/app/constants.dart';
import 'package:victory_link_movies/domain/model/popular_movies_model.dart';
import 'package:victory_link_movies/presentation/common/widgets/custom_network_image_widget.dart';

import '../../../utils/dialogs/custom_dialog.dart';
import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/font_manager.dart';
import '../../../utils/resources/strings_manager.dart';
import '../../../utils/resources/styles_manager.dart';
import '../../../utils/resources/values_manager.dart';
import '../../common/widgets/custom_language_widget.dart';
import '../../common/widgets/custom_scaffold.dart';
import '../../common/widgets/custom_text_input_field.dart';
import '../../common/widgets/page_builder.dart';
import '../bloc/main_bloc.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  bool _displayLoadingIndicator = false;
  TextEditingController _searchController = TextEditingController();
  PopularMoviesModel? popularMoviesModel;
  List<Movie> movies = [];

  int currentPageNumber = 2;

  void startLoading() {
    setState(() {
      _displayLoadingIndicator = true;
    });
  }

  void stopLoading() {
    setState(() {
      _displayLoadingIndicator = false;
    });
  }

  @override
  void initState() {
    BlocProvider.of<MainBloc>(context).add(getPopularMovies(currentPageNumber));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      pageBuilder: PageBuilder(
          appbar: true,
          resizeToAvoidBottomInsets: true,
          allowBackButtonInAppBar: false,
          context: context,
          body: _getContentWidget(context),
          scaffoldKey: _key,
          appBarActions: [LanguageWidget()],
          displayLoadingIndicator: _displayLoadingIndicator,
          appBarTitle: AppStrings.popularMovies.tr()),
    );
  }

  Widget _getContentWidget(BuildContext context) {
    return BlocListener<MainBloc, MainState>(
      listener: (context, state) {
        if (state is MainLoading) {
          startLoading();
        } else {
          stopLoading();
        }
        if (state is MainSuccess) {
          currentPageNumber++;
          popularMoviesModel = state.popularMoviesModel;
          movies.addAll(popularMoviesModel!.results);
        }
        if (state is MainFailure) {
          CustomDialog(context).showErrorDialog('', '', state.message);
        }
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification &&
              notification.metrics.extentAfter == 0) {
            // User has reached the end of the list
            // Load more data or trigger pagination in flutter
            BlocProvider.of<MainBloc>(context)
                .add(getPopularMovies(currentPageNumber));
          }
          return false;
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: AppSize.s12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   "${AppStrings.searchForMovie.tr()}",
              //   style: getRegularStyle(color: ColorManager.labelsTextColor),
              // ),
              CustomTextInputField(
                labelText: AppStrings.searchForMovie.tr(),
                showLabelText: true,
                controller: _searchController,
                hintText: AppStrings.searchHere.tr(),
                suffixIcon: Icon(
                  Icons.search,
                  color: ColorManager.black,
                ),
                onChanged: (value) {},
              ),
              popularMoviesModel != null
                  ? Expanded(child: MoviesListWidget(movies))
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget MoviesListWidget(List<Movie> moviesList) {
    return ListView.builder(
      itemCount: moviesList.length, // Add 1 for loading indicator
      itemBuilder: (context, index) {
        return MovieItemWidget(moviesList[index]);
      },
    );
  }

  Widget MovieItemWidget(Movie movie) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            width: AppSize.s90,
            child: CustomNetworkImageWidget(
                imageUrl: Constants.imagePath + movie.posterPath),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    textAlign: TextAlign.start,
                    style: getRegularStyle(
                        color: ColorManager.black, fontSize: FontSize.s14),
                  ),
                  Text(
                    movie.title,
                    textAlign: TextAlign.start,
                    style: getRegularStyle(
                        color: ColorManager.black, fontSize: FontSize.s12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
