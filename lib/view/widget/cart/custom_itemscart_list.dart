
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pizzaapp/core/constant/color.dart';
import 'package:pizzaapp/linkapp.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomItemsCartList({
    Key? key,
    required this.name,
    required this.price,
    required this.count,
    required this.imagename,
    required this.onAdd,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(children: [
          Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: "${AppLink.imagesItems}/$imagename",
                height: 80,
              )),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text(name, style: const TextStyle(fontSize: 15)),
                subtitle: Text(price,
                    style:
                        const TextStyle(color: AppColor.premierColor, fontSize: 17)),
              )),
          Expanded(
              child: Column(
            children: [
              Container(
                  height: 35,
                  child: IconButton(onPressed: onAdd, icon: const Icon(Icons.add))),
              Container(
                  height: 30,
                  child: Text(
                    count,
                    style: const TextStyle(fontFamily: "sans"),
                  )),
              Container(
                  height: 25,
                  child: IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)))
            ],
          ))
        ]),
      ),
    );
  }
}
