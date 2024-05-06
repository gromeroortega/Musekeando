import 'package:flutter/material.dart';

class ListPlayList extends StatelessWidget {
  const ListPlayList({
    Key? key,
    required this.size,
  }) : super(key: key);
  final MediaQueryData size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.0,
        top: size.size.height / 2.8,
        right: 15.0,
        bottom: size.padding.bottom + size.size.height * 0.45,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(48),
            child: const Image(
              width: 150,
              height: 150,
              image: NetworkImage(
                  'https://crazyminds.es/wp-content/uploads/SYSTEM-OF-A-DOWN-2020.jpg'),
            ),
          );
        },
      ),
    );
  }
}
