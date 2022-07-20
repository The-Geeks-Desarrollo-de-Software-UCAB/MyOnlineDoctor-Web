//EN DESARROLLO


// import 'package:flutter/material.dart';
// import 'package:myonlinedoctorweb/pages/Dashboard.dart/dashboard.dart';
// import 'package:myonlinedoctorweb/widgets/custom_text.dart';

// import '../../Modules/cita.dart';
// import '../../constants/screen_size.dart';
// import '../../controllers/get_appoiments.dart';

// class MyWidget extends StatefulWidget {
//   const MyWidget({Key? key}) : super(key: key);

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   //final width = ScreenSize.screenSize(context);
//   final GetAppoimentMock test = GetAppoimentMock();
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//         child: Column(
//       children: [
//         Container(
//             padding: const EdgeInsets.only(right: 195, left: 195, top: 30),
//             child: const CustomText(
//               text: 'Citas del Dia',
//               size: 30,
//               weight: FontWeight.bold,
//               color: Colors.white,
//             )),
//         Expanded(
//             child: FutureBuilder(
//                 future: test.getAppoiment(),
//                 builder: (BuildContext context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else {
//                     print(snapshot.data);

//                     return listToDayAppoimentCard(
//                         context, snapshot.data as List<Cita>, width);
//                   }
//                 }))
//       ],
//     ));
//   }
// }
