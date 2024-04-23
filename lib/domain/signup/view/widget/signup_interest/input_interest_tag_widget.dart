import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift/core/values/colors.dart' as colors;
import 'package:lift/domain/signup/view_models/controller/signup_view_model.dart';
import 'package:textfield_tags/textfield_tags.dart';

class InputLastNameWidget extends StatelessWidget {
  InputLastNameWidget({Key? key, required this.distanceToField})
      : super(key: key);
  final distanceToField;
  final loginVM = Get.put(SignupViewModel());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Obx(() => Column(
            children: [
              TextFieldTags<String>(
                textfieldTagsController: loginVM.interestTagController.value,
                initialTags: [],
                textSeparators: const [' ', ','],
                letterCase: LetterCase.normal,
                validator: (String tag) {
                   if (loginVM.interestTagController.value.getTags!
                      .contains(tag)) {
                    return '이미 등록된 활동분야';
                  }
                  return null;
                },
                inputFieldBuilder: (context, inputFieldValues) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextField(
                      onTap: () {
                        loginVM.interestTagController.value.getFocusNode
                            ?.requestFocus();
                      },
                      controller: inputFieldValues.textEditingController,
                      focusNode: inputFieldValues.focusNode,
                      decoration: InputDecoration(
                        isDense: true,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: colors.accentColor,
                            width: 3.0,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: colors.accentColor,
                            width: 3.0,
                          ),
                        ),
                        helperText: '활동분야를 입력해주세요.',
                        helperStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        hintText: inputFieldValues.tags.isNotEmpty ? '' : "",
                        errorText: inputFieldValues.error,
                        prefixIconConstraints:
                            BoxConstraints(maxWidth: distanceToField * 0.8),
                        prefixIcon: inputFieldValues.tags.isNotEmpty
                            ? SingleChildScrollView(
                                controller:
                                    inputFieldValues.tagScrollController,
                                scrollDirection: Axis.vertical,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                    bottom: 8,
                                    left: 8,
                                  ),
                                  child: Wrap(
                                      runSpacing: 4.0,
                                      spacing: 4.0,
                                      children: inputFieldValues.tags
                                          .map((String tag) {
                                        return Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20.0),
                                            ),
                                            color: colors.accentColor,
                                          ),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              InkWell(
                                                child: Text(
                                                  '#$tag',
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                onTap: () {
                                                  //print("$tag selected");
                                                },
                                              ),
                                              const SizedBox(width: 4.0),
                                              InkWell(
                                                child: const Icon(
                                                  Icons.cancel,
                                                  size: 14.0,
                                                  color: Color.fromARGB(
                                                      255, 233, 233, 233),
                                                ),
                                                onTap: () {
                                                  inputFieldValues
                                                      .onTagRemoved(tag);
                                                },
                                              )
                                            ],
                                          ),
                                        );
                                      }).toList()),
                                ),
                              )
                            : null,
                      ),
                      onChanged: inputFieldValues.onTagChanged,
                      onSubmitted: inputFieldValues.onTagSubmitted,
                    ),
                  );
                },
              ),
            ],
          )),
    );
  }
}
