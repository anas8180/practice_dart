
import 'package:flutter/cupertino.dart';
import 'package:practice_dart/employee/employee_model.dart';
import 'package:practice_dart/employee/employee_repository.dart';

class EmployeeViewModel extends ChangeNotifier {

  List<EmployeeDatum> _employeeDatumList = [];
  List<EmployeeDatum> get employeeDatumList => _employeeDatumList;

  bool _loading = false;
  bool get loading => _loading;

  String _error = '';
  String get error => _error;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setError(String error) {
    _error = error;
  }

  setEmployeeList(List<EmployeeDatum> employeeList) {
    _employeeDatumList = employeeList;
  }

  getEmployeeData() async {
    await Future.delayed(const Duration(microseconds: 500));
    setLoading(true);
    EmployeeRepository.getEmployeeLists().then((value) {
      if (value.error != null) {
        setError(value.error!);
      } else if (value.data != null) {
        setEmployeeList((value.data as Employee).data);
      }
      setLoading(false);
    });
  }

  changeEmployeeData(String operator, EmployeeDatum employeeDatum) {
    int salary = employeeDatum.employeeSalary;
    int newSalary = (salary * 20/100).round();

    final currentIndex = _employeeDatumList.indexOf(employeeDatum);
    if (operator == '+') {
      employeeDatumList[currentIndex].employeeSalary = salary + newSalary;
    } else if (operator == '-'){
      employeeDatumList[currentIndex].employeeSalary = salary - newSalary;
    }

    notifyListeners();
  }

  addTapped(EmployeeDatum employeeDatum) {
    changeEmployeeData('+', employeeDatum);
  }

  minusTapped(EmployeeDatum employeeDatum) {
    changeEmployeeData('-', employeeDatum);
  }

}