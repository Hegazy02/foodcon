import 'package:flutter/material.dart';
import 'package:foodcon/Pages/MainPages/homePage/stepperPage.dart';
import 'package:foodcon/Pages/MainPages/searchPage.dart';
import 'package:foodcon/Providers/filteredList.dart';
import 'package:foodcon/Services/Lists/Lists.dart';
import 'package:foodcon/constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomePage2 extends StatelessWidget {
  HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 4.h,
          ),
          Consumer<FilterProv>(
            builder: (context, value, child) => IconButton(
                onPressed: () => value.changeSwitch(),
                icon: Icon(Icons.change_circle)),
          ),
          TabBar(indicatorColor: KprimaryColor, tabs: [
            Tab(
              child: Text(
                "My orders",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Tab(
              child: Text(
                "Received orders",
                style: TextStyle(color: Colors.black),
              ),
            )
          ]),
          Expanded(
            child: TabBarView(children: [
              GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 7 / 9),
                itemBuilder: (context, index) => Column(
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: KprimaryColor, width: 1)),
                          child: Container(
                            height: 21.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.grey, width: 1)),
                            child: Column(
                              children: [
                                Spacer(
                                  flex: 3,
                                ),
                                Container(
                                  height: 110,
                                  width: 110,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      autoList[index]['image'],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                // Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("Price : 70",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text("Amount : 3",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                        // Container(
                        //   height: 30,
                        //   decoration: BoxDecoration(
                        //       color: Colors.red,
                        //       borderRadius: BorderRadius.only(
                        //         topLeft: Radius.circular(20),
                        //         topRight: Radius.circular(20),
                        //       )),
                        // ),
                        Text(
                          autoList[index]['title'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed(StepperPage().id),
                        child: Text("Track"))
                  ],
                ),
              ),
              ListView(
                children: [
                  ListTile(title: Text("data")),
                  ListTile(title: Text("data")),
                  ListTile(title: Text("data")),
                  ListTile(title: Text("data")),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
