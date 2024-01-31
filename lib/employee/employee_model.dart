

class Employee {
  String status;
  List<EmployeeDatum> data;
  String message;

  Employee({
    required this.status,
    required this.data,
    required this.message,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    status: json["status"],
    data: List<EmployeeDatum>.from(json["data"].map((x) => EmployeeDatum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class EmployeeDatum {
  int id;
  String employeeName;
  int employeeSalary;
  int employeeAge;
  String profileImage;

  EmployeeDatum({
    required this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
    required this.profileImage,
  });

  factory EmployeeDatum.fromJson(Map<String, dynamic> json) => EmployeeDatum(
    id: json["id"],
    employeeName: json["employee_name"],
    employeeSalary: json["employee_salary"],
    employeeAge: json["employee_age"],
    profileImage: json["profile_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employee_name": employeeName,
    "employee_salary": employeeSalary,
    "employee_age": employeeAge,
    "profile_image": profileImage,
  };

}
