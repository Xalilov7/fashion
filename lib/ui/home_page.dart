import 'package:fashion/modul/fashion.dart';
import 'package:flutter/material.dart';

import 'detail_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Fashion> fashionList = Fashion.fashionList;
  bool toggleIsFavorite(bool isFavorite) {
    return !isFavorite;
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text("Fashion Week",
             style: TextStyle(color: Color(0xffAA78E9),
               fontSize: 30.0, fontWeight: FontWeight.bold),
           ),
          SizedBox(height: 8.0),
          Text("2022 Fashion Show"),
          SizedBox(height: 12),
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Explore", style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30.0
              ),),
              Image.asset("assets/option.png", height: 30.0,),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recommended", style: TextStyle(
                color: Color(0xffAA78E9),
                fontWeight: FontWeight.bold
              )),
              Text("New Models"),
              Text("2022 Shows")
            ],
          ),
          SizedBox(height: 32),
          Expanded(
           child: ListView.builder(
             physics: BouncingScrollPhysics(),
               itemCount: fashionList.length,
               itemBuilder: (context, index){
                 return InkWell(
                   onTap: (){
                     Navigator.of(context).push(
                       MaterialPageRoute(builder: (context) => DetailsView(fashionId: index))
                     );
                   },
                   child: Hero(
                     tag: fashionList[index].id,
                     child: Container(
                       margin:  EdgeInsets.only(bottom: 12.0),
                       child:  Stack(
                         children: [
                           ClipRRect(
                             borderRadius: BorderRadius.circular(12.0),
                             child: Image.asset(fashionList[index].url),
                           ),
                           Positioned(bottom: 40, left: 0 ,    child: Text(fashionList[index].name, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w200, color: Colors.white),),),
                           Positioned(bottom: 20, left: 10 ,    child: Text(fashionList[index].location, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),),),
                           Positioned( bottom: 20,  right: 10 ,    child: IconButton(
                             onPressed: (){
                               setState(() {
                                 bool isFavorite = toggleIsFavorite(fashionList[index].isFavorite);
                                 fashionList[index].isFavorite= isFavorite;
                               });
                             },
                             icon: fashionList[index].isFavorite == true ?    Icon(Icons.favorite_border, color: Colors.white,): Icon(Icons.favorite, color: Colors.white,) ))
                         ],

                       ),

                     ),
                   ),
                 );
               } ),
          )
        ],
      ),
    );
  }
}
