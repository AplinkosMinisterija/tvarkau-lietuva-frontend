// import 'package:api_client/api_client.dart';
// import 'package:data/providers/http_api_provider/api_provider.dart';
// import 'package:domain/report/report_library.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
//
// import '../common/custom_colors.dart';
// import '../common/custom_styles.dart';
// import '../common/extensions.dart';
// import '../widgets/base_admin_screen.dart';
// import '../widgets/base_dump_info.dart';
// import '../widgets/custom_button.dart';
// import '../widgets/custom_switch.dart';
// import '../widgets/custom_text_button.dart';
// import '../widgets/dump_tabs.dart';
// import '../widgets/header.dart';
// import '../widgets/image_preview.dart';
//
// class UpdatedReportScreen extends StatefulWidget {
//   const UpdatedReportScreen({
//     required this.reportId,
//     Key? key,
//   }) : super(key: key);
//
//   final String reportId;
//
//   @override
//   State<UpdatedReportScreen> createState() => _UpdatedReportScreenState();
// }
//
// class _UpdatedReportScreenState extends State<UpdatedReportScreen> {
//   Set<Marker> markers = {};
//
//   String refId = '1';
//
//   Future<void> setupMarker() async {
//     //final dump = mockReportModels.first;
//     final marker = Marker(
//         markerId: MarkerId(report.),
//         position: LatLng(
//           dump.reportLat,
//           dump.reportLong,
//         ),
//         icon: await BitmapDescriptor.fromAssetImage(
//             const ImageConfiguration(size: Size(50, 50)),
//             'assets/svg/pin_icon.svg'));
//     setState(() {
//       markers.add(marker);
//     });
//   }
//
//    late Future<FullReportDto> report;
//
//   @override
//   void initState() {
//     refId = getRefId(widget.reportId);
//     report = ApiProvider().getFullTrashReportById(refId);
//     setupMarker();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //final ReportModel dump = mockReportModels.first;
//     return FutureBuilder(
//         //future: ApiProvider().getFullTrashReportById(widget.reportId),
//         future: report,
//         builder: (BuildContext context, AsyncSnapshot<FullReportDto> snapshot) {
//           Widget child;
//           if (snapshot.hasData) {
//             child = Scaffold(body: LayoutBuilder(
//               builder: (context, constraints) {
//                 const minHeight = 250;
//                 final height = constraints.maxHeight * .25 > minHeight
//                     ? constraints.maxHeight * .25
//                     : minHeight;
//                 return BaseAdminScreen(
//                   child: Center(
//                     child: Container(
//                       constraints: const BoxConstraints(
//                         maxWidth: 1300,
//                       ),
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 10),
//                       child: Column(
//                         children: [
//                           42.heightBox,
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: CustomTextButton(
//                               onPressed: () {
//                                 context.pop();
//                               },
//                               text: 'Grįžti atgal',
//                               icon: Icons.arrow_back,
//                             ),
//                           ),
//                           17.heightBox,
//                           Row(
//                             children: [
//                               Text(dump.id, style: CustomStyles.h2),
//                               16.widthBox,
//                               CustomSwitch(
//                                 value: dump.isVisible ?? false,
//                                 onChanged: (value) {
//                                   //TODO Add logic
//                                 },
//                               ),
//                               8.widthBox,
//                               Text(
//                                 'Pranešimas ${(dump.isVisible ?? false) ? '' : 'ne'}rodomas',
//                                 style: CustomStyles.body2.copyWith(
//                                   color: CustomColors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           48.heightBox,
//                           Builder(builder: (context) {
//                             final width = MediaQuery.of(context).size.width;
//                             if (width < 700) {
//                               return _BuildMobileLayout(
//                                 dump: dump,
//                                 markers: markers,
//                                 height: height.toDouble(),
//                               );
//                             } else if (width < 1000) {
//                               return _BuildTabletLayout(
//                                 dump: dump,
//                                 markers: markers,
//                                 height: height.toDouble(),
//                               );
//                             } else {
//                               return _BuildDesktopLayout(
//                                 dump: dump,
//                                 markers: markers,
//                                 height: height.toDouble(),
//                               );
//                             }
//                           })
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ));
//           } else if (snapshot.hasError) {
//             child = Row(children: <Widget>[
//               const Icon(
//                 Icons.error_outline,
//                 color: Colors.red,
//                 size: 60,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 16),
//                 child: Text('Error: ${snapshot.error}'),
//               ),
//             ]);
//           } else {
//             child = Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   SizedBox(
//                     height: 250,
//                     width: 250,
//                     child: Center(
//                       child: LoadingAnimationWidget.staggeredDotsWave(
//                           color: const Color.fromRGBO(57, 97, 84, 1),
//                           size: 150),
//                     ),
//                   ),
//                 ]);
//           }
//           return Center(
//             child: child,
//           );
//         });
//
//     // return Scaffold(
//     //   body: LayoutBuilder(
//     //     builder: (context, constraints) {
//     //       const minHeight = 250;
//     //       final height = constraints.maxHeight * .25 > minHeight
//     //           ? constraints.maxHeight * .25
//     //           : minHeight;
//     //       return BaseAdminScreen(
//     //         child: Center(
//     //           child: Container(
//     //             constraints: const BoxConstraints(
//     //               maxWidth: 1300,
//     //             ),
//     //             padding:
//     //                 const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//     //             child: Column(
//     //               children: [
//     //                 42.heightBox,
//     //                 Align(
//     //                   alignment: Alignment.centerLeft,
//     //                   child: CustomTextButton(
//     //                     onPressed: () {
//     //                       context.pop();
//     //                     },
//     //                     text: 'Grįžti atgal',
//     //                     icon: Icons.arrow_back,
//     //                   ),
//     //                 ),
//     //                 17.heightBox,
//     //                 Row(
//     //                   children: [
//     //                     Text(dump.id, style: CustomStyles.h2),
//     //                     16.widthBox,
//     //                     CustomSwitch(
//     //                       value: dump.isVisible ?? false,
//     //                       onChanged: (value) {
//     //                         //TODO Add logic
//     //                       },
//     //                     ),
//     //                     8.widthBox,
//     //                     Text(
//     //                       'Pranešimas ${(dump.isVisible ?? false) ? '' : 'ne'}rodomas',
//     //                       style: CustomStyles.body2.copyWith(
//     //                         color: CustomColors.white,
//     //                       ),
//     //                     ),
//     //                   ],
//     //                 ),
//     //                 48.heightBox,
//     //                 Builder(builder: (context) {
//     //                   final width = MediaQuery.of(context).size.width;
//     //                   if (width < 700) {
//     //                     return _BuildMobileLayout(
//     //                       dump: dump,
//     //                       markers: markers,
//     //                       height: height.toDouble(),
//     //                     );
//     //                   } else if (width < 1000) {
//     //                     return _BuildTabletLayout(
//     //                       dump: dump,
//     //                       markers: markers,
//     //                       height: height.toDouble(),
//     //                     );
//     //                   } else {
//     //                     return _BuildDesktopLayout(
//     //                       dump: dump,
//     //                       markers: markers,
//     //                       height: height.toDouble(),
//     //                     );
//     //                   }
//     //                 })
//     //               ],
//     //             ),
//     //           ),
//     //         ),
//     //       );
//     //     },
//     //   ),
//     // );
//   }
// }
//
// String getRefId(String query) {
//   var trimmedQuery = query.replaceAll('TLP-A', '');
//   var formattedQuery = trimmedQuery.substring(
//       trimmedQuery.indexOf(RegExp(r'[1-9]')), trimmedQuery.length);
//   return formattedQuery;
// }
//
// class _BuildImages extends StatelessWidget {
//   const _BuildImages({
//     required this.imageUrls,
//   });
//
//   final List<String> imageUrls;
//
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 16,
//       runSpacing: 16,
//       alignment: WrapAlignment.start,
//       children: [
//         ...imageUrls.map((e) {
//           return GestureDetector(
//             onTap: () {
//               Navigator.of(context).push(
//                 PageRouteBuilder(
//                   opaque: false,
//                   pageBuilder: (_, __, ___) => ImagePreview(imageUrl: e),
//                 ),
//               );
//             },
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: SizedBox(
//                 width: 100,
//                 height: 100,
//                 child: Image.network(
//                   e,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           );
//         })
//       ],
//     );
//   }
// }
//
// class _BuildMap extends StatelessWidget {
//   const _BuildMap({
//     required this.height,
//     required this.markers,
//     required this.initialTarget,
//   });
//
//   final double height;
//   final Set<Marker> markers;
//   final LatLng initialTarget;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: height.toDouble(),
//       child: GoogleMap(
//         mapType: MapType.none,
//         markers: markers,
//         initialCameraPosition: CameraPosition(
//           target: initialTarget,
//           zoom: 13,
//         ),
//       ),
//     );
//   }
// }
//
// class _BuildMobileLayout extends StatelessWidget {
//   const _BuildMobileLayout(
//       {required this.dump, required this.markers, required this.height});
//
//   final ReportModel dump;
//   final Set<Marker> markers;
//   final double height;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             BaseTrashInfo(
//               dump: dump,
//             ),
//             16.heightBox,
//             _BuildMap(
//               height: height.toDouble(),
//               markers: markers,
//               initialTarget: LatLng(
//                 dump.reportLat,
//                 dump.reportLong,
//               ),
//             ),
//             32.heightBox,
//             if (dump.comment != null)
//               Text(
//                 dump.comment!,
//                 style: CustomStyles.body1,
//               ),
//             if (dump.imageUrls != null && dump.imageUrls!.isNotEmpty) ...[
//               15.heightBox,
//               _BuildImages(
//                 imageUrls: dump.imageUrls!,
//               )
//             ],
//           ],
//         ),
//         40.heightBox,
//         TrashTabs(
//           dump: dump,
//         ),
//         24.heightBox,
//         CustomButton(
//             text: 'Trinti pranešimą',
//             buttonType: ButtonType.outlined,
//             color: CustomColors.red,
//             onPressed: () {
//               //TODO Add logic
//             }),
//       ],
//     );
//   }
// }
//
// class _BuildTabletLayout extends StatelessWidget {
//   const _BuildTabletLayout(
//       {required this.dump, required this.markers, required this.height});
//
//   final ReportModel dump;
//   final Set<Marker> markers;
//   final double height;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             BaseTrashInfo(
//               dump: dump,
//             ),
//             16.heightBox,
//             _BuildMap(
//               height: height.toDouble(),
//               markers: markers,
//               initialTarget: LatLng(
//                 dump.reportLat,
//                 dump.reportLong,
//               ),
//             ),
//             32.heightBox,
//           ],
//         ),
//         40.heightBox,
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   if (dump.comment != null)
//                     Text(
//                       dump.comment!,
//                       style: CustomStyles.body1,
//                     ),
//                   if (dump.imageUrls != null && dump.imageUrls!.isNotEmpty) ...[
//                     15.heightBox,
//                     _BuildImages(
//                       imageUrls: dump.imageUrls!,
//                     )
//                   ],
//                 ],
//               ),
//             ),
//             8.widthBox,
//             TrashTabs(
//               dump: dump,
//             ),
//           ],
//         ),
//         24.heightBox,
//         CustomButton(
//             text: 'Trinti pranešimą',
//             buttonType: ButtonType.outlined,
//             color: CustomColors.red,
//             onPressed: () {
//               //TODO Add logic
//             }),
//       ],
//     );
//   }
// }
//
// class _BuildDesktopLayout extends StatelessWidget {
//   const _BuildDesktopLayout(
//       {required this.dump, required this.markers, required this.height});
//
//   final ReportModel dump;
//   final Set<Marker> markers;
//   final double height;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               BaseTrashInfo(
//                 dump: dump,
//               ),
//               16.heightBox,
//               _BuildMap(
//                 height: height.toDouble(),
//                 markers: markers,
//                 initialTarget: LatLng(
//                   dump.reportLat,
//                   dump.reportLong,
//                 ),
//               ),
//               32.heightBox,
//               if (dump.comment != null)
//                 Text(
//                   dump.comment!,
//                   style: CustomStyles.body1,
//                 ),
//               if (dump.imageUrls != null && dump.imageUrls!.isNotEmpty) ...[
//                 15.heightBox,
//                 _BuildImages(
//                   imageUrls: dump.imageUrls!,
//                 )
//               ],
//               24.heightBox,
//               CustomButton(
//                   text: 'Trinti pranešimą',
//                   buttonType: ButtonType.outlined,
//                   color: CustomColors.red,
//                   onPressed: () {
//                     //TODO Add logic
//                   }),
//             ],
//           ),
//         ),
//         40.widthBox,
//         TrashTabs(
//           dump: dump,
//         ),
//       ],
//     );
//   }
// }
