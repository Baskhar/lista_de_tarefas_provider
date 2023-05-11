import 'package:flutter/material.dart';

import '../ui/todo_list_icons.dart';

class TodoListField extends StatelessWidget {
  final String label;
  final IconButton? suffixIconButton;
  final ValueNotifier<bool> obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;

  //final Icon? suffixIcon;
  final bool obscureText;

  TodoListField({
    Key? key,
    required this.label,
    //this.suffixIcon,
    this.suffixIconButton,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.focusNode,
  })  :
        //se obscure texto for igual a true. o suffixiconbuton vai receber nulo, senão ele é verdadeiro
        assert(obscureText == true ? suffixIconButton == null : true,
            'Obscure Text não pode ser enviado em conjunto com o SufixIconButton'),
        obscureTextVN = ValueNotifier(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: obscureTextVN,
        builder: (_, obscureTextValue, child) {
          return TextFormField(
            controller: controller,
            validator: validator,
            focusNode: focusNode,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              //deixar um pouco mais apertado
              isDense: true,
              //coloca icon se o obscure texto não for nulo
              suffixIcon: this.suffixIconButton ??
                  //senão não for nulo e o obscure texto for igual a true, ele coloca o icon
                  (obscureText == true
                      ? IconButton(
                          onPressed: () {
                            //igual ao inverso;
                            obscureTextVN.value = !obscureTextValue;
                          },
                          icon: Icon(!obscureTextValue
                              ? TodoListIcons.eye_slash
                              : TodoListIcons.eye),
                        )
                      : null),
            ),
            obscureText: obscureTextValue,
          );
        });
  }
}
