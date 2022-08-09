import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/newsapp/cubit.dart';
import 'package:untitled/layout/newsapp/search_screen.dart';
import 'package:untitled/layout/newsapp/states.dart';
import 'package:untitled/layout/shared/Network/remote/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:untitled/layout/shared/components/components.dart';
class news_layout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>newscubit()..getbuisness(),

      child: BlocConsumer<newscubit,newsStates>(
        listener: (context,state){},
        builder: (BuildContext context,newsStates state) {
          if(state is newsgetbuissnessloadingState)
            {
              var cubit = newscubit.get(context);

              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepOrange,
                  ),

                ),
                bottomNavigationBar:
                BottomNavigationBar(
                  currentIndex: cubit.curentindex,
                  items: cubit.bottomitems,
                  onTap: (index) {
                    cubit.changebottomnavbar(index);
                  },
                ),

              );
            }
          else  {
            var cubit = newscubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  cubit.titles[cubit.curentindex],

                ),

actions: [
 IconButton(onPressed: (){

navigateto(context, searchscreen(),);

 }, icon: Icon(
   Icons.search,
 )),

  IconButton(onPressed: (){
newscubit.get(context).changeappmode();
  }, icon: Icon(
    Icons.brightness_4_outlined,
  ))

],

              ),
              bottomNavigationBar:
              BottomNavigationBar(
                currentIndex: cubit.curentindex,
                items: cubit.bottomitems,
                onTap: (index) {
                  cubit.changebottomnavbar(index);
                },
              ),
              body: cubit.screens[cubit.curentindex],


            );
          }
        }

      )
    );
  }
}
