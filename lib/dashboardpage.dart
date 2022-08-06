import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/foodtabs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'burgerpage.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 6.0,
                          spreadRadius: 4.0,
                          offset: const Offset(0.0, 3.0),
                        )
                      ],
                      color: const Color(0xFFC6E7FE),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          image: AssetImage('assets/tuxedo.png'),
                          fit: BoxFit.contain)),
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'SEARCH FOR',
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w800, fontSize: 27.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'RECIPES',
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w800, fontSize: 27.0),
          ),
        ),
        const SizedBox(height: 25.0),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Container(
            padding: const EdgeInsets.only(left: 5.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextField(
                decoration: InputDecoration(
                    hintText: 'SEARCH',
                    hintStyle: GoogleFonts.notoSans(fontSize: 14.0),
                    border: InputBorder.none,
                    fillColor: Colors.grey.withOpacity(0.5),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ))),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'Recommended',
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w500, fontSize: 18.0),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Container(
          height: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _BuildListItem('Hamburg', 'assets/burger.png', '21',
                  const Color(0xFFFFE9C6), const Color(0xFFDA9551)),
              _BuildListItem('Chips', 'assets/fries.png', '15',
                  const Color(0xFFC2E3FE), const Color(0xFF6A8CAA)),
              _BuildListItem('Donuts', 'assets/doughnut.png', '15',
                  const Color(0xFFD7FADA), const Color(0xFF56CC7E)),
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              labelStyle: GoogleFonts.notoSans(
                  fontSize: 16.0, fontWeight: FontWeight.w700),
              unselectedLabelStyle: GoogleFonts.notoSans(
                  fontSize: 12.0, fontWeight: FontWeight.w500),
              tabs: const [
                Tab(child: Text('FEATURED')),
                Tab(child: Text('COMBO')),
                Tab(child: Text('FAVORITES')),
                Tab(child: Text('RECOMMENDED')),
              ]),
        ),
        Container(
          height: MediaQuery.of(context).size.height - 450.0,
          child: TabBarView(controller: tabController, children: const [
            FoodTabs(),
            FoodTabs(),
            FoodTabs(),
            FoodTabs(),
          ]),
        )
      ],
    ));
  }

  _BuildListItem(String foodName, String imgPath, String price, Color bgColor,
      Color textColor) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: () {
          // ToDo
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BurgerPage(
                  heroTag: foodName,
                  foodName: foodName,
                  pricePerItem: price,
                  imgPath: imgPath)));
        },
        child: Container(
          height: 175.0,
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: bgColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                  tag: foodName,
                  child: Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Center(
                      child: Image.asset(
                        imgPath,
                        height: 50.0,
                        width: 50.0,
                      ),
                    ),
                  )),
              const SizedBox(height: 25.0),
              Text(
                foodName,
                style: GoogleFonts.notoSans(fontSize: 17.0, color: textColor),
              ),
              Text(
                '\$' + price,
                style: GoogleFonts.notoSans(fontSize: 17.0, color: textColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
