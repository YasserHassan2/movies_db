import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:victory_link_movies/app/constants.dart';
import 'package:victory_link_movies/presentation/common/widgets/custom_network_image_widget.dart';
import 'package:victory_link_movies/presentation/movie_details/bloc/movie_details_bloc.dart';
import 'package:victory_link_movies/utils/resources/values_manager.dart';

import '../../../domain/model/popular_movies_model.dart';
import '../../../utils/dialogs/custom_dialog.dart';
import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/font_manager.dart';
import '../../../utils/resources/strings_manager.dart';
import '../../../utils/resources/styles_manager.dart';
import '../../common/widgets/custom_language_widget.dart';
import '../../common/widgets/custom_scaffold.dart';
import '../../common/widgets/custom_text_button.dart';
import '../../common/widgets/page_builder.dart';

class MovieDetailsView extends StatefulWidget {
  final String movieId;

  MovieDetailsView({required this.movieId});

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  bool _displayLoadingIndicator = false;
  Movie? movie;

  @override
  void initState() {
    BlocProvider.of<MovieDetailsBloc>(context)
        .add(getMovieDetails(widget.movieId));
    super.initState();
  }

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
  Widget build(BuildContext context) {
    return CustomScaffold(
      pageBuilder: PageBuilder(
          appbar: true,
          resizeToAvoidBottomInsets: true,
          allowBackButtonInAppBar: true,
          context: context,
          body: _getContentWidget(context),
          scaffoldKey: _key,
          appBarActions: [LanguageWidget()],
          displayLoadingIndicator: _displayLoadingIndicator,
          appBarTitle: movie?.title ?? ""),
    );
  }

  Widget _getContentWidget(BuildContext context) {
    return BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
      listener: (context, state) {
        if (state is MovieDetailsLoading) {
          startLoading();
        } else {
          stopLoading();
        }
        if (state is MovieDetailsSuccess) {
          this.movie = state.movie;
        }
        if (state is AddedToFavouritesSuccess) {
          CustomDialog(context).showSuccessDialog(
              '', '', AppStrings.addedToFavSuccess.tr(), onBtnPressed: () {
            Navigator.pop(context);
          });
        }
        if (state is MovieDetailsFailure) {
          CustomDialog(context).showErrorDialog('', '', state.message);
        }
      },
      builder: (context, state) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: AppSize.s160,
                  height: AppSize.s190,
                  child: CustomNetworkImageWidget(
                    imageUrl: movie != null
                        ? Constants.imagePath + movie!.posterPath.toString()
                        : "",
                  ),
                ),
              ),
              Center(
                child: Text(
                  movie?.title ?? "",
                  textAlign: TextAlign.center,
                  style: getRegularStyle(
                      color: ColorManager.white, fontSize: FontSize.s24),
                ),
              ),
              Text(
                movie?.overview ?? "",
                textAlign: TextAlign.center,
                style: getRegularStyle(
                    color: ColorManager.white, fontSize: FontSize.s14),
              ),
              Spacer(),
              Visibility(
                visible: movie != null,
                child: CustomTextButton(
                  text: AppStrings.addToFav.tr(),
                  borderColor: Colors.transparent,
                  textColor: ColorManager.primary,
                  backgroundColor: ColorManager.supportTextColor,
                  onPressed: () {
                    BlocProvider.of<MovieDetailsBloc>(context)
                        .add(addMovieToFavourites(movie!));
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MovieDetailsArguments {
  String movieId;

  MovieDetailsArguments(this.movieId);
}
