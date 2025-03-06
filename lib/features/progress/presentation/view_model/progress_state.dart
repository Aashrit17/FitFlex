part of 'progress_bloc.dart';

class ProgressState extends Equatable {
  final List<ProgressHistoryEntity> progress;
  final bool isLoading;
  final String? error;

  const ProgressState({
    required this.progress,
    required this.isLoading,
    this.error,
  });

  factory ProgressState.initial() {
    return const ProgressState(
      progress: [],
      isLoading: false,
    );
  }

  ProgressState copyWith({
    List<ProgressHistoryEntity>? progress,
    bool? isLoading,
    String? error,
  }) {
    return ProgressState(
      progress: progress ?? this.progress,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [progress, isLoading, error];
}
