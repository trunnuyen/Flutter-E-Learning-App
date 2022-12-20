import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:online_learning_app/Controllers/CategoryController.dart';
import 'package:online_learning_app/ListItems/CategoryList.dart';
import 'package:online_learning_app/ListItems/CourseExploreCard.dart';
import 'package:online_learning_app/Routes/AppRoutes.dart';
import 'package:online_learning_app/Views/ViewCourse.dart';
import 'package:online_learning_app/Widgets/Icon.dart';
import 'package:online_learning_app/public/color.dart';

class ExploreView extends GetView {
  TextEditingController textEditingController = TextEditingController();
  int activeCategoryIndex = 0;
  int itemCount = 0;
  var categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: Scaffold(
        backgroundColor: appBgColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: appBarColor,
              pinned: true,
              snap: true,
              floating: true,
              title: const Text(
                'Explore',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              automaticallyImplyLeading: false,
              actions: [
                InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.WishList);
                    },
                    child: online_learning_appIcon(
                        myicon: Icons.favorite,
                        background: Colors.grey.shade200,
                        foreground: Colors.blue.shade700))
              ],
            ),
            SliverToBoxAdapter(
              child: getSearchBox(),
            ),
            SliverToBoxAdapter(
              child: getCategories(),
            ),
            SliverToBoxAdapter(
              child: getCourses(),
            ),
          ],
        ),
      ),
    );
  }

  Widget getSearchBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(.05),
                    spreadRadius: .5,
                    blurRadius: .5,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: TextField(
                controller: textEditingController,
                onChanged: (value) => courseController.fetchCourseSearch(
                    key: value,
                    categoryId: categoryController
                        .category!.category![activeCategoryIndex].id),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search_rounded),
                  border: InputBorder.none,
                  hintText: 'Search',
                ),
                textInputAction: TextInputAction.done,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: blue,
            ),
            child: SvgPicture.asset(
              "assets/icons/filter.svg",
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget getCategories() {
    return Obx(
      () => categoryController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: List.generate(
                    categoryController.category!.category!.length,
                    (index) => ExploreCategory(
                      category: categoryController.category!.category![index],
                      isActive: categoryController.currentIndex.value == index,
                      onTap: () {
                        onCategoryIndexChange(index);
                        itemCount = courseController.courseSearch!.length!;
                      },
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  getCourses() {
    return Obx(() {
      if (courseController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (courseController.courseSearch == null) {
        return Image.asset("assets/images/notfound.png");
      }
      return CarouselSlider(
        items: List.generate(
          courseController.courseSearch?.courses?.length ?? 0,
          (index) => InkWell(
            onTap: () {
              Get.to(ViewCourse(
                  course: courseController.courseSearch!.courses![index]));
            },
            child: CourseExploreCard(
              course: courseController.courseSearch!.courses![index],
            ),
          ),
        ),
        options: CarouselOptions(
          height: 510,
          enlargeCenterPage: true,
          disableCenter: true,
          autoPlay: false,
          scrollDirection: Axis.vertical,
          enableInfiniteScroll: false,
        ),
      );
    });
  }

  onCategoryIndexChange(index) {
    activeCategoryIndex = index;
    categoryController.currentIndex.value = index;
    courseController.fetchCourseSearch(
        categoryId: categoryController.category!.category![index].id);

    print('LOOK HERE' '${courseController.courseSearch!.length}');
    print(itemCount);
  }

  // onTapBookmark(index) {

  //     courses[index]["is_favorited"] = !courses[index]["is_favorited"];

  // }

  Future<void> _refresh() {
    categoryController.fetchData();
    return Future.delayed(const Duration(seconds: 3));
  }
}
