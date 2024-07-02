import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_pocket/app/core/ui/constants.dart';
import 'package:validatorless/validatorless.dart';

class PocketField extends StatefulWidget {
  final Icon preffixIcon;
  final String label;
  final bool? suffixIconButton;
  final bool obscureText;
  final ValueNotifier<bool> obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatter;

  PocketField({
    super.key,
    required this.preffixIcon,
    required this.label,
    this.suffixIconButton,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.inputFormatter,
  })  : assert(
          obscureText == true ? suffixIconButton == null : true,
          'obscureText não pode ser enviado em conjunto com o suffixIconButton',
        ),
        obscureTextVN = ValueNotifier(obscureText);

  @override
  State<PocketField> createState() => _PocketFieldState();
}

class _PocketFieldState extends State<PocketField> {
  final defaultInputBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    borderSide: BorderSide(color: ColorsConstants.grey),
  );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: widget.obscureTextVN,
      builder: (_, obscureTextValue, child) {
        return TextFormField(
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
          decoration: InputDecoration(
            prefixIcon: widget.preffixIcon,
            labelText: widget.label,
            fillColor: Colors.white,
            filled: true,
            labelStyle: const TextStyle(
              color: ColorsConstants.grey,
            ),
            prefixIconColor: ColorsConstants.grey,
            suffixIcon: widget.suffixIconButton ?? (widget.obscureText == true)
                ? IconButton(
                    onPressed: () {
                      widget.obscureTextVN.value = !obscureTextValue;
                    },
                    icon: Icon(!obscureTextValue
                        ? Icons.visibility_off
                        : Icons.visibility),
                  )
                : null,
            suffixIconColor: ColorsConstants.grey,
            border: defaultInputBorder,
            enabledBorder: defaultInputBorder,
            focusedBorder: defaultInputBorder.copyWith(
              borderSide: const BorderSide(
                color: ColorsConstants.green,
              ),
            ),
            errorBorder: defaultInputBorder.copyWith(
              borderSide: const BorderSide(
                color: ColorsConstants.red,
              ),
            ),
            isDense: true,
          ),
          obscureText: obscureTextValue,
          style: const TextStyle(color: ColorsConstants.grey),
          controller: widget.controller,
          validator:
              widget.validator ?? Validatorless.required('Campo obrigatório'),
          inputFormatters: widget.inputFormatter ?? [],
        );
      },
    );
  }
}
