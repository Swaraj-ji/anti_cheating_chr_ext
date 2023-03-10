import 'package:flutter/cupertino.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 100,
            width: 150,
            child: Image.asset(
              'images/luck.png',
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Please Fill in the Details',
                style: TextStyle(
                    fontSize: 40,
                    color: Color(0xFF030303),
                    fontFamily: 'Pacifico'),
              ),
              SizedBox(
                width: 60,
              ),
            ],
          )
        ],
      ),
    );
  }
}
