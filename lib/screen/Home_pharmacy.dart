import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicoo/bloc/post_bloc.dart';
import 'package:medicoo/bloc/repository.dart';


class Pharmacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: BlocProvider(
            child: Home(),
            create:(context)=>PostBloc(PostRepositoryImpl())..add(FechPosts()))
    );
  }
}






class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('All Posts'),
      ),
      body: BlocBuilder<PostBloc, PostState>(

        builder: (context, state) {

          if (state is PostLoading) {

            return CircularProgressIndicator();
          } else if (state is PostLoaded) {

            return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, i) {
                  return Card(
                    margin: EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Text(state.posts[i].name),
                    ),
                  );
                });
          } else if (state is PostError) {
            print(Text(state.message))  ;
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
