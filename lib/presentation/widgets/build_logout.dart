import 'package:demo_app/component/constants/constants.dart';
import '../../business_logic/phone_auth/phone_auth_cubit.dart';
import '../../style/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'build_drawer_list_item.dart';

Widget buildLogoutWithBloc(context) {
  return BlocProvider(
    create: (context) => PhoneAuthCubit(),
    child: buildDrawerListItem(
      leading: Icons.logout_rounded,
      color: red,
      text: 'Logout',
      trailing: SizedBox(),
      onTap: () {
        BlocProvider.of<PhoneAuthCubit>(context).signOut();
        Navigator.pushNamedAndRemoveUntil(context, Login, (route) => false);
      },
    ),
  );
}
