import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:self_stack/utils/constans.dart';

class SliverBarTemplate extends StatelessWidget {
  final String imagePath;

  const SliverBarTemplate({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(

      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      expandedHeight: 210.0,
      backgroundColor:kselfstackGreen,
      elevation: 0.0,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
        stretchModes: const [
          StretchMode.zoomBackground,
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          height: 32.0,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: kbackgroundmodel,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
          ),
        ),
      ),
    );
  }
}