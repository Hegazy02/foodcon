import 'package:flutter/material.dart';
import 'package:foodcon/Providers/filteredList.dart';
import 'package:foodcon/constants.dart';
import 'package:provider/provider.dart';
import 'package:foodcon/Services/Lists/Lists.dart';

class SearchPage extends StatelessWidget {
  List? filteredList = [];
  final double height;
  final double width;
  List? autoList;
  String? searchVal;
  SearchPage(
      {this.autoList,
      required this.height,
      required this.width,
      this.searchVal});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: height * 0.04,
        ),
        Row(
          children: [
            Expanded(
              child: Consumer<FilterProv>(
                builder: (context, valprov, child) {
                  return TextField(
                    onChanged: (value) {
                      searchVal = value;

                      valprov.fil2 = autoList?.where((element) {
                        return element['title']
                            .toString()
                            .startsWith(searchVal.toString());
                      }).toList();
                      valprov.fil2 = searchVal!.isEmpty ? [] : valprov.fil2;
                      print("********${valprov.fil2}");
                    },
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        // enabledBorder: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(30),
                        //     borderSide:
                        //         BorderSide(width: 1, color: Colors.grey)),
                        // focusedBorder: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(30),
                        //     borderSide:
                        //         BorderSide(width: 1, color: Colors.grey)),
                        hintText: "Search",
                        prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ))),
                  );
                },
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt_sharp))
            // CircleAvatar(
            //   backgroundImage: AssetImage(Klogo),
            //   backgroundColor: Colors.white,
            // )
          ],
        ),
        Selector<FilterProv, List>(
          selector: (context, aa) => aa.fil2,
          builder: (context, value, child) {
            List? l = value.isEmpty ? autoList : value;
            return Expanded(
              child: ListView.builder(
                itemCount: l!.length,
                itemBuilder: (context, index) {
                  print(l);
                  return CustomTile(
                    title: l[index]['title'],
                    image: l[index]['image'],
                    category: l[index]['category'],
                    chefAvatar: l[index]['chefAvatar'],
                    chefName: l[index]['chefName'],
                    star: l[index]['star'],
                    isLiked: l[index]['isLiked'],
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}

class CustomTile extends StatelessWidget {
  String title;
  String? image;
  String category;
  String? chefName;
  String? chefAvatar;
  String? star;
  bool? isLiked;

  CustomTile(
      {required this.title,
      this.image,
      required this.category,
      this.chefAvatar,
      this.chefName,
      this.star,
      this.isLiked});

  @override
  Widget build(BuildContext context) {
    Map item =
        categoriesList.firstWhere((element) => element['category'] == category);

    return ListTile(
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            image != "" ? image! : Klogo,
            fit: BoxFit.fill,
          )),
      title: Text(
        "| ${item['category']}",
        style: TextStyle(fontSize: 11, color: item['color']),
      ),
      subtitle:
          Text(title, style: TextStyle(fontSize: 16, color: Colors.black)),
      trailing: SizedBox(
        width: 60,
        child: Row(
          children: [
            // Container(
            //   height: 30,
            //   width: 30,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     image: DecorationImage(
            //         image: AssetImage(
            //       chefAvatar != "" ? chefAvatar! : Klogo,
            //     )),
            //   ),
            // ),
            // Text(chefName!),
            Icon(isLiked == false ? Icons.star_border : Icons.star),
            Text("${star}")
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
