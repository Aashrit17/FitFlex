import 'package:fitflex/features/progress/domain/entity/progress_entity.dart';

abstract interface class IProgressDataSource {
  Future<List<ProgressHistoryEntity>> getProgress(String id);
  Future<void> createProgress(ProgressEntity progress);
  // Future<void> deleteProgress(String id, String? token);
}
