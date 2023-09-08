class StudentField{
  static const String studentName = "studentName";
  static const String course = "course";
  static const String contact = "contact";
  static const String avatar = "avatar";
  static const String averageScore = "averageScore";
  static const String gender = "gender";
  static const String id = "id";

  static const String studentTable = "studentTable";
}

class StudentModel {
  final int id;
  final String studentName;
  final int course;
  final String contact;
  final String avatar;
  final int averageScore;
  final String gender;

  StudentModel(
      {this.id = 0,
      required this.avatar,
      required this.contact,
      required this.gender,
      required this.studentName,
      required this.course,
      required this.averageScore,
      });

  StudentModel copyWith({
    int? id,
    String? studentName,
    int? course,
    String? contact,
    String? avatar,
    int? averageScore,
    String? gender,
  }) =>
      StudentModel(
        studentName: studentName ?? this.studentName,
        contact: contact ?? this.contact,
        id: id ?? this.id,
        course: course ?? this.course,
        averageScore: averageScore ?? this.averageScore,
        avatar: avatar ?? this.avatar,
        gender: gender ?? this.gender,
      );

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json["id"] as int? ?? 0,
      studentName: json["studentName"] as String? ?? "",
      averageScore: json["averageScore"] as int? ?? 0,
      course: json["course"] as int? ?? 0,
      avatar: json["avatar"] as String? ?? "",
      contact: json["contact"] as String? ?? "",
      gender: json["gender"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "studentName": studentName,
      "contact": contact,
      "averageScore": averageScore,
      "course": course,
      "avatar": avatar,
      "gender": gender,
    };
  }
}
