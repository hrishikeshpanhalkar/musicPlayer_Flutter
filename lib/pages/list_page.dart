import 'package:flutter/material.dart';
import 'package:music_player/core/const.dart';
import 'package:music_player/models/music_model.dart';
import 'package:music_player/pages/detail_page.dart';
import 'package:music_player/widgets/custom_button_widget.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late List<MusicModel> _list;
  late int _playId;

  @override
  void initState() {
    _playId = 1;
    _list = MusicModel.list;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: Text(
          "skin - Flume",
          style: TextStyle(color: AppColors.styleColor),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomButtonWidget(
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.styleColor,
                      ),
                      size: 50,
                      onTap: () {},
                    ),
                    CustomButtonWidget(
                      child: Icon(null),
                      image: "assets/logo.jpg",
                      size: 150,
                      borderWidth: 5,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => DetailPage(),
                        ));
                      },
                    ),
                    CustomButtonWidget(
                      child: Icon(
                        Icons.menu,
                        color: AppColors.styleColor,
                      ),
                      size: 50,
                      onTap: () {},
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: _list.length,
                    padding: EdgeInsets.all(12),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => DetailPage(),
                          ))
                        },
                        child: AnimatedContainer(
                          duration: Duration(microseconds: 500),
                          decoration: BoxDecoration(
                            color: _list[index].id == _playId
                                ? AppColors.activeColor
                                : AppColors.mainColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    _list[index].title,
                                    style: TextStyle(
                                        color: AppColors.styleColor,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    _list[index].album,
                                    style: TextStyle(
                                        color:
                                            AppColors.styleColor.withAlpha(90),
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              CustomButtonWidget(
                                child: Icon(
                                  _list[index].id == _playId
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: _list[index].id == _playId
                                      ? Colors.white
                                      : AppColors.styleColor,
                                ),
                                size: 50,
                                onTap: () {
                                  setState(() {
                                    _playId = _list[index].id;
                                  });
                                },
                                isActive: _list[index].id == _playId,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.mainColor.withAlpha(0),
                      AppColors.mainColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
