import 'package:flutter/material.dart';

import 'edit_admission_form.dart';

class SubmitForm extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String profession;
  final String gender;
  final String trainer;
  final String age;

  const SubmitForm({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.profession,
    required this.gender,
    required this.trainer,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submitted Form')),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/gymbackground.png'),
            fit: BoxFit.cover, // or BoxFit.fill or BoxFit.contain
          ),
        ),
        child:SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: Colors.white.withOpacity(0.9),
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichTextCustome("Name",name),
                  RichTextCustome("Email ID",email),
                  RichTextCustome("Phone" ,phone),
                  RichTextCustome("Address" ,address),
                  RichTextCustome("Profession" ,profession),
                  RichTextCustome("Gender" ,gender),
                  RichTextCustome("Age" ,age),
                  RichTextCustome("Trainer" ,trainer),

                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.check),
                      label: const Text("OK"),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.edit),
                      label: const Text("Edit"),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        backgroundColor: Colors.orange,
                      ),
                      onPressed: () {
                        // Navigator.pop(context); // Or navigate to edit form
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>EditAdmissionForm(
                          name: name,
                          email: email,
                          phone: phone,
                          address: address,
                          profession: profession,
                          age: age,
                          gender: gender,
                          trainer: trainer,
                        )));
                      },
                    ),
                  ])

                ],
              )
            ),
          ),
        ),
      )
    );
  }
}





  Widget RichTextCustome(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 18, color: Colors.black),
          children: [
            TextSpan(
              text: "$label: ",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }


