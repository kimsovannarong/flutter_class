import 'package:flutter/material.dart';
import 'package:flutter_class/W6-S1/EXERCISE-2/model/profile_tile_model.dart';

ProfileData myProfile = ProfileData(
    name: "Kim Sovannarong",
    position: "Flutter Developer",
    avatarUrl: 'assets/images/W6-S2/boy.png',
    tiles: [
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(
          icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(
          icon: Icons.email, title: "Mail", value: "Sovannarong.kim@student.cadt.edu"
      ),
      TileData(
          icon: Icons.school, title: "Major", value: "Computer Science"),
       TileData(
              icon: Icons.school_sharp, title: "Specialize", value: "Software Engineering"
      ),
    ]);