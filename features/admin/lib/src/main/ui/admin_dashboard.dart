import 'package:admin/src/dumps/ui/dump_window.dart';
import 'package:admin/src/trash/ui/trash_window.dart';
import 'package:admin/src/deleted/ui/removed_window.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:openid_client/openid_client.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({
    required this.onLogout,
    required this.userInfo,
    super.key,
  });

  final VoidCallback onLogout;
  final UserInfo userInfo;

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  late bool isMapHover;
  bool isDeletedHover = false;
  bool isDeletedActive = false;
  String activeCategory = 'reports';
  String activeView = 'chart';
  String name = '';
  String email = '';

  @override
  void initState() {
    isMapHover = false;
    var userInfo = UserInfo.fromJson(widget.userInfo.toJson());
    name = userInfo['displayName'];
    email = userInfo['mail'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          physics: isMapHover ? const NeverScrollableScrollPhysics() : null,
          child: Stack(
            children: <Widget>[
              BackgroundWidget(width: constraints.maxWidth),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth * 0.0875,
                  vertical: constraints.maxWidth * 0.0083,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DepartmentLogo(
                          width: constraints.maxWidth,
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                widget.onLogout();
                              },
                              child: Container(
                                  height: constraints.maxWidth * 0.03,
                                  width: constraints.maxWidth * 0.15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Atsijungti',
                                      style: GoogleFonts.roboto(
                                        fontSize: constraints.maxWidth * 0.02,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: constraints.maxWidth * 0.01,
                            ),
                            Text(
                              name,
                              style: GoogleFonts.roboto(
                                  fontSize: constraints.maxWidth * 0.01,
                                  color: Colors.white),
                            ),
                            Text(
                              email,
                              style: GoogleFonts.roboto(
                                  fontSize: constraints.maxWidth * 0.01,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: constraints.maxWidth * 0.028,
                    ),
                    Text(
                      'Administracinė konsolė',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 25),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onHover: (isHover) {
                          setState(() {
                            isDeletedHover = isHover;
                          });
                        },
                        onTap: () {
                          setState(() {
                            isDeletedActive = !isDeletedActive;
                            if (isDeletedActive) {
                              activeCategory = 'deleted';
                            } else {
                              activeCategory = 'reports';
                            }
                          });
                        },
                        child: Container(
                          height: constraints.maxWidth * 0.05,
                          width: constraints.maxWidth * 0.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: isDeletedHover
                                    ? Colors.white.withOpacity(0.3)
                                    : Colors.transparent,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            color: activeCategory == 'deleted'
                                ? const Color.fromRGBO(199, 105, 44, 1.0)
                                : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Rodyti\ništrintus pranešimus',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                  fontSize: constraints.maxWidth * 0.015,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxWidth * 0.028,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          children: [
                            Text("Pasirinkite norimą kategoriją",
                                style:
                                    GoogleFonts.poppins(color: Colors.white)),
                            CategoryTypeSwitcher(
                                width: constraints.maxWidth,
                                activeCategory: activeCategory,
                                onCategoryTypeChange: (String category) {
                                  setState(() {
                                    activeCategory = category;
                                  });
                                })
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, right: 75),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: AdminViewTypeSwitcher(
                              width: constraints.maxWidth / 1.5,
                              activeView: activeView,
                              onViewTypeChange: (String view) {
                                setState(() {
                                  activeView = view;
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    activeCategory == 'reports'
                        ? TrashWindow(
                            screenWidth: constraints.maxWidth,
                            viewType: activeView,
                            isHovering: (isHover) {
                              setState(() {
                                isMapHover = isHover;
                              });
                            },
                            activeEmail: email,
                          )
                        : const SizedBox.shrink(),
                    activeCategory == 'dumps'
                        ? DumpWindow(screenWidth: constraints.maxWidth)
                        : const SizedBox.shrink(),
                    activeCategory == 'deleted'
                        ? SizedBox(
                            width: constraints.maxWidth * 0.725,
                            height: constraints.maxWidth * 0.28,
                            child: RemovedWindow(
                              screenWidth: constraints.maxWidth,
                              viewType: activeView,
                              isHovering: (isHover) {
                                setState(() {
                                  isMapHover = isHover;
                                });
                              },
                              activeEmail: email,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
