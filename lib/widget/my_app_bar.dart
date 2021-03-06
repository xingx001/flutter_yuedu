import 'package:flutter/material.dart';

/// appbar 返回按钮类型
enum AppBarBackType { Back, Close, None }

const double kNavigationBarHeight = 44.0;

// 自定义 AppBar
class MyAppBar extends AppBar implements PreferredSizeWidget {
  MyAppBar(
      {Key key,
      Widget title,
      AppBarBackType leadingType,
      Widget leading,
      Brightness brightness,
      Color backgroundColor,
      List<Widget> actions,
      double elevation})
      : super(
          key: key,
          title: title,
          brightness: brightness ?? Brightness.light,
          backgroundColor: backgroundColor ?? Color(0xfffefefe),
          leading: leading ??
              (leadingType == AppBarBackType.None
                  ? null
                  : AppBarBack(leadingType ?? AppBarBackType.Back)),
          actions: actions,
          elevation: elevation ?? 0,
        );
  @override
  get preferredSize => Size.fromHeight(44);
}

// 自定义返回按钮
class AppBarBack extends StatelessWidget {
  final AppBarBackType _backType;

  AppBarBack([this._backType]);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: _backType == AppBarBackType.Close
          ? Image.asset("images/main/parentveri_close.png")
          : Image.asset("images/main/btn_back_normal.png"),
    );
  }
}

class MyTitle extends StatelessWidget {
  final String _title;

  MyTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(_title,
        style: TextStyle(
            color: Colors.black87,
            fontSize: 15,
            fontWeight: FontWeight.normal));
  }
}
