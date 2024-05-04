import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/theme/colors/light_color_scheme.dart';
import 'custom_text_form_field.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final Widget? prefixIcon;
  final double? horizontalContentPadding, verticalContentPadding;
  final Color? backgroundColor;
  final Function(String) onQueryChanged;
  final VoidCallback onEmptyQuery;

  const CustomSearchBar({
    super.key,
    this.controller,
    this.hint,
    this.prefixIcon,
    this.horizontalContentPadding,
    this.verticalContentPadding,
    this.backgroundColor,
    required this.onQueryChanged,
    required this.onEmptyQuery,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController _searchController;
  Timer? _debounceTimer;
  String lastQuery = "";

  @override
  void initState() {
    super.initState();
    _searchController = widget.controller ?? TextEditingController();
  }

  void _onSearchQueryChanged(String query) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (query.isNotEmpty && query != lastQuery) {
        lastQuery = query;
        widget.onQueryChanged(query);
      }
      if (_searchController.text.isEmpty) {
        widget.onEmptyQuery();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: _searchController,
      onChanged: (value) => _onSearchQueryChanged(value ?? ""),
      hint: widget.hint ?? "Search",
      prefixIcon: widget.prefixIcon ??
          Icon(
            Icons.search,
            size: 24.r,
          ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: widget.horizontalContentPadding ?? 16.0.w,
        vertical: widget.verticalContentPadding ?? 10.0.h,
      ),
      backgroundColor: widget.backgroundColor ?? ColorsManager.lighterGrey,
    );
  }
}
