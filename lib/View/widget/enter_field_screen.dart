import 'package:flutter/material.dart';
import 'package:lift/View/widget/resource/custom_appbar.dart';
import 'package:textfield_tags/textfield_tags.dart';

class EnterFieldScreen extends StatefulWidget {
  const EnterFieldScreen({super.key});

  @override
  State<EnterFieldScreen> createState() => _EnterFieldScreenState();
}

class _EnterFieldScreenState extends State<EnterFieldScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: const SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            FieldTagTextField()
          ],
        )),
      ),
    );
  }
}

class FieldTagTextField extends StatefulWidget {
  const FieldTagTextField({super.key});

  @override
  State<FieldTagTextField> createState() => _FieldTagTextFieldState();
}

class _FieldTagTextFieldState extends State<FieldTagTextField> {
  final _stringTagController = StringTagController();
  @override
  Widget build(BuildContext context) {
  return TextFieldTags<String>(
        textfieldTagsController: _stringTagController,
        initialTags:['python','java'],
        textSeparators: const [' ', ','],
        validator: (String tag){
          if (tag == 'php'){
            return 'Php not allowed';
          }
          return null;
        },
        inputFieldBuilder: (context, inputFieldValues){
          return TextField(
            controller: inputFieldValues.textEditingController,
            focusNode: inputFieldValues.focusNode, 
          );
        }
      );
  }
}