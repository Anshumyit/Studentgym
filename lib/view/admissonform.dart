import 'package:fitnessgyms/view/submin_editform.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_controller/bottomscreencontroller.dart';

class Admissonform extends StatefulWidget {
 const Admissonform({super.key});

  @override
  State<Admissonform> createState() => _AdmissonformState();
}

class _AdmissonformState extends State<Admissonform> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  final TextEditingController jobController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  List<String> gender = ["Male", "Female", "Other"];

  final List<String> selected = ["Yes", "No"];


  @override
  void dispose() {
    nameController.text;
    emailController.text;
    ageController.text;
    phoneController.text;
    addressController.text;
    jobController.text;
    ageController.text;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Admission Form'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/gymbackground.png'),
            fit: BoxFit.cover, // or BoxFit.fill or BoxFit.contain
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ), // Rounded corners
                      ),
                    ),
                      validator:(String? value){
                        if(value==null || value.isEmpty){
                          return "Please Enter the Name";
                        }
                        return null;
                      }
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email ID',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ), // Rounded corners
                      ),
                    ),
                      validator:(value){
                        if(value!.isEmpty){
                          return "Please Enter the Email ID";
                        }
                        return null;
                      }
                  ),
                  SizedBox(height: 20),
                  // Row(
                  //   children: [
                  //     TextFormField(
                  //       decoration: InputDecoration(
                  //         hintText: "Age",
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(12)
                  //         )
                  //       ),
                  //     )
                  //   ],
                  // ),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ), // Rounded corners
                      ),
                    ),
                      validator:(value){
                        if(value!.isEmpty){
                          return "Please Enter the Phone number";
                        }
                        return null;
                      }
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ), // Rounded corners
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) return 'Address is required';
                      if (!RegExp(r'^[a-zA-Z0-9\s,.-]+$').hasMatch(value)) {
                        return 'Address can contain letters, numbers, and ,.-';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: jobController,
                    decoration: InputDecoration(
                      labelText: 'job or Student',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ), // Rounded corners
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter the Job OR Student";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: ageController,
                          decoration: InputDecoration(
                            labelText: "Age",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (String ?value) {
                            if (value == null || value.isEmpty) return 'Age is required';
                            if (!RegExp(r'^\d{1,2}$').hasMatch(value)) return 'Enter 1 or 2 Digit Number';
                            return null;

                          },
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: provider.dropdownvalue,
                          decoration: const InputDecoration(
                            labelText: "Gender",
                            border:
                                OutlineInputBorder(), // makes it look like a TextField
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                          ),
                          validator: (gender) {
                            if (gender!.isEmpty) {
                              return "Please Enter the Name";
                            }
                            return null;
                          },
                          items:
                              gender.map((String value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                          onChanged: (String? change) {
                            provider.setdropdownvalue(change ?? "");
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Trainer need"),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    value: provider.selectedYesNo,
                    decoration: const InputDecoration(
                      labelText: "Yes/No",
                      border:
                          OutlineInputBorder(), // makes it look like a TextField
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                    ),

                    items:
                        selected.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                    onChanged: (String? newchange) {
                      provider.setselectedYesNo(newchange ?? "");
                    },
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubmitForm(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                address: addressController.text,
                                profession: jobController.text,
                                age: ageController.text,
                                gender: provider.dropdownvalue?? "",
                                trainer: provider.selectedYesNo ?? "",
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Submit', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
