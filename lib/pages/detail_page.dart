import 'package:flutter/material.dart';
import 'package:music_player/core/const.dart';
import 'package:music_player/widgets/custom_button_widget.dart';
import 'package:music_player/widgets/custom_progress_widget.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  var _value;
  late AnimationController _controller;
  var isPlay;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(microseconds: 250),
    );
    _value = 0.0;
    isPlay = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomButtonWidget(
                    size: 50,
                    onTap: () => {Navigator.of(context).pop()},
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.styleColor,
                    ),
                  ),
                  Text(
                    "PLAYING NOW",
                    style: TextStyle(
                        color: AppColors.styleColor,
                        fontWeight: FontWeight.bold),
                  ),
                  CustomButtonWidget(
                    size: 50,
                    onTap: () => {},
                    child: Icon(
                      Icons.menu,
                      color: AppColors.styleColor,
                    ),
                  ),
                ],
              ),
            ),
            CustomButtonWidget(
              child: Icon(null),
              image: "assets/logo.jpg",
              size: MediaQuery.of(context).size.width * .7,
              borderWidth: 5,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => DetailPage(),
                ));
              },
            ),
            Text(
              "Fulme",
              style: TextStyle(
                color: AppColors.styleColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                height: 2,
              ),
            ),
            Text(
              "Fulme - KUCCA",
              style: TextStyle(
                color: AppColors.styleColor.withAlpha(90),
                fontSize: 16,
              ),
            ),
            Expanded(child: SizedBox()),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CustomProgressWidget(_value, "1.21", "3.46")),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonWidget(
                    size: 80,
                    onTap: () => {
                      setState(() {
                        if (_value > .1) {
                          _value -= .1;
                        }
                      })
                    },
                    child: Icon(
                      Icons.fast_rewind,
                      color: AppColors.styleColor,
                    ),
                    borderWidth: 5,
                  ),
                  CustomButtonWidget(
                    size: 80,
                    onTap: () => {
                      if (_controller.value == 0.0)
                        {
                          _controller.forward(),
                          setState(() {
                            isPlay = false;
                          })
                        }
                      else
                        {
                          _controller.reverse(),
                          setState(() {
                            isPlay = true;
                          }),
                        }
                    },
                    child: AnimatedIcon(
                      icon: AnimatedIcons.pause_play,
                      progress: _controller,
                      color: isPlay ? Colors.white : AppColors.styleColor,
                    ),
                    isActive: true,
                    borderWidth: 5,
                  ),
                  CustomButtonWidget(
                    size: 80,
                    onTap: () => {
                      setState(() {
                        if (_value < .9) {
                          _value += .1;
                        }
                      })
                    },
                    child: Icon(
                      Icons.fast_forward,
                      color: AppColors.styleColor,
                    ),
                    borderWidth: 5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ));
  }
}
