
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../shared/components/components.dart';
import '../../shared/components/constant.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/status.dart';

class Done_Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return bulid_list_Done(Donetask);


      },
    );
  }
}