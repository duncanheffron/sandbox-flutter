import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(data['bgImage']),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 150.0),
          child: Column(
            children: <Widget>[
              Card(
                color: Color.fromRGBO(255, 255, 255, 0.90),
                margin: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 35.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 30.0,
                  ),
                  child: Column(
                    children: [
                      TextButton.icon(
                        onPressed: () async {
                          dynamic result =
                              await Navigator.pushNamed(context, '/location');
                          setState(() {
                            data = {
                              'time': result['time'],
                              'location': result['location'],
                              'falg': result['flag'],
                              'bgImage': result['bgImage'],
                            };
                          });
                        },
                        icon: Icon(Icons.edit_location),
                        label: Text('Edit location'),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            data['location'],
                            style: TextStyle(
                              fontSize: 28.0,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        data['time'],
                        style: TextStyle(
                          fontSize: 66.0,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
