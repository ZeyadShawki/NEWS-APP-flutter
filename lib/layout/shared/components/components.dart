

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/layout/shared/webview_screen.dart';



Widget buildtaskitems() => Padding(
  padding: const EdgeInsets.all(10.0),
  child: Row(

    children: [
      CircleAvatar(
        radius: 40,
        child: Text(
          '02:00 pm',
        ),
      ),
      SizedBox(width: 15,),
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Task',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15,),
          Text(
            'date:12-5-2022',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      )
    ],
  ),

);

Widget buildarticleitem(article,context) =>Padding(
  padding: const EdgeInsets.all(15.0),
  child: InkWell(
    onTap: (){
      navigateto(context, webviewnews(article['url']),);
    },
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  '${article['urlToImage']}',

                ),
                fit: BoxFit.cover,
              )
          ),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Container(

            height: 120,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,

                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(

                    fontSize: 15,

                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  ),
);

void navigateto(context,Widget)=>Navigator.push(context, MaterialPageRoute(builder: (context) =>Widget, ) );


void navigateandfinish(context,Widget)=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>Widget, ),
  (Route<dynamic> route)=> false,
);

void toast({
  required String massege,
required toaststates state,
})=> Fluttertoast.showToast(
    msg: massege,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: choosetoaststates(state),
    textColor: Colors.white,
    fontSize: 16.0
);
enum toaststates {grey,succes,error,warning}

 Color  choosetoaststates(toaststates state)
{
  Color color=  Colors.red;
  switch(state)
{
  case toaststates.grey:color=Colors.grey;
  break;
    case toaststates.succes:color=Colors.green;
    break;
    case toaststates.warning:color=Colors.yellow;
    break;
    case toaststates.error:Colors.red;
    break;
}

return color;
}