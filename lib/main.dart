import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled/layout/modules/bmi/bmi_calc.dart';

import 'package:untitled/layout/modules/counter/cubit/counter.dart';


import 'package:untitled/layout/modules/users/user_screen.dart';
import 'package:untitled/layout/newsapp/cubit.dart';
import 'package:untitled/layout/newsapp/news_layout.dart';
import 'package:untitled/layout/newsapp/states.dart';
import 'package:untitled/layout/shared/Network/remote/dio_helper.dart';
import 'package:untitled/layout/shared/styles/styles.dart';

import 'layout/modules/login_screen/login_screen.dart';

import 'layout/shared/bloc_observer.dart';
import 'package:dio/dio.dart';


void   main() {
   BlocOverrides.runZoned(
        () async{

          WidgetsFlutterBinding.ensureInitialized();
          dioHelper1.init();
         await cachehelper.init();
bool onboarding=cachehelper.getdata(key: 'onboarding');
cachehelper.token=cachehelper.getdata(key: 'token');
          Widget widget;

if(onboarding!=null)
  {
    if(cachehelper.token!=null)
      widget=shopplayout();
    else     widget=loginshopp();

  }
else widget=onboardingscreen();

          runApp(MyApp(
startwidget: widget,
          ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget
{
  late final bool onboarding;
late final Widget startwidget;
  MyApp({required this.startwidget});

  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context)=>newscubit(),),

    BlocProvider(
    create: (BuildContext context)=>homelayoutcubit()..gethomedata()..getcategoriesdata()..getfavoritedata()..getUSERdata(),
  ),

      ],


        child: BlocConsumer<newscubit,newsStates>
          (
         listener: (context,state){},
          builder: (context,state){
           print(state);
           return MaterialApp(
             debugShowCheckedModeBanner: false,
             theme: lighttheme,

             darkTheme: darktheme,

             themeMode: newscubit.get(context).isdark?ThemeMode.dark:ThemeMode.light,
             home:startwidget

           );
          },
        ),
      );

  }

}