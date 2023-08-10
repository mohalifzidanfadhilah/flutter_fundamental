import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek/module/home/home_page.dart';
import 'package:proyek/module/menu/menu_notifier.dart';
import 'package:proyek/module/order/order_page.dart';
import 'package:proyek/module/profile/profile_page.dart';
import 'package:proyek/module/shop/shop_page.dart';
import 'package:proyek/utils/colors_utils.dart';
import 'package:proyek/utils/image_path.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>MenuNotifier(context),
      child: Consumer<MenuNotifier>(
        builder: (context, value, child) => 
        Scaffold(
          backgroundColor: Colors.grey[300],
          body: Stack(
            children: [
              Center(
                child: Container(
                  color: Colors.grey[200],
                  width: MediaQuery.of(context).size.width > 600
                  ? 400
                  :double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: value.page == 0 
                        ? const HomePage() 
                        : value.page == 1 
                          ? const OrderPage() 
                          :value.page == 2 
                            ? const ShopPage() 
                            : const ProfilePage()),
                    ],
                    ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width > 600
                          ? 400
                          : double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0, 
                          child: Container(
                            height: 60,
                            color: colorprimary,
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                      onTap: (){
                                        value.gantiPage(0);
                                      },
                                      child: Image.asset(ImageAssets.home,
                                      height: 26,
                                      color: value.page == 0
                                            ? Colors.black
                                            : Colors.white,))),
                                Expanded(
                                  child: InkWell(
                                      onTap: (){
                                        value.gantiPage(1);
                                      },
                                      child: Image.asset(ImageAssets.shop, 
                                      height: 26,
                                      color: value.page == 1
                                            ? Colors.black
                                            : Colors.white,))),
                                const Expanded(child: SizedBox()),
                                Expanded(
                                  child: InkWell(
                                    onTap: ()=>value.gantiPage(2),
                                    child: Image.asset(ImageAssets.order, 
                                    height: 26,
                                    color: value.page == 2
                                          ? Colors.black
                                          : Colors.white,))),
                                Expanded(
                                  child: InkWell(onTap: ()=>value.gantiPage(3),
                                  child: Image.asset(ImageAssets.user, 
                                  height: 26,
                                  color: value.page == 3
                                        ? Colors.black
                                        : Colors.white,))),
                              ],)
                          ),
                        ),
                          Center(
                            child: Container(
                              width: 60,
                              height: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.black,
                                  )),
                                  child: Image.asset(
                                    ImageAssets.scan,
                                    height: 26,
                                    color: Colors.black,),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}