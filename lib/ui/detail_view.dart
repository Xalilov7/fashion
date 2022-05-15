import 'package:fashion/modul/fashion.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {
  final int fashionId;
  const DetailsView({Key? key, required this.fashionId}) : super(key: key);

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    final List<Fashion> fashion = Fashion.fashionList;

    return Scaffold(
     body: Stack(
       children: [
        Hero(tag: Fashion.fashionList[widget.fashionId].url, child:          Image.asset(Fashion.fashionList[widget.fashionId].url, fit: BoxFit.cover, height: double.infinity, alignment: Alignment.center,),
        ),
         Positioned(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.15)
            ),
          ),
         ), 
         Positioned(top: 40, left: 20,  child: IconButton(onPressed: ()=> Navigator.pop(context), icon: Icon(Icons.arrow_back), color: Colors.white,)),
         Positioned(top: 40, right: 20,  child: IconButton(onPressed: () => print('bosildi'), icon: Icon(Icons.local_fire_department), color: Colors.white,)),
         Positioned(
            top: 150,
             left: 30,
             child: Column(
            children: [
             Icon(Icons.chat, color: Colors.white,),
             Text("12", style: TextStyle(fontSize: 16, color: Colors.white),)
           ],
         )),
         Positioned(
             top: 200,
             left: 30,
             child: Column(
               children: [
                 Icon(Icons.favorite_border, color: Colors.white,),
                 Text("637", style: TextStyle(fontSize: 16, color: Colors.white),)
               ],
             )),
         Positioned(
             top: 250,
             left: 30,
             child: Column(
               children: [
                 Icon(Icons.share, color: Colors.white,),
                 Text("120", style: TextStyle(fontSize: 16, color: Colors.white),)
               ],
             )),
         Positioned(
             bottom: 40,
             right: 30,
             left: 30,
             child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.5),
              borderRadius: BorderRadius.circular(10.0),
            ),
               child: Padding(
                 padding: EdgeInsets.all(10.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(Fashion.fashionList[widget.fashionId].name, style: TextStyle(color: Colors.white, fontSize: 16.0),),
                     Text(Fashion.fashionList[widget.fashionId].description, textAlign: TextAlign.justify,  style: TextStyle( color: Colors.white, fontSize: 16.0, height: 1.5),),
                   ],
                 ),
               ),
             ))
       ],
     ),
    );
  }
}
