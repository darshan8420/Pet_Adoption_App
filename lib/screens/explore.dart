import 'package:flutter/material.dart';
import 'package:pet_app/theme/color.dart';
import 'package:pet_app/utils/data.dart';
import 'package:pet_app/widgets/category_item.dart';
import 'package:pet_app/widgets/chat_item.dart';
import 'package:pet_app/widgets/custom_textbox.dart';
import 'package:pet_app/widgets/explore_item.dart';
import 'package:pet_app/widgets/icon_box.dart';
import 'package:pet_app/widgets/pet_item.dart';


class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: AppColor.appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: _buildHeader(),
        ),
        SliverToBoxAdapter(child: _buildBody())
      ],
    );
  }

  _buildHeader() {
    return const Row(
      children: [
        Expanded(
          child: CustomTextBox(
            hint: "Search",
            prefix: Icon(Icons.search, color: Colors.grey),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        IconBox(
          child: Icon(Icons.filter_list_rounded, color: Colors.white),
          bgColor: AppColor.secondary,
          radius: 10,
        )
      ],
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "Pets",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _buildCategories(),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "Profiles",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildProfiles(),
          const SizedBox(
            height: 20,
          ),
          // _buildBrokers(),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  int _selectedCategory = 0;
  _buildCategories() {
    List<Widget> lists = List.generate(
      categories.length,
          (index) => CategoryItem(
        data: categories[index],
        selected: index == _selectedCategory,
        onTap: () {
          setState(() {
            _selectedCategory = index;
          });
        },
      ),
    );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  int _selectedProfile = 0;
  _buildProfiles() {
    List<Widget> lists = List.generate(
      pets.length,
        (index) => ExploreItem(data: pets[index],
        selected: index == _selectedProfile,
          onTap: (){
            setState(() {
              _selectedProfile = index;
            });
          },
        )
    );

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.only(bottom: 5, left: 15),
      child: Column(children: lists),
    );
  }

}
