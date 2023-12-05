import 'package:flutter/material.dart';
import 'items_view.dart';
import 'data.dart';
import 'item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _sum = 0;
  String appBarText="Restaurant Menu";
  bool _selected=false;

  void updateSum(double newSum) {
    setState(() {
      _sum += newSum;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      screenWidth *= 0.8;
    }

    List<Item> checked=[];
    for(var e in sandwiches){
      if(e.selected==true){
        checked.add(e);
      }
    }
    for(var e in plates){
      if(e.selected==true){
        checked.add(e);
      }
    }
    for(var e in drinks){
      if(e.selected==true){
        checked.add(e);
      }
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Total Price: \$${_sum.toString()}"),
          actions: [
            IconButton(
              onPressed: (){
                setState(() {
                  _selected=!_selected;
                });
              },
              icon: const Icon(Icons.shopping_cart_checkout),
            ),
            IconButton(
              onPressed: (){
                setState(() {
                  for(var e in sandwiches){
                    if(e.selected){
                      e.selected=false;
                    }
                  }
                  for(var e in plates){
                    if(e.selected){
                      e.selected=false;
                    }
                  }
                  for(var e in drinks){
                    if(e.selected){
                      e.selected=false;
                    }
                  }
                  _selected=false;
                  _sum=0;
                });
              },
              icon: const Icon(Icons.restore)
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.lunch_dining)),
              Tab(icon: Icon(Icons.dinner_dining)),
              Tab(icon: Icon(Icons.liquor)),
            ],
          ),
        ),
        body: _selected? Show(l: checked, width: screenWidth, updateSum: updateSum): TabBarView(
          children: [
            ShowSelectedItems(
              l: sandwiches,
              width: screenWidth,
              updateSum: updateSum,
            ),
            ShowSelectedItems(
              l: plates,
              width: screenWidth,
              updateSum: updateSum,
            ),
            ShowSelectedItems(
              l: drinks,
              width: screenWidth,
              updateSum: updateSum,
            ),
          ],
        ),
      ),
    );
  }
}

class Show extends StatefulWidget {
  List<dynamic> l;
  double width;
  final void Function(double) updateSum;

  Show({super.key,required this.l,required this.width,required this.updateSum});

  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> {
  @override
  Widget build(BuildContext context) {
    List<Item> checked=[];
    for(int i=0;i<sandwiches.length;i++){
      checked.add(sandwiches[i]);
    }
    for(int i=0;i<plates.length;i++){
      checked.add(plates[i]);
    }
    for(int i=0;i<drinks.length;i++){
      checked.add(drinks[i]);
    }
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
