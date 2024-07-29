// import 'package:api_client/api_client.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/material.dart';
// import 'package:core_ui/core_ui.dart';
// import 'dart:typed_data';
// import 'package:core/core.dart';
// import '../widgets/data_security_terms_widget.dart';
// import '../widgets/explanation_dialog_widget.dart';
// import 'add_pin_screen_mobile.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//
// class TrashAddingScreenMobile extends StatefulWidget {
//   const TrashAddingScreenMobile({
//     required this.width,
//     required this.height,
//     required this.reports,
//     required this.onAddTap,
//     required this.onDataSecurityTap,
//     super.key,
//   });
//
//   final double width;
//   final double height;
//   final List<PublicReportDto> reports;
//   final Function(String, String, double, double, List<Uint8List>) onAddTap;
//   final VoidCallback onDataSecurityTap;
//
//   @override
//   State<TrashAddingScreenMobile> createState() =>
//       _TrashAddingScreenMobileState();
// }
//
// class _TrashAddingScreenMobileState extends State<TrashAddingScreenMobile> {
//   List<Uint8List> _selectedImages = [];
//
//   Future<void> getMultipleImageInfos() async {
//     final images = await AppImagePicker().pickMultipleImages();
//
//     setState(() {
//       _selectedImages = (_selectedImages + images)
//           .take(GlobalConstants.maxAllowedImageCount)
//           .toList();
//       calculateImagesSize();
//     });
//   }
//
//   bool isTermsAccepted = false;
//   bool isImagesSizeValid = true;
//
//   final _formKey = GlobalKey<FormState>();
//   String currentTextValue = '';
//   String currentEmailValue = '';
//   double selectedLat = 0;
//   double selectedLong = 0;
//
//
//   @override
//   void initState() {
//
//     super.initState();
//   }
//
//   void calculateImagesSize() {
//     var imageSizes = 0;
//     for (var element in _selectedImages) {
//       imageSizes += element.lengthInBytes;
//     }
//     if (imageSizes > GlobalConstants.maxAllowedImageSizeInBytes) {
//       isImagesSizeValid = false;
//     } else {
//       isImagesSizeValid = true;
//     }
//   }
//
//   void removeSelectedImage(int imageIndex) {
//     setState(() {
//       _selectedImages.removeAt(imageIndex);
//       calculateImagesSize();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Title(
//       title: "Pranešti apie pažeidimą",
//       color: const Color.fromRGBO(28, 63, 58, 1),
//       child: Scaffold(
//         backgroundColor: const Color.fromRGBO(250, 242, 234, 1),
//         body: LayoutBuilder(
//           builder: (BuildContext context, BoxConstraints constraints) {
//             return Form(
//                 key: _formKey,
//                 child: ListView(
//                     padding: EdgeInsets.all(widget.width * 0.0555),
//                     children: <Widget>[
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Pranešti apie pažeidimą',
//                             style: GoogleFonts.roboto(
//                               fontSize: widget.width * 0.04444,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               context.goNamed("home");
//                             },
//                             child: Icon(
//                               Icons.close,
//                               size: widget.width * 0.0533,
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(height: widget.width * 0.0111),
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: InkWell(
//                           onTap: () {
//                             showDialog(
//                                 context: context,
//                                 barrierColor: Colors.white.withOpacity(0),
//                                 builder: (context) {
//                                   return ExplanationDialogWidget(
//                                     width: widget.width,
//                                     category: 'trash',
//                                     isMobile: true,
//                                   );
//                                 });
//                           },
//                           onHover: (isHover) {},
//                           child: Text(
//                             'Kaip naudotis?',
//                             style: GoogleFonts.roboto(
//                               decoration: TextDecoration.underline,
//                               fontSize: widget.width * 0.03888,
//                               fontWeight: FontWeight.w400,
//                               color: const Color.fromRGBO(0, 0, 199, 1.0),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: widget.width * 0.0444),
//                       AddingMapRedirectWindow(
//                         width: widget.width,
//                         marker: newMarker,
//                         onTap: () {
//
//
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => AddPinScreenMobile(
//                                       width: widget.width,
//                                       markers: markers,
//                                       isLayerSwitchVisible: true,
//                                       isPermitSwitchVisible: false,
//                                       onTap: (lat, long, marker) {
//                                         setState(() {
//                                           newMarker.clear();
//                                           selectedLat = lat;
//                                           selectedLong = long;
//                                           newMarker.add(marker);
//                                         });
//                                       },
//                                     )),
//                           );
//                         },
//                       ),
//                       SizedBox(height: widget.width * 0.05),
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           'Pranešimo turinys',
//                           style: GoogleFonts.roboto(
//                               fontSize: widget.width * 0.03888,
//                               fontWeight: FontWeight.w400),
//                         ),
//                       ),
//                       SizedBox(height: widget.width * 0.0138),
//                       Container(
//                         width: widget.width * 0.911,
//                         height: widget.width * 0.333,
//                         padding: EdgeInsets.symmetric(
//                           horizontal: widget.width * 0.033,
//                         ),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(4)),
//                         child: Center(
//                           child: TextFormField(
//                             maxLines: 10,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Prašome įvesti pranešimo turinį';
//                               }
//                               return null;
//                             },
//                             onChanged: (textValue) {
//                               setState(() {
//                                 currentTextValue = textValue;
//                               });
//                             },
//                             style: GoogleFonts.roboto(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: widget.width * 0.03333,
//                                 color: Colors.black),
//                             decoration: const InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderSide: BorderSide.none,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: widget.width * 0.0444),
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           'Jūsų el. paštas',
//                           style: GoogleFonts.roboto(
//                               fontSize: widget.width * 0.03888,
//                               fontWeight: FontWeight.w400),
//                         ),
//                       ),
//                       SizedBox(height: widget.width * 0.0111),
//                       Container(
//                         width: widget.width * 0.911,
//                         height: widget.width * 0.111,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(4)),
//                         padding: EdgeInsets.symmetric(
//                           horizontal: widget.width * 0.033,
//                         ),
//                         child: Center(
//                           child: TextFormField(
//                             maxLines: 1,
//                             textAlignVertical: TextAlignVertical.center,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Prašome įvesti el. pašto adresą';
//                               } else if (RegExp(
//                                       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
//                                   .hasMatch(value)) {
//                                 return null;
//                               } else {
//                                 return 'Prašome įvesti teisingą el. pašto adresą';
//                               }
//                             },
//                             onChanged: (emailValue) {
//                               setState(() {
//                                 currentEmailValue = emailValue;
//                               });
//                             },
//                             style: GoogleFonts.roboto(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: widget.width * 0.03333,
//                                 color: Colors.black),
//                             decoration: const InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderSide: BorderSide.none,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: widget.width * 0.0444),
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           'Įkelkite bent 2 pažeidimo nuotraukas',
//                           style: GoogleFonts.roboto(
//                               fontSize: widget.width * 0.03888,
//                               fontWeight: FontWeight.w400),
//                         ),
//                       ),
//                       SizedBox(height: widget.width * 0.0111),
//                       ImageAddButton(
//                         width: widget.width,
//                         title: _selectedImages.isNotEmpty
//                             ? 'Įkelti kitas nuotraukas'
//                             : 'Įkelti nuotraukas',
//                         onTap: () {
//                           getMultipleImageInfos();
//                         },
//                         isMobile: true,
//                       ),
//                       SizedBox(height: widget.width * 0.0133),
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           'Maksimalus nuotraukų kiekis: 4',
//                           style: GoogleFonts.roboto(
//                               fontSize: widget.width * 0.03333,
//                               fontWeight: FontWeight.w400),
//                         ),
//                       ),
//                       SizedBox(
//                         height: widget.width * 0.05,
//                         width: widget.width * 0.911,
//                         child: TextFormField(
//                           enabled: true,
//                           maxLines: 1,
//                           readOnly: true,
//                           decoration: const InputDecoration(
//                             border: InputBorder.none,
//                           ),
//                           textAlignVertical: TextAlignVertical.top,
//                           validator: (value) {
//                             if (_selectedImages.isEmpty) {
//                               return 'Prašome įkelti bent 2 nuotraukas';
//                             } else {
//                               if (_selectedImages.length < 2) {
//                                 return 'Prašome įkelti bent 2 nuotraukas';
//                               } else {
//                                 return null;
//                               }
//                             }
//                           },
//                         ),
//                       ),
//                       _selectedImages.isNotEmpty
//                           ? SizedBox(
//                               width: widget.width * 0.9111,
//                               height: _selectedImages.length > 2
//                                   ? widget.width * 0.9111
//                                   : widget.width * 0.4555,
//                               child: AlignedGridView.count(
//                                 crossAxisCount: 2,
//                                 mainAxisSpacing: 8,
//                                 crossAxisSpacing: 8,
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 itemBuilder: (context, index) {
//                                   return ImageGallery().buildPickerImage(
//                                       image: _selectedImages[index],
//                                       context: context,
//                                       width: widget.width * 2.4,
//                                       onRemoveTap: () {
//                                         removeSelectedImage(index);
//                                       });
//                                 },
//                                 itemCount: _selectedImages.length,
//                               ),
//                             )
//                           : const SizedBox.shrink(),
//                       !isImagesSizeValid
//                           ? Text(
//                               'Maksimalus nuotraukų dydis 20 MB',
//                               style: TextStyle(
//                                 color: const Color(0xFFe53935),
//                                 fontSize: widget.width * 0.03,
//                               ),
//                             )
//                           : const SizedBox.shrink(),
//                       SizedBox(height: widget.width * 0.03333),
//                       DataSecurityTermsButton(
//                         onTap: (value) {
//                           setState(() {
//                             isTermsAccepted = value!;
//                           });
//                         },
//                         width: widget.width,
//                         isTermsAccepted: isTermsAccepted,
//                       ),
//                       SizedBox(
//                         height: widget.width * 0.03,
//                         child: TextFormField(
//                           enabled: true,
//                           maxLines: 1,
//                           readOnly: true,
//                           initialValue: " ",
//                           decoration: const InputDecoration(
//                             border: InputBorder.none,
//                           ),
//                           textAlignVertical: TextAlignVertical.top,
//                           validator: (value) {
//                             if (!isTermsAccepted) {
//                               return 'Privaloma sutikti';
//                             } else {
//                               return null;
//                             }
//                           },
//                         ),
//                       ),
//                       SizedBox(height: widget.width * 0.0488),
//                       MarkButtonMobile(
//                         isActive: true,
//                         width: widget.width,
//                         onTap: () async {
//                           if (_formKey.currentState!.validate() &&
//                               selectedLat != 0 &&
//                               selectedLong != 0 &&
//                               isTermsAccepted &&
//                               _selectedImages.isNotEmpty &&
//                               isImagesSizeValid) {
//                             if (_selectedImages.length >= 2) {
//                               widget.onAddTap(
//                                 currentEmailValue,
//                                 currentTextValue,
//                                 selectedLat,
//                                 selectedLong,
//                                 _selectedImages,
//                               );
//                             }
//                           }
//                         },
//                       ),
//                     ]));
//           },
//         ),
//       ),
//     );
//   }
// }
