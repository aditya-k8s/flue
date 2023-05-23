import 'package:flutter_bloc/flutter_bloc.dart';
import '../../View/Language_Screen/language_type_scren.dart';
import '../../View/Language_Screen/user_type_screen.dart';
import '../Data/Blocs/Bottom_Bar_Bloc/bottom_bar_cubit.dart';
import '../Data/Blocs/Localization_Bloc/local_cubit.dart';




class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<LocalCubit>(create: (_) => LocalCubit()),
    BlocProvider<BottomBarCubit>(create:(_)=> BottomBarCubit()),
    BlocProvider<ChangeBoolCubit>(create:(_)=> ChangeBoolCubit()),
    BlocProvider<AnotherBoolCubit>(create: (_)=>AnotherBoolCubit()),
  ];
}
