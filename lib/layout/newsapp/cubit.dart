import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/newsapp/buisness.dart';
import 'package:untitled/layout/newsapp/settengs.dart';
import 'package:untitled/layout/newsapp/siencescreen.dart';
import 'package:untitled/layout/newsapp/sportscreen.dart';
import 'package:untitled/layout/newsapp/states.dart';

import '../shared/Network/remote/dio_helper.dart';

class newscubit extends Cubit<newsStates>
{
  newscubit() : super(newsintialsates());
  static newscubit get(context )=>BlocProvider.of(context);
int curentindex=0;

List<String> titles=[
  'Business News',
  'Sports News',
  'Science News',
];


List<BottomNavigationBarItem> bottomitems=[
  BottomNavigationBarItem(icon:
  Icon(
    Icons.cases_rounded,
  ),
label: 'Buisness',

  ),
  BottomNavigationBarItem(icon:
  Icon(
    Icons.sports,
  ),
    label: 'Sports',

  ),
  BottomNavigationBarItem(icon:
  Icon(
    Icons.science,
  ),
    label: 'Science',

  ),
  BottomNavigationBarItem(icon:
  Icon(
    Icons.settings,
  ),
    label: 'Settings',

  ),
];
void changebottomnavbar (int index)
{
  curentindex=index;

      emit(newsbottomnav());
      if(index==0)
        getbuisness();
      if(index==1)
        getsport();
      if(index==2)
        getscience();
}

List<Widget> screens=[
  buisnessscreen(),
  sportsscreen(),
  sciencescreen(),
settingsscreen(),
];
List<dynamic> business=[];
  List<dynamic> sport=[];
  List<dynamic> science=[];

void getbuisness()
{
  emit(newsgetbuissnessloadingState());

  emit(newsgetbuissnessloadingState());
  Diohelper.getData(url: 'v2/top-headlines', query:
  {
    'country': 'eg',
    'category': 'business',
    'apiKey': '3c1d9932b7a045d2b801aabda9db58bb',
  },
  ).then((value) {
    business=(value.data['articles']);
    print(business[0]['title']);
    emit(businesssuccesstate());
  }).catchError((error){
    print(error.toString());
    emit(businesserrorstate(error.toString()));
  });


}

  void getsport()
  {
    emit(newsgetbuissnessloadingState());

    emit(newsgetbuissnessloadingState());
    Diohelper.getData(url: 'v2/top-headlines', query:
    {
      'country': 'eg',
      'category': 'sport',
      'apiKey': '3c1d9932b7a045d2b801aabda9db58bb',
    },
    ).then((value) {
      sport=(value.data['articles']);

      emit(sportsuccesstate());
    }).catchError((error){
      print(error.toString());
      emit(sportserrorstate(error.toString()));
    });


  }

  void getscience()
  {
    emit(newsgetbuissnessloadingState());

    emit(newsgetbuissnessloadingState());
    Diohelper.getData(url: 'v2/top-headlines', query:
    {
      'country': 'eg',
      'category': 'science',
      'apiKey': '3c1d9932b7a045d2b801aabda9db58bb',
    },
    ).then((value) {
      science=(value.data['articles']);

      emit(sciencessuccesstate());
    }).catchError((error){
      print(error.toString());
      emit(scienceserrorstate(error.toString()));
    });


  }
bool isdark=false;
void changeappmode()
  {
    isdark= !isdark;

    emit(darkmodestate());
}
List <dynamic> search=[];
void searchresult(String value)
  {


    emit(newsgetbuissnessloadingState());
    Diohelper.getData(url: 'v2/everything', query:
    {
      'q': '$value',

      'apiKey': '3c1d9932b7a045d2b801aabda9db58bb',
    },
    ).then((value) {
      search=(value.data['articles']);
print(search[0]['title']);

      emit(searchssuccesstate());
    }).catchError((error){
      print(error.toString());
      emit(searchserrorstate(error.toString()));
    });

  }


}