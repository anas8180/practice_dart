import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_dart/employee/employee_model.dart';
import 'package:practice_dart/employee/employee_view_model.dart';
import 'package:provider/provider.dart';

class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    EmployeeViewModel viewModel = Provider.of(context, listen: false);
    viewModel.getEmployeeData();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
      ),
      body: Consumer<EmployeeViewModel>(
        builder: (context, vm, child) {
          if (vm.loading) {
            return const Center(child: CupertinoActivityIndicator(),);
          } else {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemBuilder: (BuildContext buildContext, int index){
                  return EmployeeCard(employeeDatum: vm.employeeDatumList[index], viewModel: vm,);
                },
                itemCount: vm.employeeDatumList.length,
              ),
            );
          }
        },
      )
    );
  }
}

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({
    super.key, required this.employeeDatum, required this.viewModel,
  });

  final EmployeeDatum employeeDatum;
  final EmployeeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400,width: 1),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle
            ),
          ),
          const SizedBox(width: 16,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(employeeDatum.employeeName, style: Theme.of(context).textTheme.titleMedium,),
                Text('${employeeDatum.employeeAge}'),
                const SizedBox(height: 8,),
                Text('${employeeDatum.employeeSalary}', style: const TextStyle(color: Colors.blueGrey, fontSize: 17),)
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){
                    viewModel.addTapped(employeeDatum);
                  }, icon: const Icon(Icons.add,color: Colors.green,)),
                  IconButton(onPressed: (){
                    viewModel.minusTapped(employeeDatum);
                  }, icon: const Icon(Icons.remove,color: Colors.red,)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
