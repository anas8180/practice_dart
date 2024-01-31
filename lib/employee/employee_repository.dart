
import 'package:practice_dart/employee/employee_model.dart';
import 'package:practice_dart/network/network_api_service.dart';

class EmployeeRepository {

  static Future<AppResponse> getEmployeeLists() async {
    NetworkApiService networkApiService = NetworkApiService();

    Employee? employee;
    String? error;

    try {
      dynamic response = await networkApiService.getResponse(Uri.parse('https://dummy.restapiexample.com/api/v1/employees'));
      employee = Employee.fromJson(response);
    } catch(e) {
      error = e.toString();
    }
    return AppResponse(error: error, data: employee);
  }
}

class AppResponse<T> {
  String? error;
  T? data;

  AppResponse({this.error, this.data});
}

