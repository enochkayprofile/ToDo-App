import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class CreateToDoView extends StatefulWidget {
  const CreateToDoView({Key? key}) : super(key: key);

  @override
  _CreateToDoViewState createState() => _CreateToDoViewState();
}

class _CreateToDoViewState extends State<CreateToDoView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  final GlobalKey _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Create a Todo",
          ),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: "Title",
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    hintText: "Please enter a task title",
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a title";
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                      labelText: "Description",
                      labelStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      hintText: "Please enter your task description here.",
                      hintStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter date";
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    onTap: () => showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)))
                            .then((value) {
                          setState(() {
                            _dateController.text =
                                DateFormat.yMMMd().format(value!);
                          });
                        }),
                    controller: _dateController,
                    decoration: const InputDecoration(
                        labelText: "Date",
                        labelStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        hintText: "Please enter your date here.",
                        hintStyle: TextStyle(color: Colors.black)),
                    keyboardType: TextInputType.datetime),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    onTap: () => showTimePicker(
                            context: context, initialTime: TimeOfDay.now())
                        .then((value) => setState(() {
                              _timeController.text = value!.format(context);
                            })),
                    controller: _timeController,
                    decoration: const InputDecoration(
                        labelText: "Time",
                        labelStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        hintText: "Please enter your time here.",
                        hintStyle: TextStyle(color: Colors.black)),
                    keyboardType: TextInputType.datetime),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Create",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: TextButton.styleFrom(
                      primary: Colors.white, backgroundColor: Colors.green),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
