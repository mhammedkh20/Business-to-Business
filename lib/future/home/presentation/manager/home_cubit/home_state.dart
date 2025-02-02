part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadingData extends HomeState {}

class SuccessData extends HomeState {
  final String data;
  SuccessData(this.data);
}

class FailureData extends HomeState {
  final String message;
  FailureData(this.message);
}

class NewsLoading extends HomeState {}

class NewsPaginationLoading extends HomeState {}

class NewsSuccess extends HomeState {}

class NewsFailure extends HomeState {
  final String message;
  NewsFailure(this.message);
}
