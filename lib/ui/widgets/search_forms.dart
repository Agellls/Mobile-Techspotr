import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/theme.dart';

class SearchForms extends StatefulWidget {
  final String? title;
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function()? onClearPressed;
  final Color? fillColor;
  final bool isSearch;
  final FocusNode? focusNode;
  final bool showClearButton;

  const SearchForms({
    super.key,
    this.title,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.keyboardType,
    this.onChanged,
    this.onClearPressed,
    this.fillColor,
    this.isSearch = false,
    this.focusNode,
    this.showClearButton = false,
  });

  @override
  State<SearchForms> createState() => _SearchFormsState();
}

class _SearchFormsState extends State<SearchForms> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _hasText = _controller.text.isNotEmpty;

    // Listen for changes in the text field
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    // Only dispose the controller if we created it internally
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_onTextChanged);
    }
    super.dispose();
  }

  void _onTextChanged() {
    final hasText = _controller.text.isNotEmpty;
    if (_hasText != hasText) {
      setState(() {
        _hasText = hasText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title!,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          obscureText: widget.obscureText,
          controller: _controller,
          keyboardType: widget.keyboardType,
          onChanged: (value) {
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          cursorColor: activeColor,
          focusNode: widget.focusNode,
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.fillColor ?? whiteColor,
            contentPadding: widget.isSearch
                ? const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0)
                : const EdgeInsets.all(defaultSpace / 2),
            hintText: widget.hintText,
            hintStyle: blackTextStyle.copyWith(
              fontSize: 16,
              color: blackColor.withOpacity(0.5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            prefixIcon: widget.isSearch
                ? Icon(
                    Icons.search,
                    color: blackColor.withOpacity(0.5),
                  )
                : null,
            suffixIcon:
                (widget.isSearch || widget.showClearButton || _hasText) &&
                        _hasText
                    ? IconButton(
                        icon: Icon(Icons.clear, color: thirdtyColor),
                        onPressed: widget.onClearPressed ??
                            () {
                              _controller.clear();
                              if (widget.onChanged != null) {
                                widget.onChanged!('');
                              }
                            },
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        splashRadius: 24,
                      )
                    : null,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 48,
              minHeight: 48,
            ),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 48,
              minHeight: 48,
            ),
          ),
        ),
      ],
    );
  }
}
