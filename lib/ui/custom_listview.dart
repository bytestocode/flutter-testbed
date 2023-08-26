import 'package:flutter/material.dart';

class UserStory extends StatelessWidget {
  const UserStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, i) {
              return Container(
                width: 60,
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class UserPost extends StatelessWidget {
  const UserPost({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // primary: false,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey.shade200),
                  ),
                  title: const Text("Ava Sadie"),
                  subtitle: Text(
                    "Sylhet, Bangladesh",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  trailing: IconButton(
                    splashRadius: 20.0,
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_outlined),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 250,
                  margin: const EdgeInsets.only(top: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          splashRadius: 20.0,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_outline,
                          ),
                        ),
                        Text(
                          "6.2k",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        IconButton(
                          splashRadius: 20.0,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.messenger_outline,
                          ),
                        ),
                        Text(
                          "2.1k",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        IconButton(
                          splashRadius: 20.0,
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_border_outlined),
                        ),
                        Text(
                          "3.5k",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
