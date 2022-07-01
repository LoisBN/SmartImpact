import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 18, 18, 18),
          leading: const Icon(Icons.sports_mma),
          actions: [
            IconButton(
              icon: const Icon(Icons.person_outline),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {},
            ),
          ],
          title: const Text("Smart Impact"),
        ),
        body: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Bonjour Ylan,",
                      style: TextStyle(
                          fontSize: 25, color: Colors.red, letterSpacing: 1.5),
                    )),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Plan d'entraînement",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "Ven 19 Nov",
                          style: TextStyle(fontSize: 14, color: Colors.red),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://medias.toutelanutrition.com/ressource/144/wikifit/HUB/musculation/banner-hub-musculation.jpg")),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade900,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Mes entraînements",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "plus",
                          style: TextStyle(fontSize: 14, color: Colors.red),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              10,
                              (index) => Container(
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://www.fitadium.com/conseils/wp-content/uploads/2020/05/programme-musculation-masse-seche.jpg")),
                                        color: Colors.grey.shade900,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: 250,
                                    width: 350,
                                    margin: const EdgeInsets.all(7),
                                  )),
                        ))),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Autres d'entraînement",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "plus",
                          style: TextStyle(fontSize: 14, color: Colors.red),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(10, (index) {
                            if (index % 3 == 0) {
                              return Container(
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "https://www.espace-musculation.com/uploads/2016/11/stagnation-musculation.jpg")),
                                    color: Colors.grey.shade900,
                                    borderRadius: BorderRadius.circular(20)),
                                height: 250,
                                width: 200,
                                margin: const EdgeInsets.all(7),
                              );
                            } else if (index % 3 == 1) {
                              return Container(
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "https://wallpaperaccess.com/full/1484318.jpg")),
                                    color: Colors.grey.shade900,
                                    borderRadius: BorderRadius.circular(20)),
                                height: 250,
                                width: 200,
                                margin: const EdgeInsets.all(7),
                              );
                            } else {
                              return Container(
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "https://gentlemanmoderne.com/wp-content/uploads/2020/03/muscu-a-la-maison-materiel.png")),
                                    color: Colors.grey.shade900,
                                    borderRadius: BorderRadius.circular(20)),
                                height: 250,
                                width: 200,
                                margin: const EdgeInsets.all(7),
                              );
                            }
                          }),
                        ))),
              ],
            ),
          ),
        ));
  }
}
