// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flight/flights/components/product_card.dart';
import 'package:flutter/material.dart';

import 'package:flight/components/constants.dart';
import 'package:flight/models/product.dart';
import 'package:flight/details/details_screen.dart';

import 'package:flight/components/search_box.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: <Widget>[
/* search box */

          SearchBox(onChanged: (value) {},hinttext:"from"),
SizedBox(height: 10,),
          SearchBox(onChanged: (value) {},hinttext:"to"),

          /* category list  */

          // CategoryList(),
          SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: Stack(
              children: <Widget>[
                // Our background
                Container(
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                ListView.builder(
                  // here we use our demo procuts list
                  itemCount: products.length,

                  itemBuilder: (context, index) => ProductCard(
                    itemIndex: index,
                    product: products[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            product: products[index],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
