import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget{
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 50,
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 0,
                    offset: const Offset(1,1)
                )
              ]
          ),
          child: const Column(
            children: [
              Card(
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.only(right: 16, left: 16, top: 50, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'HandBag LV',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$255',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 22,
          bottom: 105,
          child: Image.network(
            'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
            height: 100,
          ),
        ),
      ],
    );
  }
}