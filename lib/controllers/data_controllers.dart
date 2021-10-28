import 'dart:developer';

import 'package:get/get.dart';
import 'package:mpresa_bank/services/data_services.dart';

class DataController extends GetxController {
  var list = [].obs;
  final Service = DataServices();
  final _loading = false.obs;

  get loading {
    return _loading.value; //same as arrow function (=>)
  }
  // get loading=> _loading.value: This is called Error function

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  get newList => list.where((e) => e["status"]).map((e) => e); //one line arrow function
  // return list.where((e) => e["status"]).map((e) =>
  //     e); //checks if the item in the list is true if true it will execute the whole statement
  //if false then it will not do anything and wont add anything to newList  Variable

  // var nlist = list.map((element) => element);(to access the old values not the new ones)

  _loadData() async {
    _loading.value = false;

    try {
      var info = Service.getUsers();
      list.addAll(await info);
    } catch (e) {
      print("Encountered an error while reading data...");
      print(e);
    } finally {
      _loading.value = true;
    }
  }
}
