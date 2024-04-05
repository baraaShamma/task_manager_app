import 'package:flutter/material.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingBtn(context),
    );
  }

  AppBar _buildAppbar() => AppBar(title: const Text('Tasks'));

  Widget _buildBody() {
    return const Padding(padding: EdgeInsets.all(10), child: Text('Tasks'));
  }

  Widget _buildFloatingBtn(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      tooltip: 'add Task',
      onPressed: () {},
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).iconTheme.color),
        child: const Icon(Icons.add),
      ),
    );
  }
}
