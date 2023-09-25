import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  bool check_val = false;
  int? selectedOption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            //  Text:Text('Just Do Register');
            ),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Just Do Register',
                style: TextStyle(
                    color: const Color.fromARGB(31, 15, 4, 4), fontSize: 20),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: 'Enter your name',
                  labelText: 'Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.length !=10) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.phone),
                  hintText: 'Enter a phone number',
                  labelText: 'Phone',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter birthdate';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: const Icon(Icons.calendar_today),
                  hintText: 'Enter your date of birth',
                  labelText: 'Dob',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!)) {
                    return 'Enter a valid email!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    icon: const Icon(Icons.email),
                    hintText: 'Enter Email',
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  }
                  if (value.length < 3) {
                    return 'Must be more than 2 charater';
                  }
                },
                decoration: InputDecoration(
                    icon: const Icon(Icons.password),
                    hintText: 'Enter Password',
                    labelText: 'password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              RadioListTile<int>(
                  title: const Text('Male'),
                  value: 1,
                  groupValue: selectedOption,
                  onChanged: (int? value) {
                    setState(() {
                      selectedOption = value;
                      print("Selected Option: $selectedOption");
                    });
                  }),
              RadioListTile<int>(
                  title: const Text('Female'),
                  value: 2,
                  groupValue: selectedOption,
                  onChanged: (int? value) {
                    setState(() {
                      selectedOption = value;
                      print("Selected Option: $selectedOption");
                    });
                  }),
              Text('Are You Sure About All the Data?'),
              CheckboxListTile(
                value: check_val,
                onChanged: (bool? val) {
                  setState(() {
                    check_val = val!;
                    if (val == true) {
                      check_val = val;
                    }
                  });
                },
              ),
              new Container(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                      child: const Text('Submit'),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
