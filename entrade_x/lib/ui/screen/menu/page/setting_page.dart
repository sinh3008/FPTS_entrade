import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../blocs/theme/theme_bloc.dart';
import '../../../../theme/constrants.dart';
import '../../../../theme/size_config.dart';
import '../../../components/circle_k.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  static String routerName = 'setting_page';

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isSwitched = true;
  bool isSwitched1 = true;

  void _toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt'),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: getProportionateScreenHeight(20)),
          color: Theme.of(context).appBarTheme.foregroundColor,
          child: Column(
            children: [
              buildContainer(
                text: 'Đổi mật khẩu',
                widget: Container(
                  alignment: Alignment.centerRight,
                  child: const Icon(
                    Icons.navigate_next_outlined,
                    color: kGrey,
                  ),
                ),
              ),
              buildContainer(
                text: 'Cài đặt thông báo',
                widget: Container(
                  alignment: Alignment.centerRight,
                  child: const Icon(
                    Icons.navigate_next_outlined,
                    color: kGrey,
                  ),
                ),
              ),
              buildContainer(
                text: 'Đăng nhập bằng sinh trắc học',
                widget: Container(
                  alignment: Alignment.centerRight,
                  child: Switch(
                    value: isSwitched,
                    onChanged: _toggleSwitch,
                    activeTrackColor: Colors.red.withOpacity(0.5),
                    activeColor: Colors.red,
                  ),
                ),
              ),
              BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return buildContainer(
                    text: 'Chế độ tối',
                    widget: Container(
                      alignment: Alignment.centerRight,
                      child: Switch(
                        value: state.isDark,
                        onChanged: (value) {
                          context.read<ThemeBloc>().add(
                              SwitchThemeEvent(turnOnDarkTheme: value));
                        },
                        activeTrackColor: Colors.red.withOpacity(0.5),
                        activeColor: Colors.red,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer(
      {required String text, required Widget widget,  Color color = Colors.transparent}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(16),
          vertical: getProportionateScreenHeight(12)),
      width: SizeConfig.screenWidth,
      color: Theme.of(context).appBarTheme.foregroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 8,
            child: Text(
              text,
              style: kText15Normal.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          Expanded(
            flex: 2,
            child: buildCircleK(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(30),
              height: getProportionateScreenHeight(22),
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              demo: widget,
              color: color,
              onClicked: () {},
            ),
          ),
        ],
      ),
    );
  }
}
