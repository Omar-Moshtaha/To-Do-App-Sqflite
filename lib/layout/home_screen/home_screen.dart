import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:to_do/shared/components/components.dart';
import 'package:to_do/shared/cubit/cubit.dart';
import 'package:to_do/shared/cubit/status.dart';
class Home_Screen extends StatelessWidget {
  var email = TextEditingController();
  var time = TextEditingController();
  var date = TextEditingController();
  var form = GlobalKey<FormState>();

  var show_bottom = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..creatDd(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {
if (state is InsertToDb){
AppCubit.get(context).color=null as int;
}
if (state is UpdateElementData){
  AppCubit.get(context).color=null as int;
}
        },
         builder: (context, state) {
           return Scaffold(
             key: show_bottom,
             appBar: AppBar(
               title: Text( AppCubit.get(context).Title[ AppCubit.get(context).index]),
             ),
             body:ConditionalBuilders(context),
             floatingActionButton: FloatingActionButton(
               onPressed: () {
                 if (AppCubit.get(context).show) {
                   show_bottom.currentState!.showBottomSheet((context) => Form(
                     key: form,
                     child: Container(
                       width: double.infinity,
                       decoration: BoxDecoration(
                         color: Colors.grey[100],
                         borderRadius: BorderRadiusDirectional.only(
                             topStart: Radius.circular(30),
                             topEnd: Radius.circular(30)),
                       ),
                       child: Padding(
                         padding: const EdgeInsets.all(20.0),
                         child: SingleChildScrollView(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               bulid_textFormField(
                                 icons: Icons.title,
                                 type: TextInputType.name,
                                 text: "Task Title",
                                 email: email,
                               ),
                               SizedBox(
                                 height: 10,
                               ),
                               bulid_textFromFieldTime(

                                 text: ' Task Time',
                                 icons: Icons.watch_later_outlined,
                                 email: time,
                                 type: TextInputType.datetime,
                                 fun: () {
                                   showTimePicker(
                                       context: context,
                                       initialTime: TimeOfDay.now())
                                       .then((value) {
                                     time.text = value!.format(context);
                                   });
                                 },
                               ),
                               SizedBox(
                                 height: 10,
                               ),
                               bulid_textFromFieldDate(
                                 text: ' Task Date',
                                 icons: Icons.calendar_today,
                                 email: date,
                                 fun: () {
                                   showDatePicker(
                                       context: context,
                                       initialDate: DateTime.now(),
                                       firstDate: DateTime.now(),
                                       lastDate:
                                       DateTime.parse("2022-10-12"))
                                       .then((value) {
                                     date.text =
                                         DateFormat.yMMMd().format(value!);
                                   });
                                 },
                               ),
                               SizedBox(height: 10,),
                               Padding(
                                 padding: const EdgeInsets.only(left: 5),
                                 child: Text("color :",style: TextStyle(color: Colors.grey,),),
                               ) ,
                               SizedBox(height: 5,),
                               Padding(
                                 padding: const EdgeInsets.only(left: 5),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [

                                     GestureDetector(
                                       onTap: () {
AppCubit.get(context).colors(0xFF42A5F5);

                                       },
                                       child:   Container(
                                         height: 35,
                                         width: 35,
                                         decoration: BoxDecoration(

                                           color:Color(0xFF42A5F5),

                                           borderRadius: BorderRadius.circular(50),
                                         ),
                                       ),
                                     ),
                                     SizedBox(width: 5,),
                                     GestureDetector(
                                       onTap: () {
                                         AppCubit.get(context).colors(3426920849);


                                       },
                                       child:   Container(
                                         height: 35,
                                         width: 35,
                                         decoration: BoxDecoration(

                                           color:Color(3426920849),

                                           borderRadius: BorderRadius.circular(50),
                                         ),
                                       ),
                                     ),
                                     SizedBox(width: 5,),
                                     GestureDetector(
                                       onTap: () {
                                         AppCubit.get(context).colors(4294951175);

                                       },
                                       child:   Container(
                                         height: 35,
                                         width: 35,
                                         decoration: BoxDecoration(

                                           color:Color(4294951175),

                                           borderRadius: BorderRadius.circular(50),
                                         ),
                                       ),
                                     ),

                                     SizedBox(width: 5,),
                                     GestureDetector(
                                       onTap: () {
                                         AppCubit.get(context).colors(0xffb51248);

                                       },
                                       child:   Container(
                                         height: 35,
                                         width: 35,
                                         decoration: BoxDecoration(

                                           color:Color(0xffb51248),

                                           borderRadius: BorderRadius.circular(50),
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ),
                     ),
                   ))
                       .closed
                       .then((value) {
                         AppCubit.get(context).changesStatusOfObscuredOfTextForm(Icons.edit, true);
                   });

                   AppCubit.get(context).changesStatusOfObscuredOfTextForm(Icons.add, false);

                 } else {
                   if (form.currentState!.validate() && AppCubit.get(context).color!=null) {
                     AppCubit.get(context).insertToDd(title: email.text, time: time.text, date: date.text, color: AppCubit.get(context).color,value: 0);
                     Navigator.pop(context);

                   } else {
                     show_bottom.currentState!.showBottomSheet((context) => Form(
                       key: form,
                       child: Container(
                         width: double.infinity,
                         decoration: BoxDecoration(
                           color: Colors.grey[100],
                           borderRadius: BorderRadiusDirectional.only(
                               topStart: Radius.circular(30),
                               topEnd: Radius.circular(30)),
                         ),
                         child: Padding(
                           padding: const EdgeInsets.all(20.0),
                           child: SingleChildScrollView(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisSize: MainAxisSize.min,
                               children: [
                                 bulid_textFormField(
                                   icons: Icons.title,
                                   type: TextInputType.name,
                                   text: "Task Title",
                                   email: email,
                                 ),
                                 SizedBox(
                                   height: 10,
                                 ),
                                 bulid_textFromFieldTime(

                                   text: ' Task Time',
                                   icons: Icons.watch_later_outlined,
                                   email: time,
                                   type: TextInputType.datetime,
                                   fun: () {
                                     showTimePicker(
                                         context: context,
                                         initialTime: TimeOfDay.now())
                                         .then((value) {
                                       time.text = value!.format(context);
                                     });
                                   },
                                 ),
                                 SizedBox(
                                   height: 10,
                                 ),
                                 bulid_textFromFieldDate(
                                   text: ' Task Date',
                                   icons: Icons.calendar_today,
                                   email: date,
                                   fun: () {
                                     showDatePicker(
                                         context: context,
                                         initialDate: DateTime.now(),
                                         firstDate: DateTime.now(),
                                         lastDate:
                                         DateTime.parse("2022-10-12"))
                                         .then((value) {
                                       date.text =
                                           DateFormat.yMMMd().format(value!);
                                     });
                                   },
                                 ),
                                 SizedBox(height: 10,),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 5),
                                   child: Text("color :",style: TextStyle(color: Colors.grey,),),
                                 ) ,
                                 SizedBox(height: 5,),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 5),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [

                                       GestureDetector(
                                         onTap: () {
                                           AppCubit.get(context).colors(0xFF42A5F5);


                                         },
                                         child:   Container(
                                           height: 35,
                                           width: 35,
                                           decoration: BoxDecoration(

                                             color:Color(0xFF42A5F5),

                                             borderRadius: BorderRadius.circular(50),
                                           ),
                                         ),
                                       ),
                                       SizedBox(width: 5,),
                                       GestureDetector(
                                         onTap: () {
                                           AppCubit.get(context).colors(3426920849);


                                         },
                                         child:   Container(
                                           height: 35,
                                           width: 35,
                                           decoration: BoxDecoration(

                                             color:Color(3426920849),

                                             borderRadius: BorderRadius.circular(50),
                                           ),
                                         ),
                                       ),
                                       SizedBox(width: 5,),
                                       GestureDetector(
                                         onTap: () {
                                           AppCubit.get(context).colors(4294951175);

                                           // setState(() {
                                           //   color=4294951175 ;
                                           // });
                                         },
                                         child:   Container(
                                           height: 35,
                                           width: 35,
                                           decoration: BoxDecoration(

                                             color:Color(4294951175),

                                             borderRadius: BorderRadius.circular(50),
                                           ),
                                         ),
                                       ),
                                       SizedBox(width: 5,),
                                       GestureDetector(
                                         onTap: () {
                                           AppCubit.get(context).colors(0xffb51248);


                                         },
                                         child:   Container(
                                           height: 35,
                                           width: 35,
                                           decoration: BoxDecoration(

                                             color:Color(0xffb51248),

                                             borderRadius: BorderRadius.circular(50),
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),



                               ],
                             ),
                           ),
                         ),
                       ),
                     )).closed
                         .then((value) {

                       AppCubit.get(context).changesStatusOfObscuredOfTextForm(Icons.edit, true);

                     });
                   }
                 }
               },
               child: Icon( AppCubit.get(context).icon),
               heroTag: "Add",
             ),

             bottomNavigationBar:  BottomNavigationBar(
               currentIndex:  AppCubit.get(context).index,
               onTap: (value) {
                 AppCubit.get(context).changeIndexOfBottomNavigation(value);
               },
               items: [
                 BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Tasks"),
                 BottomNavigationBarItem(
                     icon: Icon(Icons.check_circle_outline), label: "Done"),
                 BottomNavigationBarItem(
                     icon: Icon(Icons.archive_outlined), label: "Archived"),
               ],
             ),

           );
         },
      ),
    );

  }



}
