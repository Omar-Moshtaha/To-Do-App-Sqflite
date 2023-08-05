<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../cubit/cubit.dart';
import '../cubit/status.dart';


Widget bulid_textFormField(
        {VoidCallback? fun,
        required TextEditingController email,
        TextInputType? type,
        required String text,
        required IconData icons}) =>
    TextFormField(
      onChanged: on_changed,
      validator: validator,
      controller: email,
      onTap: fun,
      keyboardType: type,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "$text",
        labelStyle: TextStyle(
          fontSize: 15.sp,
        ),
        prefixIcon: Icon(icons,size: 20.h,),
      ),
    );

Widget bulid_textFromFieldTime(
        {VoidCallback? fun,
        required TextEditingController email,
        TextInputType? type,
        required String text,
        required IconData icons}) =>
    TextFormField(
      onChanged: on_changed,
      validator: validator_time,
      controller: email,

      onTap: fun,
      keyboardType: type,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "$text",
        labelStyle: TextStyle(
          fontSize: 15.sp,
        ),
        prefixIcon: Icon(icons,size: 20.h,),
      ),
    );

Widget bulid_textFromFieldDate(
        {VoidCallback? fun,
        required TextEditingController email,
        TextInputType? type,
        required String text,
        required IconData icons}) =>
    TextFormField(
      enabled: true,
      onChanged: on_changed,
      validator: validator_Date,
      controller: email,
      onTap: fun,
      keyboardType: type,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "$text",
        labelStyle: TextStyle(
          fontSize: 15.sp,
        ),
        prefixIcon: Icon(icons,size: 20.h,),
      ),
    );

void on_changed(String value) {
  print(value);
}

String? validator(String? value) {
  if (value!.isEmpty) {
    return "title must not be empty";
  }
  return null;
}

String? validator_time(String? value) {
  if (value!.isEmpty) {
    return "Time must not be empty";
  }
  return null;
}

String? validator_Date(String? value) {
  if (value!.isEmpty) {
    return "Date must not be empty";
  }
  return null;
}

Widget bulid_New(item, context) => Dismissible(
      key: UniqueKey(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {

            var email = TextEditingController();
            var time = TextEditingController();
            var date = TextEditingController();
            time.text=item["time"];
            email.text=item["title"];
            date.text=item["date"];
AppCubit.get(context).color=item["color"];
            var form = GlobalKey<FormState>();
            final Alert = AlertDialog(

              content: Container(
                color: Colors.white,
height: 300.h,
                width: 500,
                child: Form(
                  key: form,
                   child: Container(
                     alignment: Alignment.center,
                     child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            height: 10.h,
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
                            height: 10.h,
                          ),
                          bulid_textFromFieldDate(
                            text: ' Task Date',
                            icons: Icons.calendar_today,
                            email: date,
                            fun: () {
                              showDatePicker(
                                      context: context,
                                  initialDate:DateTime(2030, 8, 1),
                                  firstDate: DateTime(2030, 8, 1),
                                  lastDate:DateTime(2030, 12, 31),
                              )
                                  .then((value) {
                                date.text = DateFormat.yMMMd().format(value!);
                              });
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 5.w),
                            child: Text(
                              "Choose Color :",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 5.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    AppCubit.get(context).colors(0xFF42A5F5);
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF42A5F5),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    AppCubit.get(context).colors(3426920849);
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: Color(3426920849),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    AppCubit.get(context).colors(4294951175);
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: Color(4294951175),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                     AppCubit.get(context).colors(0xffb51248);
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xffb51248),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width: double.infinity,
                            color: Colors.blue,
                            child: MaterialButton(
                              onPressed: () {
                                if (form.currentState!.validate() &&
                                    AppCubit.get(context).color !=0) {

                                  AppCubit.get(context).updateDataOFElement(
                                      email.text,
                                      time.text,
                                      date.text,
                                      AppCubit.get(context).color,
                                      item['id']);
                                  Navigator.pop(context);
                                }
                              },
                              child: Text(
                                "Update",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                  ),
                   ),
                ),
              ),
            );

            showDialog(
              context: context,

              builder: (context) => Alert,
            );
          },
          child: Container(
            height: 100.h,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.r)),
            child: Row(
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 10.w),
                  child: CircleAvatar(
                    radius: 40.h,
                    backgroundColor: Color(item["color"]),
                    child: Text("${item["time"]}",maxLines: 2,overflow: TextOverflow.ellipsis,  style: TextStyle(
                        fontSize: 13.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 86.w,
                      child: Text(
                        "${item["title"]}",
                        maxLines: 3,overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "${item["date"]}",
                      maxLines: 2,overflow: TextOverflow.ellipsis,

                      style: TextStyle(color: Colors.grey,fontSize: 12.sp),
                    ),
                  ],
                ),
           Spacer(),
                IconButton(
                    onPressed: () {
                      AppCubit.get(context).updatesDataForElement("Done", 1,item["id"]);
                    },
                    icon: Icon(
                      Icons.check_box,
                      size: 20.h,
                      color: Colors.green,
                    )),
                IconButton(
                    onPressed: () {
                      AppCubit.get(context).updatesDataForElement("Archive", 2,item["id"]);
                    },
                    icon: Icon(
                      Icons.archive,
                      size: 20.h,

                      color: Colors.black45,
                    ))
              ],
            ),
          ),
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteElement(
          item["id"],
        );
      },
    );

