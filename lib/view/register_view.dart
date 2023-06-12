import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? selectBatch;
  List<String> batches = ['30 A', '30 B', '29 A', '29 B', '31 A', '32 B'];

  List<MultiSelectItem<int>> items = [
    MultiSelectItem(1, 'Flutter'),
    MultiSelectItem(2, 'React Js'),
  ];

  List<int> selectedItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Page"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Enter your First Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Enter your Last Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Enter your Phone No',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField(
                // validator: (value) {
                //   if (value == null) {
                //     return 'Please select batch';
                //   }
                //   return null;
                // },
                decoration: const InputDecoration(
                  labelText: 'Batch',
                  border: OutlineInputBorder(),
                ),
                items: batches
                    .map(
                      (batch) => DropdownMenuItem(
                        value: batch,
                        child: Text(batch),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectBatch = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              MultiSelectDialogField<int>(
                items: items,
                initialValue: selectedItems,
                title: const Text('Select Items'),
                buttonText: const Text('Select Items'),
                onConfirm: (List<int> results) {
                  setState(() {
                    selectedItems = results;
                  });
                },
              ),
              // const SizedBox(height: 16),
              // Text('Selected Items: ${selectedItems.join(", ")}'),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Enter first username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Enter first password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Register'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
