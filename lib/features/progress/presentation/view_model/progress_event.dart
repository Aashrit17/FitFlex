part of 'progress_bloc.dart';

@immutable
sealed class ProgressEvent extends Equatable {
  const ProgressEvent();

  @override
  List<Object> get props => [];
}

final class LoadProgress extends ProgressEvent {}

class LoadImage extends ProgressEvent {
  final File file;

  const LoadImage({
    required this.file,
  });
}

// final class AddProgress extends ProgressEvent {
//   final String progressName;
//   final int progressCalorie;

//   const AddProgress({required this.progressName, required this.progressCalorie});

//   @override
//   List<Object> get props => [progressName, progressCalorie];
// }

final class DeleteProgress extends ProgressEvent {
  final String progressId;

  const DeleteProgress({required this.progressId});

  @override
  List<Object> get props => [progressId];
}
