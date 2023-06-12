import 'package:hive/hive.dart';
import 'package:student_clean_arch/config/constants/hive_table_constant.dart';
import 'package:student_clean_arch/features/batch/domain/entity/batch_entity.dart';
import 'package:uuid/uuid.dart';

part 'batch_hive_model.g.dart';

/// dart run build_runner build --delete-conflicting-outputs in terminal to generate

@HiveType(typeId: HiveTableConstant.batchTableId)
class BatchHiveModel {
  @HiveField(0)
  final String? batchId;

  @HiveField(1)
  final String? batchName;

  //empty consturctor

  BatchHiveModel.empty() : this(batchId: '', batchName: '');

  BatchHiveModel({
    String? batchId,
    required this.batchName,
  }) : batchId = batchId ?? const Uuid().v4();

  //convert Hive object to entity
  BatchEntity toEntity() => BatchEntity(
        batchId: batchId,
        batchName: batchName!,
      );

  //convert entity to hive object
  BatchHiveModel toHiveModel(BatchEntity entity) => BatchHiveModel(
        //batchId: entity.batchId,
        batchName: batchName,
      );

  //convert hive list to entity list
  List<BatchEntity> toEntityList(List<BatchHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();

  // @override
  // String toStr
}
