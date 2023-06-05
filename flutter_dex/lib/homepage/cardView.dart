import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../utils/colors.dart';
import '../utils/captalize.dart';
import '../detail/pkmView.dart';

class MyCardWidget extends HookWidget {
  final List objects;
  final Function() scrollEndedCallback;

  const MyCardWidget(
      {super.key, required this.objects, required this.scrollEndedCallback});

  @override
  Widget build(BuildContext context) {
    var controller = useScrollController();
    useEffect(() {
      // Add a scroll listener to the controller
      controller.addListener(() {
        if (controller.position.pixels == controller.position.maxScrollExtent) {
          // Call the scrollEndedCallback when the scroll reaches the bottom
          scrollEndedCallback();
        }
      });
    }, [controller]);
    return ListView.separated(
        controller: controller,
        padding: const EdgeInsets.all(10),
        separatorBuilder: (_, __) => Divider(
              height: 5,
              thickness: 2,
              indent: 10,
              endIndent: 10,
              color: Theme.of(context).primaryColor,
            ),
        itemCount: objects.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == objects.length) {
                      // Show a loading indicator at the end of the list

            return const Center(
              child: LinearProgressIndicator(),
            );
          }
          final imageUrl = objects[index]['sprites']['front_default'];
          final type = objects[index]['types'][0]['type']['name'];
          return Center(
            child: Card(
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    50), // Adjust the border radius as needed
              ),
              color: AppColors.second,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      final data = objects;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DexDetailPage(
                              jsonObject: data[index],
                            ),
                          ));
                    },
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 100,
                        height: 550,
                        color: TypesColors().pkmColorType(type),
                        child: Image(image: NetworkImage(imageUrl)),
                      ),
                    ),
                    title: Text(objects[index]['name'].toString().capitalize()),
                    subtitle: Text(objects[index]['id'].toString()),
                  )
                ],
              ),
            ),
          );
        });
  }
}
