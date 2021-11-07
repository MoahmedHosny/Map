import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_app/business_logic/phone_auth/phone_auth_cubit.dart';
import 'package:demo_app/business_logic/phone_auth/phone_auth_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../style/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildHeaderDrawer(context) {
  return BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
    builder: (context, state) {
      PhoneAuthCubit cubit = BlocProvider.of<PhoneAuthCubit>(context);
      return Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.125,
            width: MediaQuery.of(context).size.width * 0.325,
            decoration: BoxDecoration(
              color: blue.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: CachedNetworkImage(
              imageUrl: '${cubit.userModel.image}',
              imageBuilder: (context, imageProvider) => Container(
                height: MediaQuery.of(context).size.height * 0.125,
                width: MediaQuery.of(context).size.width * 0.325,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                ),
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                color: red,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '${cubit.userModel.name}',
            style: TextStyle(
              fontSize: 16.95,
              letterSpacing: 0.5,
            ),
          ),
          Text(
            '+2 ${cubit.userModel.phoneNumber}',
            style: TextStyle(
              fontSize: 15.65,
              color: blue,
              letterSpacing: 0.5,
            ),
          ),
        ],
      );
    },
  );
}
