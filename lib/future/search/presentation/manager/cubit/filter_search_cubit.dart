import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_search_state.dart';

class FilterSearchCubit extends Cubit<FilterSearchState> {
  FilterSearchCubit() : super(FilterSearchInitial());

  static FilterSearchCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  int indexTapSearch = 0;
  changeIndexSearch(int index) {
    indexTapSearch = index;
    emit(FilterSearchInitial());
  }
}
