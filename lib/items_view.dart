import 'package:flutter/material.dart';
import 'item.dart';

class ShowSelectedItems extends StatefulWidget {
  double width;
  List<dynamic> l;
  final void Function(double) updateSum;

  ShowSelectedItems({super.key, required this.l, required this.width, required this.updateSum});

  @override
  State<ShowSelectedItems> createState() => _ShowSelectedItemsState();
}

class _ShowSelectedItemsState extends State<ShowSelectedItems> {

  void changeText(int index) {
    if (widget.l[index].selected == true) {
      widget.updateSum(widget.l[index].price);
    } else {
      widget.updateSum(-(widget.l[index].price));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.l.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: widget.l[index].selected,
                  onChanged: (bool? val) {
                    setState(() {
                      widget.l[index].selected = val as bool;
                      changeText(index);
                    });
                  },
                ),
                Text(
                  widget.l[index].toString(),
                  style: const TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ],
            ),
            Image.network(
              widget.l[index].image,
              height: widget.width * 0.5,
              width: widget.width * 0.7,
            ),
          ],
        );
      },
    );
  }
}
