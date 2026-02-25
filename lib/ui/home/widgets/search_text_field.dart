import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_c17/core/resources/assets_manager.dart';

class SearchTextField extends StatefulWidget {
  Function() onClick;
  Function(String) onChanged;
  TextEditingController searchController;
  SearchTextField({super.key, required this.onClick,required this.searchController,required this.onChanged});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(8.0),
      child: Container(
        height: 63.h,
        child: TextFormField(
          controller: widget.searchController,
          onChanged: widget.onChanged,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20.sp,fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  widget.onClick();
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                  AssetsManager.close,
                  colorFilter:ColorFilter.mode(Theme.of(context).colorScheme.secondary, BlendMode.srcIn) ,
                ),
              ),
            ),
            suffixIconColor: Theme.of(context).colorScheme.secondary,
            suffixIconConstraints: BoxConstraints(maxHeight: 50.h)
          ),
        ),
      ),
    );
  }
}
