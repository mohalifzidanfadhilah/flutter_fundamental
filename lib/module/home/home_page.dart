import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek/module/home/home_notifier.dart';
import 'package:proyek/utils/colors_utils.dart';
import 'package:proyek/utils/image_path.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeNotifier(context),
      child: Consumer<HomeNotifier>(
        builder: (context, value, child) => Scaffold(
            body: Column(
              children: [
                Container(
                  height: 50,
                  child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageAssets.logo,
                      height: 30,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(fontSize: 12),
                          decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              hintStyle: const TextStyle(fontSize: 12),
                              hintText: "Cari Produk"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Icon(Icons.settings)
                  ],
                ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        height: 180,
                        child: PageView(
                          controller: PageController(viewportFraction: 0.8),
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 16,),
                              child: Image.asset(ImageAssets.banner1,
                              fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 16),
                              child: Image.asset(ImageAssets.banner2,
                              fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 16),
                              child: Image.asset(ImageAssets.banner3,
                              fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 16),
                              child: Image.asset(ImageAssets.banner4,
                              fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 16),
                              child: Image.asset(ImageAssets.banner5,
                              fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:  [
                          InkWell(
                            onTap: () => value.gantiMenu(0),
                            child: Column(
                              children: [
                                Icon(Icons.abc,color: value.menu ==0 ?Colors.black : Colors.blue ,),
                                Text("Huruf", style: TextStyle(
                                  color: value.menu == 0
                                      ? Colors.black
                                      : Colors.blue,
                                ),),
                              ],
                            ),
                          ),
                          InkWell(
                          onTap: () => value.gantiMenu(1),
                            child: Column(
                              children: [
                                Icon(Icons.backpack,
                                color:
                                    value.menu == 1 ? Colors.black : Colors.blue,
                              ),
                              Text("Backpack",style: TextStyle(
                                  color: value.menu == 1
                                      ? Colors.black
                                      : Colors.blue,
                                ),),
                              ],
                            ),
                          ),
                          InkWell(
                          onTap: () => value.gantiMenu(2),
                            child: Column(
                              children: [
                                Icon(Icons.cable,
                                color:
                                    value.menu == 2 ? Colors.black : Colors.blue,
                              ),
                              Text("Cable",style: TextStyle(
                                  color: value.menu == 2
                                      ? Colors.black
                                      : Colors.blue,
                                ),),
                              ],
                            ),
                          ),
                          InkWell(
                          onTap: () => value.gantiMenu(3),
                            child: Column(
                              children: [
                                Icon(Icons.dangerous,
                                color:
                                    value.menu == 3 ? Colors.black : Colors.blue,
                              ),
                              Text("Dangerous",style: TextStyle(
                                  color: value.menu == 3
                                      ? Colors.black
                                      : Colors.blue,
                                ),),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  ),
              ],
            ),
            // ListView(
            //   children: [
            //     value.isLoding
            //       ? Column(
            //         children: const [
            //           CircularProgressIndicator(),
            //         ],
            //       )
            //       : ListView.builder(
            //         shrinkWrap: true,
            //         physics: const ClampingScrollPhysics(),
            //         itemCount: value.list.length,
            //         itemBuilder: (context, i){
            //           final data = value.list[i];
            //           return Column(
            //             children: [
            //               Text("${data.namaProduk}-${data.kategori}-${data.harga}"),
            //               const SizedBox(
            //                 height: 16,
            //               )
            //             ],
            //           );
            //       })
            //   ],
            // )
            ),
      ),
    );
  }
}
