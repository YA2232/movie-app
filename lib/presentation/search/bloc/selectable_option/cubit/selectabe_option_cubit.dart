import 'package:bloc/bloc.dart';

enum SearchType { movie, tv }

class SelectabeOptionCubit extends Cubit<SearchType> {
  SelectabeOptionCubit() : super(SearchType.movie);
  void selectMovie() => emit(SearchType.movie);
  void selectTv() => emit(SearchType.tv);
}
