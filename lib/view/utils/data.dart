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

List users = [
  {
    "name": 'David Brooks',
    "imageUrl":
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  },
  {
    "name": 'Jane Doe',
    "imageUrl":
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  },
  {
    "name": 'Matthew Hinkle',
    "imageUrl":
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
  },
  {
    "name": 'Amy Smith',
    "imageUrl":
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  },
  {
    "name": 'Ed Morris',
    "imageUrl":
        'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
  },
  {
    "name": 'Carolyn Duncan',
    "imageUrl":
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  },
];

List posts = [
  {
    "user": users[0],
    "caption": 'Check out these cool puppers',
    "timeAgo": '58m',
    "imageUrl": 'https://images.unsplash.com/photo-1525253086316-d0c936c814f8',
    "likes": 1202,
    "comments": 184,
    "shares": 96,
  },
  {
    "user": users[1],
    "caption":
        'Please enjoy this placeholder text: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    "timeAgo": '3hr',
    "imageUrl": null,
    "likes": 683,
    "comments": 79,
    "shares": 18,
  },
  {
    "user": users[2],
    "caption": 'This is a very good boi.',
    "timeAgo": '8hr',
    "imageUrl":
        'https://images.unsplash.com/photo-1575535468632-345892291673?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    "likes": 894,
    "comments": 201,
    "shares": 27,
  },
  {
    "user": users[3],
    "caption": 'Adventure 🏔',
    "timeAgo": '15hr',
    "imageUrl":
        'https://images.unsplash.com/photo-1573331519317-30b24326bb9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
    "likes": 722,
    "comments": 183,
    "shares": 42,
  },
  {
    "user": users[4],
    "caption":
        'More placeholder text for the soul: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    "timeAgo": '1d',
    "imageUrl": null,
    "likes": 482,
    "comments": 37,
    "shares": 9,
  },
  {
    "user": users[5],
    "caption": 'A classic.',
    "timeAgo": '1d',
    "imageUrl":
        'https://images.unsplash.com/reserve/OlxPGKgRUaX0E1hg3b3X_Dumbo.JPG?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    "likes": 1523,
    "shares": 129,
    "comments": 301,
  },
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
