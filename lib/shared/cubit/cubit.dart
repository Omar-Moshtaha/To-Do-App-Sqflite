<<<<<<< HEAD

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/modules/new_tasks/new_tasks.dart';
import 'package:project/shared/cubit/status.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/archive_tasks/archive_tasks.dart';
import '../../modules/done_tasks/done_tasks.dart';
import '../components/constant.dart';


class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(InitialState());
 static AppCubit get(context)=>BlocProvider.of(context);
  var index = 0;
  late Database db;
int ?indexColor;
List<Color>listOfColors=[
  Color(0xFF42A5F5),
  Color(3426920849),
  Color(4294951175),
  Color(0xffb51248),

  ];
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
  Future<void> changesStatusOfObscuredOfTextForm(IconData icons,bool shows ) async {
    icon=icons;
    show=shows;
    emit(ShowPasswordAndHide());
  }
   int color=0;

  void colors(int value ){
    color=value;
    emit(ChangeValueOfColor());
  }
  void changeIndexOfBottomNavigation(int value){
    index=value;
    emit(ChangeIndexOfBottomNavigation());
  }
  void creatDd() async {
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
        getListOfNewTask(db,0);
        getListOfDoneTask(db, 1);
        getListOfArchivedTask(db, 2);
      },
    ).then((value){
      db=value;
      emit(CreatDb());
     });
  }
   Future<void> insertToDd({
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
          emit(InsertToDb());

          getListOfNewTask(db,0);


        }).catchError((error) {
          print("Error");
        });
      });

  void getListOfNewTask(db,int value)  {

    emit(LoadData());
      db.rawQuery('SELECT * FROM Tasq WHERE value =?',[value]).then((value) {
        Newtask = value;

    emit(GetFormDb());
      });
  }
  void getListOfDoneTask(db,int value)  {

    emit(LoadData());
    db.rawQuery('SELECT * FROM Tasq WHERE value =?',[value]).then((value) {
      Donetask = value;

      emit(GetFormDb());
    });
  }
  void getListOfArchivedTask(db,int value)  {
    emit(LoadData());
    db.rawQuery('SELECT * FROM Tasq WHERE value =?',[value]).then((value) {
      Archivetask = value;

      emit(GetFormDb());
    });
  }

  void updatesDataForElement( String states,int value,int id){
     db.rawUpdate(
        'UPDATE Tasq SET  statue= ?, value=?  WHERE id = ?',
        ['$states',value, id]).then((value){
       getListOfNewTask(db,0);
       getListOfDoneTask(db, 1);
       getListOfArchivedTask(db, 2);
          emit(UpdateData());
     });

  }
  void updateDataOFElement( String title, String time ,String date,int color,int id){
    db.rawUpdate(
        'UPDATE Tasq SET  title= ?, time= ?, date= ?,color=?  WHERE id = ?',
        ['$title', '$time','$date',color,id]).then((value){
      getListOfNewTask(db,0);
      emit(UpdateElementData());
    });

  }

  void deleteElement( int id){
    db.rawDelete(
        'DELETE FROM Tasq WHERE id = ?', [id]).then((value) {
      getListOfNewTask(db,0);
      getListOfDoneTask(db, 1);
      getListOfArchivedTask(db, 2);
      emit(DeleteElement());
    }) ;

  }
=======

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do/modules/archive_tasks/archive_tasks.dart';
import 'package:to_do/modules/done_tasks/done_tasks.dart';
import 'package:to_do/modules/new_tasks/new_tasks.dart';
import 'package:to_do/shared/components/constant.dart';
import 'package:to_do/shared/cubit/status.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(InitialState());
 static AppCubit get(context)=>BlocProvider.of(context);
  var index = 0;
  late Database db;
int ?indexColor;
List<Color>listOfColors=[
  Color(0xFF42A5F5),
  Color(3426920849),
  Color(4294951175),
  Color(0xffb51248),

  ];
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
  Future<void> changesStatusOfObscuredOfTextForm(IconData icons,bool shows ) async {
    icon=icons;
    show=shows;
    emit(ShowPasswordAndHide());
  }
   int color=0;

  void colors(int value ){
    color=value;
    emit(ChangeValueOfColor());
  }
  void changeIndexOfBottomNavigation(int value){
    index=value;
    emit(ChangeIndexOfBottomNavigation());
  }
  void creatDd() async {
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
        getListOfNewTask(db,0);
        getListOfDoneTask(db, 1);
        getListOfArchivedTask(db, 2);
      },
    ).then((value){
      db=value;
      emit(CreatDb());
     });
  }
   Future<void> insertToDd({
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
          emit(InsertToDb());

          getListOfNewTask(db,0);


        }).catchError((error) {
          print("Error");
        });
      });

  void getListOfNewTask(db,int value)  {

    emit(LoadData());
      db.rawQuery('SELECT * FROM Tasq WHERE value =?',[value]).then((value) {
        Newtask = value;

    emit(GetFormDb());
      });
  }
  void getListOfDoneTask(db,int value)  {

    emit(LoadData());
    db.rawQuery('SELECT * FROM Tasq WHERE value =?',[value]).then((value) {
      Donetask = value;

      emit(GetFormDb());
    });
  }
  void getListOfArchivedTask(db,int value)  {
    emit(LoadData());
    db.rawQuery('SELECT * FROM Tasq WHERE value =?',[value]).then((value) {
      Archivetask = value;

      emit(GetFormDb());
    });
  }

  void updatesDataForElement( String states,int value,int id){
     db.rawUpdate(
        'UPDATE Tasq SET  statue= ?, value=?  WHERE id = ?',
        ['$states',value, id]).then((value){
       getListOfNewTask(db,0);
       getListOfDoneTask(db, 1);
       getListOfArchivedTask(db, 2);
          emit(UpdateData());
     });

  }
  void updateDataOFElement( String title, String time ,String date,int color,int id){
    db.rawUpdate(
        'UPDATE Tasq SET  title= ?, time= ?, date= ?,color=?  WHERE id = ?',
        ['$title', '$time','$date',color,id]).then((value){
      getListOfNewTask(db,0);
      emit(UpdateElementData());
    });

  }

  void deleteElement( int id){
    db.rawDelete(
        'DELETE FROM Tasq WHERE id = ?', [id]).then((value) {
      getListOfNewTask(db,0);
      getListOfDoneTask(db, 1);
      getListOfArchivedTask(db, 2);
      emit(DeleteElement());
    }) ;

  }
>>>>>>> e98c76c6bcc6f17dfa332d16edd4b8b240c21faa
}