Widget bulid_Done(item, context) => Dismissible(
      key: UniqueKey(),
      child: Padding(
        padding:  EdgeInsets.all(10.0.h),
        child: Container(
          height: 100.h,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 10.w),
                child: CircleAvatar(
                  radius: 40.h,
                  backgroundColor: Color(item["color"]),
                  child: Text("${item["time"]}",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(
                      fontSize: 13.sp, fontWeight: FontWeight.w500
                  ),),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 86.w,
                    child: Text(
                      "${item["title"]}",
                      style:
                          TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold,)
                      ,
                      maxLines: 3,overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "${item["date"]}",
                    style: TextStyle(color: Colors.grey,fontSize: 12.sp),
                    maxLines: 2,overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
         Spacer(),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).updatesDataForElement("Done", 1,item["id"]);
                  },
                  icon: Icon(
                    Icons.check_box,
                    size: 20.h,
                    color: Colors.green,
                  )),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).updatesDataForElement("Archive",2, item["id"]);
                  },
                  icon: Icon(
                    Icons.archive,
                    size: 20.h,

                    color: Colors.black45,
                  ))
            ],
          ),
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteElement(
          item["id"],
        );
      },
    );

Widget bulid_Archive(item, context) => Dismissible(
      key: UniqueKey(),
      child: Padding(
        padding:  EdgeInsets.all(10.0.h),
        child: Container(
          height: 100.h,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  radius: 40.h,
                  backgroundColor: Color(item["color"]),
                  child: Text("${item["time"]}",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(
                      fontSize: 13.sp, fontWeight: FontWeight.w500,
                  ),),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width:86.w,
                    child: Text(
                      "${item["title"]}",
                      maxLines:3,overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 13.0.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "${item["date"]}",
                    maxLines: 2,overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey,fontSize: 12.sp),
                  ),
                ],
              ),
          Spacer(),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).updatesDataForElement("Done", 1,item["id"]);
                  },
                  icon: Icon(
                    Icons.check_box,
                    size: 20.h,
                    color: Colors.green,
                  )),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).updatesDataForElement("Archive", 2,item["id"]);
                  },
                  icon: Icon(
                    Icons.archive,
                    size: 20.h,

                    color: Colors.black45,
                  ))
            ],
          ),
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteElement(
          item["id"],
        );
      },
    );
Widget bulid_list_Done(List<Map>task){
if(task.length>0){

  return ListView.separated(
    physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => bulid_Done(task[index], context),
      separatorBuilder: (context, index) => Padding(
        padding:  EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
        child: Container(
          width: double.infinity,
          height: 1.h,
          color: Colors.grey[300],
        ),
      ),
      itemCount: task.length);
} else{
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.menu,size: 100.h,color: Colors.grey,),
        Text("No Tasks Yet, Please Add Some Tasks", style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold

        ),)
      ],),
  );
}
}
Widget bulid_list_New(List<Map>task){
  if(task.length>0){

    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => bulid_New(task[index], context),
        separatorBuilder: (context, index) => Padding(
          padding:  EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
          child: Container(
            width: double.infinity,
            height: 1.h,
            color: Colors.grey[300],
          ),
        ),
        itemCount: task.length);
  } else{
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.menu,size: 100.h,color: Colors.grey,),
          Text("No Tasks Yet, Please Add Some Tasks", style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold

          ),)
        ],),
    );
  }
}
Widget bulid_list_Archive(List<Map>task){
  if(task.length>0){
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => bulid_Archive(task[index], context),
        separatorBuilder: (context, index) => Padding(
          padding:  EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
          child: Container(
            width: double.infinity,
            height: 1.h,
            color: Colors.grey[300],
          ),
        ),
        itemCount: task.length);
  } else{
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.menu,size: 100.h,color: Colors.grey,),
          Text("No Tasks Yet, Please Add Some Tasks", style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold

          ),)
        ],),
    );
  }
}

