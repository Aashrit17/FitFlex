// import 'package:fitflex/app/di/di.dart';
// import 'package:fitflex/features/auth/presentation/view/login_view.dart';
// import 'package:fitflex/features/auth/presentation/view_model/login/login_bloc.dart';
// import 'package:fitflex/features/dashboard/presentation/view_model/home_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit() : super(HomeState.initial());

//   void onTabTapped(int index) {
//     emit(state.copyWith(selectedIndex: index));
//   }

//   void logout(BuildContext context) {
//     // Wait for 2 seconds
//     Future.delayed(const Duration(seconds: 2), () async {
//       if (context.mounted) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => BlocProvider.value(
//               value: getIt<LoginBloc>(),
//               child: const LoginView(),
//             ),
//           ),
//         );
//       }
//     });
//   }
// }
