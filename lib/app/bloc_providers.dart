import 'package:flutter/material.dart';
import 'package:victory_link_movies/presentation/main/bloc/main_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

blocProviders(BuildContext context) {
  return [
    BlocProvider.value(value: MainBloc()),
  ];
}
