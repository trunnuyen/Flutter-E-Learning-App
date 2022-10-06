import 'package:flutter/material.dart';

var profile = {
  "name": "Lmao",
  "image": "https://avatars.githubusercontent.com/u/94124755?v=4",
  "email": "trng1907@gmail.com"
};


List categories = [
  {"name": "All", "icon": "assets/icons/category/all.svg"},
  {"name": "Coding", "icon": "assets/icons/category/coding.svg"},
  {"name": "Education", "icon": "assets/icons/category/education.svg"},
  {"name": "Design", "icon": "assets/icons/category/design.svg"},
  {"name": "Business", "icon": "assets/icons/category/business.svg"},
  {"name": "Cooking", "icon": "assets/icons/category/cooking.svg"},
  {"name": "Music", "icon": "assets/icons/category/music.svg"},
  {"name": "Art", "icon": "assets/icons/category/art.svg"},
  {"name": "Finance", "icon": "assets/icons/category/finance.svg"},
];

List features = [
  {
    "id": 100,
    "name": "UI/UX Design",
    "image":
        "https://images.unsplash.com/photo-1596638787647-904d822d751e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$110.00",
    "duration": "10 hours",
    "session": "6 lessons",
    "review": "4.5",
    "is_favorited": false,
    "description":
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id": 101,
    "name": "Programming",
    "image":
        "https://images.unsplash.com/photo-1517694712202-14dd9538aa97?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$155.00",
    "duration": "20 hours",
    "session": "12 lessons",
    "review": "5",
    "is_favorited": true,
    "description":
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id": 102,
    "name": "English Writing",
    "image":
        "https://images.unsplash.com/photo-1503676260728-1c00da094a0b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$65.00",
    "duration": "12 hours",
    "session": "4 lessons",
    "review": "4.5",
    "is_favorited": false,
    "description":
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id": 103,
    "name": "Photography",
    "image":
        "https://images.unsplash.com/photo-1472393365320-db77a5abbecc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$80.00",
    "duration": "4 hours",
    "session": "3 lessons",
    "review": "4.5",
    "is_favorited": false,
    "description":
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id": 104,
    "name": "Guitar Class",
    "image":
        "https://images.unsplash.com/photo-1549298240-0d8e60513026?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$125.00",
    "duration": "12 hours",
    "session": "4 lessons",
    "review": "5",
    "is_favorited": false,
    "description":
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
];

List recommends = [
  {
    "id": 105,
    "name": "Painting",
    "image":
        "https://images.unsplash.com/photo-1596548438137-d51ea5c83ca5?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$65.00",
    "duration": "12 hours",
    "session": "8 lessons",
    "review": "4.5",
    "is_favorited": false,
    "description":
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id": 106,
    "name": "Social Media",
    "image":
        "https://images.unsplash.com/photo-1611162617213-7d7a39e9b1d7?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$135.00",
    "duration": "6 hours",
    "session": "4 lessons",
    "review": "4",
    "is_favorited": false,
    "description":
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id": 107,
    "name": "Caster",
    "image":
        "https://images.unsplash.com/photo-1554446422-d05db23719d2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$95.00",
    "duration": "8 hours",
    "session": "4 lessons",
    "review": "4.5",
    "is_favorited": false,
    "description":
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id": 108,
    "name": "Management",
    "image":
        "https://images.unsplash.com/photo-1542626991-cbc4e32524cc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$75.00",
    "duration": "9 hours",
    "session": "5 lessons",
    "review": "4.5",
    "is_favorited": false,
    "description":
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  }
];

List courses = [
  {
    "id": 100,
    "name": "UI/UX Design",
    "image":
        "https://images.unsplash.com/photo-1596638787647-904d822d751e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$110.00",
    "duration": "10 hours",
    "session": "6 lessons",
    "review": "4.5",
    "is_favorited": false,
    "description":
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id": 101,
    "name": "Programming",
    "image":
        "https://images.unsplash.com/photo-1517694712202-14dd9538aa97?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$155.00",
    "duration": "20 hours",
    "session": "12 lessons",
    "review": "5",
    "is_favorited": true,
    "description":
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id": 102,
    "name": "English Writing",
    "image":
        "https://images.unsplash.com/photo-1503676260728-1c00da094a0b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$65.00",
    "duration": "12 hours",
    "session": "4 lessons",
    "review": "4.5",
    "is_favorited": false,
    "description":
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id": 103,
    "name": "Mix Salad",
    "image":
        "https://images.unsplash.com/photo-1507048331197-7d4ac70811cf?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$80.00",
    "duration": "4 hours",
    "session": "3 lessons",
    "review": "4.5",
    "is_favorited": false,
    "description":
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id": 104,
    "name": "Guitar Class",
    "image":
        "https://images.unsplash.com/photo-1549298240-0d8e60513026?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$125.00",
    "duration": "12 hours",
    "session": "4 lessons",
    "review": "5",
    "is_favorited": false,
    "description":
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id": 105,
    "name": "Painting",
    "image":
        "https://images.unsplash.com/photo-1596548438137-d51ea5c83ca5?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$65.00",
    "duration": "12 hours",
    "session": "8 lessons",
    "review": "4.5",
    "is_favorited": false,
    "description":
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id": 106,
    "name": "Communication Skill",
    "image":
        "https://images.unsplash.com/photo-1552664730-d307ca884978?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$135.00",
    "duration": "6 hours",
    "session": "4 lessons",
    "review": "4",
    "is_favorited": false,
    "description":
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id": 107,
    "name": "Caster",
    "image":
        "https://images.unsplash.com/photo-1554446422-d05db23719d2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$95.00",
    "duration": "8 hours",
    "session": "4 lessons",
    "review": "4.5",
    "is_favorited": false,
    "description":
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id": 108,
    "name": "Management",
    "image":
        "https://images.unsplash.com/photo-1542626991-cbc4e32524cc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$75.00",
    "duration": "9 hours",
    "session": "5 lessons",
    "review": "4.5",
    "is_favorited": false,
    "description":
        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  }
];


Widget text(
    {required String content,
    double fontSize = 12,
    Color? textColor,
    FontWeight fontWeight = FontWeight.w300}) {
  return Text(content,
      style: TextStyle(
          fontSize: fontSize, color: textColor, fontWeight: fontWeight));
}
