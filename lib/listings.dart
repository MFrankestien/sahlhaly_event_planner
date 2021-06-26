import 'package:flutter/material.dart';


class Listings extends StatefulWidget {
  @override
  _ListingsState createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          guestsSlider(),

        ],
      ),
    );
  }



  Widget guestsSlider() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey,
          spreadRadius: 1,
          blurRadius: 5,
        )
      ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 40),
          Image.asset(
            'assets/logo.png',
            height: 80,
          ),

          Divider(
            color: Colors.grey[300],
          ),

          /*Container(
            height: 140,
            child: ListView.builder(
              itemCount: guests.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){

                var guest= guests[index];

                return GuestCard(
                  guestImage: guest.guestImage,
                  guestName: guest.guestName,
                  guestProffesion: guest.guestProffesion,
                );
              },
            ),
          )*/


        ],
      ),
    );
  }
}
