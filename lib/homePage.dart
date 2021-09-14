import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, @required this.inputLabel});

  final inputLabel;

  @override
  State<HomePage> createState() => HomePageState(inputLabel: inputLabel);
}

class HomePageState extends State<HomePage> {
  List<String> friends = ['José', 'Maria', 'Davi'];

  String inputValue = '';

  handleAddFriend(String name) {
    var isFriendExist;

    friends.forEach(
      (friend) => {if (friend == name) isFriendExist = false},
    );
    print('$isFriendExist');

    if (isFriendExist == false) return [...friends, name];
  }

  handleDeleteFriend(int id) {
    return friends.where((friend) => friends.indexOf(friend) != id).toList();
  }

  HomePageState({@required this.inputLabel});

  final inputLabel;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 100),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: inputLabel,
              ),
              onChanged: (text) => setState(() => inputValue = text),
            ),
          ),
          Column(
            children: <Widget>[
              ...friends.map(
                (friend) => (TextButton(
                  onPressed: () => {
                    setState(
                      () =>
                          friends = handleDeleteFriend(friends.indexOf(friend)),
                    )
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[800]),
                  ),
                  child: Text('$friend'),
                )),
              ),
            ],
          ),
          TextButton(
            onPressed: () =>
                setState(() => friends = handleAddFriend('$inputValue')),
            child: Text('Adicionar amigo'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green[300]),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
