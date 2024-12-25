import 'package:flutter/material.dart';

class ScoreFrom extends StatefulWidget {
  const ScoreFrom({super.key});

  @override
  State<ScoreFrom> createState() => _ScoreFromState();
}

class _ScoreFromState extends State<ScoreFrom> {
  final _formKey=GlobalKey<FormState>();
  String enteredName='';
  int enteredScore= 1;
  // function submit
  void onSave(){
    bool isValid=_formKey.currentState!.validate();
    if(isValid){
      _formKey.currentState!.save();
      print(enteredName);
      print(enteredScore);
      Navigator.of(context).pop();
    }
  }
  //function to validate name
  String? validateName(String? value){
    if(value == null || value.trim().length >50 ||value.isEmpty){
      return "Must be a name between 1 to 50";
    }
    return null;
  }
  // function to validate score
  String? validateScore(String? value){
    final score=double.tryParse(value??'');
    if(score==null || score >100 || score <0){
      return "Must be a score between 0 to 100";
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Enter name form field
              TextFormField(
                initialValue: enteredName,
                maxLength: 50,
                validator: validateName,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                onSaved: (value){
                  enteredName=value!;
                },
              ),
              const SizedBox(height: 15),
              // Enter score form field
              TextFormField(
                initialValue: enteredScore.toString(),
                validator: validateScore,
                decoration: const InputDecoration(
                  label: Text('Score'),
                ),
                onSaved: (value){
                  enteredScore=int.parse(value!);
                },
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: onSave,
                child: const Text('Add Item'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
