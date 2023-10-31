import 'package:flutter/material.dart';
import 'package:project_structure/config/app_textstyle.dart';
import 'package:project_structure/widget/common_appbar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Cart", isLeading: false, centerTitle: true),
      body: Center(child: Text("Cart Screen",style: AppTextStyle.appBarTitle,)),
    );
  }
}
