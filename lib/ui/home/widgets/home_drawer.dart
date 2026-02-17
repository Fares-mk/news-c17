import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_c17/core/provider/theme_provider.dart';
import 'package:news_c17/core/remote/local/memory_manager.dart';
import 'package:news_c17/core/resources/assets_manager.dart';
import 'package:news_c17/core/resources/colors_manager.dart';
import 'package:news_c17/core/resources/strings_manager.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatefulWidget {
  void Function() onPress;
  HomeDrawer(this.onPress);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider provider=Provider.of<ThemeProvider>(context);
    return Drawer(
      backgroundColor: ColorsManager.lightSecondaryColor,
      child: Column(
        children: [
          Container(
              width: double.infinity,
              height: 166.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorsManager.lightPrimaryColor
              ),
              child: Text(StringsManager.appTitle,style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: ColorsManager.lightSecondaryColor),)),
          SizedBox(height: 16.h,),
          Padding(
            padding: REdgeInsets.symmetric(
              horizontal: 16
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    widget.onPress();
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(AssetsManager.home,height: 24.h,width: 24.w,),
                      SizedBox(width: 8.w,),
                      Text(StringsManager.goToHome,style: Theme.of(context).textTheme.labelMedium?.copyWith(color: ColorsManager.lightPrimaryColor),)
                    ],
                  ),
                ),
                Divider(
                  height: 48.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/roller-paint-brush.svg",height: 24.h,width: 24.w,),
                    SizedBox(width: 8.w,),
                    Text("Theme",style: Theme.of(context).textTheme.labelMedium?.copyWith(color: ColorsManager.lightPrimaryColor),)
                  ],
                ),
                SizedBox(height: 8.h,),
                DropdownButtonFormField<String>(
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(16.r),
                    dropdownColor: ColorsManager.lightSecondaryColor,
                    initialValue: provider.mode==ThemeMode.dark?"dark":"light",style: TextStyle(color: ColorsManager.lightSecondaryColor),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: ColorsManager.lightPrimaryColor
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                              color: ColorsManager.lightPrimaryColor
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                              color: ColorsManager.lightPrimaryColor
                          )
                      )
                    ),
                    items: [
                      DropdownMenuItem(
                          value:"dark" ,
                          child: Text("Dark",style: Theme.of(context).textTheme.labelMedium?.copyWith(color: ColorsManager.lightPrimaryColor),)
                      ),
                      DropdownMenuItem(
                          value: "light",
                          child: Text("Light",style: Theme.of(context).textTheme.labelMedium?.copyWith(color: ColorsManager.lightPrimaryColor))),
                    ],
                    onChanged: (value) {
                        if(value=="dark"){
                          provider.changeTheme(ThemeMode.dark);
                        }
                        else if(value=="light"){
                          provider.changeTheme(ThemeMode.light);
                        }
                        Navigator.pop(context);
                    },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
