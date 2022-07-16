import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:untitled/bloc_dire/my_bloc.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    MyBloc myBloc = Provider.of<MyBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 60,
            child: BlocSelector<MyBloc, MyState, dynamic>(
              selector: (block) {
                if (block is InitialState) {
                  return block;
                } else if (block is FirstState) {
                  return block;
                } else if (block is SecondState) {
                  return block;
                } else if (block is ThirdState) {
                  return block;
                } else {
                  return block;
                }
              },
              builder: (context, block) {
                if (block is InitialState) {
                  return Center(child: Initial(text: block.text));
                } else if (block is FirstState) {
                  return Center(child: First(url: block.url));
                } else if (block is SecondState) {
                  return Second(
                      radius: block.radius,
                      width: block.width,
                      height: block.height);
                } else if (block is ThirdState) {
                  return Third(id: block.id, text: block.text);
                } else {
                  return Initial(text: 'no id ');
                }
              },
            ),
          ),
          Expanded(
            flex: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      myBloc.add(FirstEvent());
                    },
                    child: Text('first')),
                ElevatedButton(
                    onPressed: () {
                      myBloc.add(SecondEvent());
                    },
                    child: Text('second')),
                ElevatedButton(
                    onPressed: () {
                      myBloc.add(ThirdEvent());
                    },
                    child: Text('third'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class First extends StatelessWidget {
  final String url;
  const First({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(url),
    );
  }
}

class Second extends StatelessWidget {
  final double height;
  final double width;
  final double radius;

  const Second(
      {required this.radius,
      required this.width,
      required this.height,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: Colors.amber),
    );
  }
}

class Third extends StatelessWidget {
  final int id;
  final String text;
  const Third({required this.id, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(id.toString()),
      title: Text(text),
    );
  }
}

class Initial extends StatelessWidget {
  final String text;
  const Initial({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