Widget ConditionalBuilders(context){
  if(State is! LoadData){
  return  AppCubit.get(context).Screen[ AppCubit.get(context).index];
  }else{
    return  Center(child: CircularProgressIndicator());
  }

=======
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do/shared/cubit/cubit.dart';
import 'package:to_do/shared/cubit/status.dart';

Widget bulid_textFormField(
        {VoidCallback? fun,
        required TextEditingController email,
        TextInputType? type,
        required String text,
        required IconData icons}) =>
    TextFormField(
      onChanged: on_changed,
      validator: validator,
      controller: email,
      onTap: fun,
      keyboardType: type,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "$text",
        labelStyle: TextStyle(
          fontSize: 15.sp,
        ),
        prefixIcon: Icon(icons,size: 20.h,),
      ),
    );

Widget bulid_textFromFieldTime(
        {VoidCallback? fun,
        required TextEditingController email,
        TextInputType? type,
        required String text,
        required IconData icons}) =>
    TextFormField(
      onChanged: on_changed,
      validator: validator_time,
      controller: email,

      onTap: fun,
      keyboardType: type,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "$text",
        labelStyle: TextStyle(
          fontSize: 15.sp,
        ),
        prefixIcon: Icon(icons,size: 20.h,),
      ),
    );

Widget bulid_textFromFieldDate(
        {VoidCallback? fun,
        required TextEditingController email,
        TextInputType? type,
        required String text,
        required IconData icons}) =>
    TextFormField(
      enabled: true,
      onChanged: on_changed,
      validator: validator_Date,
      controller: email,
      onTap: fun,
      keyboardType: type,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "$text",
        labelStyle: TextStyle(
          fontSize: 15.sp,
        ),
        prefixIcon: Icon(icons,size: 20.h,),
      ),
    );

void on_changed(String value) {
  print(value);
}

String? validator(String? value) {
  if (value!.isEmpty) {
    return "title must not be empty";
  }
  return null;
}

String? validator_time(String? value) {
  if (value!.isEmpty) {
    return "Time must not be empty";
  }
  return null;
}

String? validator_Date(String? value) {
  if (value!.isEmpty) {
    return "Date must not be empty";
  }
  return null;
}

Widget bulid_New(item, context) => Dismissible(
      key: UniqueKey(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {

            var email = TextEditingController();
            var time = TextEditingController();
            var date = TextEditingController();
            time.text=item["time"];
            email.text=item["title"];
            date.text=item["date"];
AppCubit.get(context).color=item["color"];
            var form = GlobalKey<FormState>();
            final Alert = AlertDialog(

              content: Container(
                color: Colors.white,
height: 300.h,
                width: 500,
                child: Form(
                  key: form,
                   child: Container(
                     alignment: Alignment.center,
                     child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            height: 10.h,
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
                            height: 10.h,
                          ),
                          bulid_textFromFieldDate(
                            text: ' Task Date',
                            icons: Icons.calendar_today,
                            email: date,
                            fun: () {
                              showDatePicker(
                                      context: context,
                                  initialDate:DateTime(2030, 8, 1),
                                  firstDate: DateTime(2030, 8, 1),
                                  lastDate:DateTime(2030, 12, 31),
                              )
                                  .then((value) {
                                date.text = DateFormat.yMMMd().format(value!);
                              });
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 5.w),
                            child: Text(
                              "Choose Color :",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 5.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    AppCubit.get(context).colors(0xFF42A5F5);
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF42A5F5),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    AppCubit.get(context).colors(3426920849);
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: Color(3426920849),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    AppCubit.get(context).colors(4294951175);
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: Color(4294951175),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                     AppCubit.get(context).colors(0xffb51248);
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xffb51248),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width: double.infinity,
                            color: Colors.blue,
                            child: MaterialButton(
                              onPressed: () {
                                if (form.currentState!.validate() &&
                                    AppCubit.get(context).color !=0) {

                                  AppCubit.get(context).updateDataOFElement(
                                      email.text,
                                      time.text,
                                      date.text,
                                      AppCubit.get(context).color,
                                      item['id']);
                                  Navigator.pop(context);
                                }
                              },
                              child: Text(
                                "Update",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                  ),
                   ),
                ),
              ),
            );

            showDialog(
              context: context,

              builder: (context) => Alert,
            );
          },
          child: Container(
            height: 100.h,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.r)),
            child: Row(
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 10.w),
                  child: CircleAvatar(
                    radius: 40.h,
                    backgroundColor: Color(item["color"]),
                    child: Text("${item["time"]}",maxLines: 2,overflow: TextOverflow.ellipsis,  style: TextStyle(
                        fontSize: 13.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 86.w,
                      child: Text(
                        "${item["title"]}",
                        maxLines: 3,overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "${item["date"]}",
                      maxLines: 2,overflow: TextOverflow.ellipsis,

                      style: TextStyle(color: Colors.grey,fontSize: 12.sp),
                    ),
                  ],
                ),
           Spacer(),
                IconButton(
                    onPressed: () {
                      AppCubit.get(context).updatesDataForElement("Done", 1,item["id"]);
                    },
                    icon: Icon(
                      Icons.check_box,
                      size: 20.h,
                      color: Colors.green,
                    )),
                IconButton(
                    onPressed: () {
                      AppCubit.get(context).updatesDataForElement("Archive", 2,item["id"]);
                    },
                    icon: Icon(
                      Icons.archive,
                      size: 20.h,

                      color: Colors.black45,
                    ))
              ],
            ),
          ),
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteElement(
          item["id"],
        );
      },
    );

