 import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do/modules/archive_tasks/archive_tasks.dart';
import 'package:to_do/modules/done_tasks/done_tasks.dart';
import 'package:to_do/modules/new_tasks/new_tasks.dart';
import 'package:to_do/shared/components/constant.dart';
import 'package:to_do/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(InitialState());
 static AppCubit get(context)=>BlocProvider.of(context);
  var index = 0;
  late Database db;
  List<Map> New_task =[];
  List<Map> Done_task =[];
  List<Map> Archive_task =[];

  List<Widget> Screen = [
    New_Tasks(),
    Done_Tasks(),
    Archive_Tasks(),
  ];
  List<String> Title = [
    "New Tasks",
    "Done Tasks",
    "Archive Tasks",
  ];
  IconData icon = Icons.edit;
  bool show = true;
  void changes(IconData icons,bool shows ){
    icon=icons;
    show=shows;
    emit(change());
  }
  late int color;

  void colors(int value ){
    color=value;
    emit(change_value());
  }
  void change_index(int value){
    index=value;
    emit(BottomNavigationBars());
  }
  void creat() async {
     openDatabase(
      'qwq.db',
      version: 5,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE Tasq (id INTEGER PRIMARY KEY, title TEXT,time TEXT , date TEXT ,statue TEXT,color INTEGER,value INTEGER)')
            .then((value) {
          print("table creat");
        }).catchError((error) {
          print("error is ${error.toString()}");
        });
        print("data base creat");
      },
      onOpen: (db) {
        print("data base open");
        get_db(db,0);
        getDone(db, 1);
        getArchived(db, 2);
      },
    ).then((value){
      db=value;
      emit(CreatDb());
     });
  }
   insert({
    required String title,
    required String time,
    required String date,
    required int color,
     required int value,

   }) async =>
      db.transaction((txn) async{
        await txn
            .rawInsert(
            'INSERT INTO Tasq(title, time, date,statue,color,value) VALUES("$title", "$time", "$date","New","$color","$value")')

            .then((value) {

          print("$value insert succfelod");
          emit(InsertDb());

          get_db(db,0);


        }).catchError((error) {
          print("Error");
        });
      });

  void get_db(db,int value)  {

    emit(Load());
      db.rawQuery('SELECT * FROM Tasq WHERE value =?',[value]).then((value) {
        Newtask = value;

    emit(GetDb());
      });
  }
  void getDone(db,int value)  {

    emit(Load());
    db.rawQuery('SELECT * FROM Tasq WHERE value =?',[value]).then((value) {
      Donetask = value;

      emit(GetDb());
    });
  }
  void getArchived(db,int value)  {
    emit(Load());
    db.rawQuery('SELECT * FROM Tasq WHERE value =?',[value]).then((value) {
      Archivetask = value;

      emit(GetDb());
    });
  }

  void updates( String states,int value,int id){
     db.rawUpdate(
        'UPDATE Tasq SET  statue= ?, value=?  WHERE id = ?',
        ['$states',value, id]).then((value){
       get_db(db,0);
       getDone(db, 1);
       getArchived(db, 2);
          emit(update());
     });

  }
  void updatData( String title, String time ,String date,int color,int id){
    db.rawUpdate(
        'UPDATE Tasq SET  title= ?, time= ?, date= ?,color=?  WHERE id = ?',
        ['$title', '$time','$date',color,id]).then((value){
      get_db(db,0);
      emit(UpdatData());
    });

  }

  void delete( int id){
    db.rawDelete(
        'DELETE FROM Tasq WHERE id = ?', [id]).then((value) {
      get_db(db,0);
      getDone(db, 1);
      getArchived(db, 2);
      emit(Delete());
    }) ;

  }
}