import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do/shared/cubit/cubit.dart';
import 'package:to_do/shared/cubit/states.dart';

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
        prefixIcon: Icon(icons),
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
        prefixIcon: Icon(icons),
      ),
    );

Widget bulid_textFromFieldDate(
        {VoidCallback? fun,
        required TextEditingController email,
        TextInputType? type,
        required String text,
        required IconData icons}) =>
    TextFormField(
      onChanged: on_changed,
      validator: validator_Date,
      controller: email,
      onTap: fun,
      keyboardType: type,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "$text",
        prefixIcon: Icon(icons),
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
      key: Key(item["id"].toString()),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            var email = TextEditingController();
            var time = TextEditingController();
            var date = TextEditingController();
            var form = GlobalKey<FormState>();
            final Alert = AlertDialog(
              content: Container(
                color: Colors.white,
                width: 400,
                child: Form(
                  key: form,
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
                                    lastDate: DateTime.parse("2022-10-12"))
                                .then((value) {
                              date.text = DateFormat.yMMMd().format(value!);
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            "color :",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
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
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.blue,
                          child: MaterialButton(
                            onPressed: () {
                              if (form.currentState!.validate() &&
                                  AppCubit.get(context).color != null) {
                                AppCubit.get(context).updatData(
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
            );

            showDialog(
              context: context,
              builder: (context) => Alert,
            );
          },
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(item["color"]),
                    child: Text("${item["time"]}"),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${item["title"]}",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${item["date"]}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  width: 80.0,
                ),
                IconButton(
                    onPressed: () {
                      AppCubit.get(context).updates("Done", item["id"]);
                    },
                    icon: Icon(
                      Icons.check_box,
                      color: Colors.green,
                    )),
                IconButton(
                    onPressed: () {
                      AppCubit.get(context).updates("Archive", item["id"]);
                    },
                    icon: Icon(
                      Icons.archive,
                      color: Colors.black45,
                    ))
              ],
            ),
          ),
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).delete(
          item["id"],
        );
      },
    );

Widget bulid_Done(item, context) => Dismissible(
      key: Key(item["id"].toString()),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(item["color"]),
                  child: Text("${item["time"]}"),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${item["title"]}",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${item["date"]}",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                width: 80.0,
              ),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).updates("Done", item["id"]);
                  },
                  icon: Icon(
                    Icons.check_box,
                    color: Colors.green,
                  )),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).updates("Archive", item["id"]);
                  },
                  icon: Icon(
                    Icons.archive,
                    color: Colors.black45,
                  ))
            ],
          ),
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).delete(
          item["id"],
        );
      },
    );

Widget bulid_Archive(item, context) => Dismissible(
      key: Key(item["id"].toString()),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(item["color"]),
                  child: Text("${item["time"]}"),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${item["title"]}",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${item["date"]}",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                width: 80.0,
              ),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).updates("Done", item["id"]);
                  },
                  icon: Icon(
                    Icons.check_box,
                    color: Colors.green,
                  )),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).updates("Archive", item["id"]);
                  },
                  icon: Icon(
                    Icons.archive,
                    color: Colors.black45,
                  ))
            ],
          ),
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).delete(
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
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
        child: Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey[300],
        ),
      ),
      itemCount: task.length);
} else{
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.menu,size: 100,color: Colors.grey,),
        Text("No Tasks Yet, Please Add Some Tasks", style: TextStyle(
            fontSize: 16,
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
          padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: task.length);
  } else{
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.menu,size: 100,color: Colors.grey,),
          Text("No Tasks Yet, Please Add Some Tasks", style: TextStyle(
              fontSize: 16,
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
          padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: task.length);
  } else{
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.menu,size: 100,color: Colors.grey,),
          Text("No Tasks Yet, Please Add Some Tasks", style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold

          ),)
        ],),
    );
  }
}

Widget ConditionalBuilders(context){
  if(State is! Load){
  return  AppCubit.get(context).Screen[ AppCubit.get(context).index];
  }else{
    return  Center(child: CircularProgressIndicator());
  }

}