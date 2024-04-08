// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:rolla_task/resources.dart';
// import 'package:rolla_task/routing/app_router.gr.dart';
//
// class CustomAppBar extends PreferredSize {
//   final String? title;
//   final String? userAvatar;
//
//   CustomAppBar({
//     super.key,
//     this.title,
//     this.userAvatar,
//     required super.preferredSize,
//     required super.child,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       automaticallyImplyLeading: false,
//       backgroundColor: AppColor.neutral1,
//       title: Text(
//         '$title',
//         style: const TextStyle(color: Colors.white),
//       ),
//       actions: [
//         // ovde
//         userAvatar == null
//             ? Padding(
//                 padding: const EdgeInsets.only(right: 8),
//                 child: IconButton(
//                   icon: const Icon(Icons.account_circle),
//                   color: Colors.white,
//                   onPressed: () => (),
//                 ),
//               )
//             : ElevatedButton(
//                 onPressed: () => (
//                   // context.router.push(
//                   //   // UserDetailsPage(),
//                   // ),
//                 ),
//                 child: const CircleAvatar(
//                   backgroundImage: NetworkImage(
//                       'https://robohash.org/Jeanne.png?set=set4'), // ! wrapper fix it
//                   backgroundColor: AppColor.white,
//                 ),
//               )
//       ],
//     );
//   }
// }
