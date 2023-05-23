import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../View_Model_Data/user_prefences.dart';
import 'local_state.dart';

class LocalCubit extends Cubit<LocaleState>{
  LocalCubit()
      : super(SelectedLocale(UserPrefences.languageType == null
      ? const Locale('en')
      : UserPrefences.languageType == "fr"
      ? const Locale('fr')
      : const Locale('en')));

  void toEnglish()=>emit(SelectedLocale(const Locale('en')));
  void toFrench() => emit(SelectedLocale(const Locale('fr')));

}