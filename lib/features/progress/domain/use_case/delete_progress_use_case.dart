// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:fitflex/app/shared_prefs/token_shared_prefs.dart';
// import 'package:fitflex/app/usecase/usecase.dart';
// import 'package:fitflex/core/error/failure.dart';
// import 'package:fitflex/features/exercise/domain/repository/exercise_repository.dart';
// import 'package:fitflex/features/progress/domain/repository/progress_repository.dart';


// class DeleteProgressParams extends Equatable {
//   final String progressId;

//   const DeleteProgressParams({required this.progressId});

//   const DeleteProgressParams.empty() : progressId = '_empty.string';

//   @override
//   List<Object?> get props => [
//         progressId,
//       ];
// }

// class DeleteProgressUsecase implements UsecaseWithParams<void, DeleteProgressParams> {
//   final IProgressRepository progressRepository;
//   final TokenSharedPrefs tokenSharedPrefs;

//   DeleteProgressUsecase({
//     required this.progressRepository,
//     required this.tokenSharedPrefs,
//   });

//   @override
//   Future<Either<Failure, void>> call(DeleteProgressParams params) async {
//     // Get token from Shared Preferences and send it to the server
//     final token = await tokenSharedPrefs.getToken();
//     return token.fold((l) {
//       return Left(l);
//     }, (r) async {
//       return await progressRepository.deleteProgress(params.progressId, r);
//     });
//   }
// }
