import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  final Function onChanged;
  final Function resetSearch;

  const SearchTextField(
      {super.key, required this.onChanged, required this.resetSearch});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  final unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    textFieldFocusNode?.unfocus();
    textController ??= TextEditingController();
    textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      focusNode: textFieldFocusNode,
      autofocus: true,
      obscureText: false,
      onChanged: (value) {
        widget.onChanged(value);
      },
      decoration: InputDecoration(
        labelText: 'Coin...',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.4),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: textController!.text.isEmpty
            ? const Icon(
                Icons.search_rounded,
                color: Colors.grey,
              )
            : GestureDetector(
                onTap: () {
                  widget.resetSearch();
                  FocusScope.of(context).unfocus();
                  textController!.clear();
                },
                child: const Icon(Icons.cancel_outlined),
              ),
      ),
    );
  }
}
