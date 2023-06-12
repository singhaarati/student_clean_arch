import 'package:hive/hive.dart';
import 'package:student_clean_arch/config/constants/hive_table_constant.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entity/course_entity.dart';

part 'course_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.courseTableId)
class CourseHiveModel {
  @HiveField(0)
  final String? courseId;

  @HiveField(1)
  final String? courseName;

  //empty consturctor

  CourseHiveModel.empty() : this(courseId: '', courseName: '');

  CourseHiveModel({
    String? courseId,
    required this.courseName,
  }) : courseId = courseId ?? const Uuid().v4();

  //convert Hive object to entity
  CourseEntity toEntity() => CourseEntity(
        courseId: courseId,
        courseName: courseName!,
      );

  //convert entity to hive object
  CourseHiveModel toHiveModel(CourseEntity entity) => CourseHiveModel(
        //batchId: entity.batchId,
        courseName: entity.courseName,
      );

  List<CourseHiveModel> toHiveModelList(List<CourseEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  //convert hive list to entity list
  List<CourseEntity> toEntityList(List<CourseHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();
}
