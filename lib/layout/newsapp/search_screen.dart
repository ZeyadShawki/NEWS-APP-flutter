import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/newsapp/cubit.dart';
import 'package:untitled/layout/newsapp/states.dart';
import 'package:untitled/layout/shared/components/components.dart';


class searchscreen extends StatelessWidget {
  var searchcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {


    return BlocConsumer<newscubit,newsStates>(

      listener:(context,state){},
      builder: (context,state){
      var list=newscubit.get(context).search;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News Search',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: searchcontroller,


                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),

                  ),
                  onChanged: (text) {

newscubit.get(context).searchresult(text);
print(text);
                  },

                  validator: (String ? value){
                    if(value!.isEmpty)
                      return 'search should not be empty';
                    return null;
                  },
                ),

Expanded(child: buildarticleitem(list,context)),



              ],
            ),


          ),
            

        );
      },
    );
  }
}