Widget bulid_Done(item, context) => Dismissible(
      key: UniqueKey(),
      child: Padding(
        padding:  EdgeInsets.all(10.0.h),
        child: Container(
          height: 100.h,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 10.w),
                child: CircleAvatar(
                  radius: 40.h,
                  backgroundColor: Color(item["color"]),
                  child: Text("${item["time"]}",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(
                      fontSize: 13.sp, fontWeight: FontWeight.w500
                  ),),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 86.w,
                    child: Text(
                      "${item["title"]}",
                      style:
                          TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold,)
                      ,
                      maxLines: 3,overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "${item["date"]}",
                    style: TextStyle(color: Colors.grey,fontSize: 12.sp),
                    maxLines: 2,overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
         Spacer(),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).updatesDataForElement("Done", 1,item["id"]);
                  },
                  icon: Icon(
                    Icons.check_box,
                    size: 20.h,
                    color: Colors.green,
                  )),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).updatesDataForElement("Archive",2, item["id"]);
                  },
                  icon: Icon(
                    Icons.archive,
                    size: 20.h,

                    color: Colors.black45,
                  ))
            ],
          ),
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteElement(
          item["id"],
        );
      },
    );

Widget bulid_Archive(item, context) => Dismissible(
      key: UniqueKey(),
      child: Padding(
        padding:  EdgeInsets.all(10.0.h),
        child: Container(
          height: 100.h,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  radius: 40.h,
                  backgroundColor: Color(item["color"]),
                  child: Text("${item["time"]}",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(
                      fontSize: 13.sp, fontWeight: FontWeight.w500,
                  ),),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width:86.w,
                    child: Text(
                      "${item["title"]}",
                      maxLines:3,overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 13.0.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "${item["date"]}",
                    maxLines: 2,overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey,fontSize: 12.sp),
                  ),
                ],
              ),
          Spacer(),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).updatesDataForElement("Done", 1,item["id"]);
                  },
                  icon: Icon(
                    Icons.check_box,
                    size: 20.h,
                    color: Colors.green,
                  )),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).updatesDataForElement("Archive", 2,item["id"]);
                  },
                  icon: Icon(
                    Icons.archive,
                    size: 20.h,

                    color: Colors.black45,
                  ))
            ],
          ),
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteElement(
          item["id"],
        );
      },
    );
Widget bulid_list_Done(List<Map>task){
if(task.length>0){

  return ListView.separated(
    physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => bulid_Done(task[index], context),
      separatorBuilder: (context, index) => Padding(
        padding:  EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
        child: Container(
          width: double.infinity,
          height: 1.h,
          color: Colors.grey[300],
        ),
      ),
      itemCount: task.length);
} else{
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.menu,size: 100.h,color: Colors.grey,),
        Text("No Tasks Yet, Please Add Some Tasks", style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold

        ),)
      ],),
  );
}
}
Widget bulid_list_New(List<Map>task){
  if(task.length>0){

    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => bulid_New(task[index], context),
        separatorBuilder: (context, index) => Padding(
          padding:  EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
          child: Container(
            width: double.infinity,
            height: 1.h,
            color: Colors.grey[300],
          ),
        ),
        itemCount: task.length);
  } else{
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.menu,size: 100.h,color: Colors.grey,),
          Text("No Tasks Yet, Please Add Some Tasks", style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold

          ),)
        ],),
    );
  }
}
Widget bulid_list_Archive(List<Map>task){
  if(task.length>0){
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => bulid_Archive(task[index], context),
        separatorBuilder: (context, index) => Padding(
          padding:  EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
          child: Container(
            width: double.infinity,
            height: 1.h,
            color: Colors.grey[300],
          ),
        ),
        itemCount: task.length);
  } else{
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.menu,size: 100.h,color: Colors.grey,),
          Text("No Tasks Yet, Please Add Some Tasks", style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold

          ),)
        ],),
    );
  }
}

Widget ConditionalBuilders(context){
  if(State is! LoadData){
  return  AppCubit.get(context).Screen[ AppCubit.get(context).index];
  }else{
    return  Center(child: CircularProgressIndicator());
  }

>>>>>>> e98c76c6bcc6f17dfa332d16edd4b8b240c21faa
}