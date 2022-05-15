import 'package:fashion/modul/fashion.dart';
import 'package:flutter/material.dart';

import 'detail_view.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
 final List<Fashion> mainFashionList = Fashion.fashionList;
 final List<Fashion> fashionList = mainFashionList.where((element) => element.isFavorite == true).toList();


 bool toggleIsFavorite(bool isFavorite) {
   return !isFavorite;
 }

    return Container(
      child: fashionList.length == 0 ? Center(child: Text("You have no Favorite")): ListView.builder(
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
          } ) ,
    );
  }
}
