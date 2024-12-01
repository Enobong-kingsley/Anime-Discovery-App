// import 'package:flutter/material.dart';

// import '../../../anime_model.dart';
// import '../../../core/configs/assets/app_images.dart';
// import '../../../core/configs/theme/app_colors.dart';
// import '../../../graphql_service.dart';

// class TestScreen extends StatefulWidget {
//   const TestScreen({super.key});

//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }

// class _TestScreenState extends State<TestScreen> {
//   List<AnimeModel>? _anims;
//   GraphQlService _graphQlService = GraphQlService();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _load();
//   }

//   void _load() async {
//     _anims = null;
//     //_anims = await _graphQlService.getAnimes(episodes: 1);
//     setState(() {});
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: SafeArea(
//           child: _anims == null
//               ? const Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : _anims!.isEmpty
//                   ? const Center(
//                       child: Text("There are no anime to display"),
//                     )
//                   : ListView.builder(
//                       itemCount: _anims!.length,
//                       itemBuilder: (context, index) => ListTile(
//                         leading: Icon(Icons.movie),
//                         title: Text("Title : ${_anims![index].englishTitle}"),
//                         subtitle:
//                             Text("Description : ${_anims![index].description}"),
//                       ),
//                     )),
//     );
//   }
// }
