import 'package:flutter/material.dart';
import 'package:todo_app/views/TodoDetailView.dart';
import 'package:todo_app/views/create_todo_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: SafeArea(
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ListView(
                    children: [
                      CompletedToDoTile(),
                      CompletedToDoTile(),
                      CompletedToDoTile(),
                      CompletedToDoTile(),
                    ],
                  );
                });
          },
          child: Container(
            height: 50,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.blueGrey, borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.check_circle_rounded, color: Colors.white),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Completed",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.keyboard_arrow_down, color: Colors.white)
                  ],
                ),
                Text(
                  "24",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return CreateToDoView();
          }));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            foregroundImage: AssetImage("assets/enochkay.jpg"),
          ),
        ),
        title: const Text(
          'My Task',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.sort)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search))
        ],
      ),
      body: ListView(
        children: const [
          ToDoTile(
              title: "Plan the trip to Finland ",
              subtitle: "The family\’s trip to Finland next summer.",
              time: "Yesterday"),
          ToDoTile(
              title: "Plan Susan\’s birthday",
              subtitle: " ",
              time: "Today 13:00"),
          ToDoTile(
              title: "Groceries for dinner",
              subtitle:
                  "Get tomatoes, lettuce, potatoes, green beans, cream and beef filet. Also buy red wine at John’s Wine Shop.",
              time: "Today 13:00"),
          ToDoTile(
              title: "Port projects ",
              subtitle: "Send the presentation to Bill.",
              time: "Tomorrow"),
          ToDoTile(
              title: "Take jacket to cleaning",
              subtitle: " ",
              time: "Fri. 30 OCT."),
          ToDoTile(
              title: "Fix dad\’s PC",
              subtitle:
                  "Install the latest updates and check your wireless connection.",
              time: " "),
          ToDoTile(
            title: "Trip to Stockholm",
            subtitle: "Talk with Monica about the trip.",
            time: " ",
          ),
        ],
      ),
    ));
  }
}

class ToDoTile extends StatelessWidget {
  const ToDoTile(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.time})
      : super(key: key);

  final String title;
  final String subtitle;
  final String time;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailView(title: title, subtitle: subtitle);
        }));
      },
      child: Card(
          elevation: 4,
          child: ListTile(
            leading: Icon(Icons.check_circle_outlined),
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              subtitle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.notifications),
                label: Text(time)),
          )),
    );
  }
}

class CompletedToDoTile extends StatelessWidget {
  const CompletedToDoTile({
    Key? key,
  }) : super(key: key);

  final String title = "";
  final String subtitle = "";
  final String time = "";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailView(title: title, subtitle: subtitle);
        }));
      },
      child: Card(
          elevation: 4,
          child: ListTile(
            leading: Icon(Icons.check_circle_outlined),
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              subtitle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.notifications),
                label: Text(time)),
          )),
    );
  }
}
