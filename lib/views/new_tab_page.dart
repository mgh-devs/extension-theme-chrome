import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_tab_chrome/controller/extension_controller.dart';
import 'package:new_tab_chrome/core/services/hive_service.dart';
import 'package:new_tab_chrome/core/utils/colors.dart';
import 'package:new_tab_chrome/core/widgets/pkg/calender/src/extensions/string.dart';
import 'package:new_tab_chrome/models/response_todo_list_model.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../core/widgets/pkg/calender/src/table_calendar_jalali.dart';

class NewTabPage extends GetResponsiveView<ExtensionController> {
  @override
  Widget? desktop() {
    // TODO: implement desktop
    return Scaffold(
      backgroundColor: background,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          controller.isExpanded.value = false;
        },
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 50, right: 15, top: 60, bottom: 10),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: cardBox,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "TODO List",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  Obx(() => MouseRegion(
                                        onEnter: (_) => controller
                                            .isHoveredButton.value = true,
                                        onExit: (_) => controller
                                            .isHoveredButton.value = false,
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.isVisiblyToDoList.value =
                                                !controller
                                                    .isVisiblyToDoList.value;
                                          },
                                          child: Stack(
                                            children: [
                                              AnimatedContainer(
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                width: controller
                                                        .isHoveredButton.value
                                                    ? 100
                                                    : 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: buttonColor,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              Positioned(
                                                right: 0,
                                                child: AnimatedContainer(
                                                  duration: const Duration(
                                                      milliseconds: 200),
                                                  width: controller
                                                          .isHoveredButton.value
                                                      ? 250
                                                      : 40,
                                                  height: 40,
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Stack(
                                                    alignment: controller
                                                            .isHoveredButton
                                                            .value
                                                        ? Alignment.centerRight
                                                        : Alignment.center,
                                                    children: [
                                                      AnimatedOpacity(
                                                        duration:
                                                            const Duration(
                                                          milliseconds: 200,
                                                        ),
                                                        curve: Curves.easeIn,
                                                        opacity: controller
                                                                .isHoveredButton
                                                                .value
                                                            ? 1.0
                                                            : 0.0,
                                                        child: Padding(
                                                          padding: EdgeInsets.symmetric(
                                                              horizontal: controller
                                                                      .isHoveredButton
                                                                      .value
                                                                  ? 45
                                                                  : 0),
                                                          child: const Text(
                                                            "show it",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        color: buttonColor,
                                                        child: const Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          child: Icon(
                                                            Icons
                                                                .remove_red_eye,
                                                            color: Colors.white,
                                                            size: 20,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Divider(
                                        color: divider,
                                      ),
                                      Expanded(
                                        child: Obx(() {
                                          return ListView.builder(
                                            itemCount: controller.tasks.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Obx(() {
                                                  return MouseRegion(
                                                    onEnter: (_) {
                                                      controller
                                                          .isHoveredToDoBox
                                                          .value = true;
                                                      controller
                                                              .isHoveredToDoBoxIndex =
                                                          index;
                                                    },
                                                    onExit: (_) {
                                                      controller
                                                          .isHoveredToDoBox
                                                          .value = false;
                                                      controller
                                                          .isHoveredToDoBoxIndex = -1;
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: card),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 10,
                                                                    left: 10,
                                                                    right: 10),
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                  width: 15,
                                                                  height: 15,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: controller
                                                                        .tasks[index]
                                                                        .color.withOpacity(0.2),
                                                                    border: Border.all(
                                                                        color: controller
                                                                            .tasks[index]
                                                                            .color),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  controller
                                                                      .tasks[
                                                                          index]
                                                                      .title,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          16),
                                                                ),
                                                                const Spacer(),
                                                                Visibility(
                                                                  visible: controller
                                                                          .isHoveredToDoBox
                                                                          .value &&
                                                                      controller
                                                                              .isHoveredToDoBoxIndex ==
                                                                          index,
                                                                  child: Row(
                                                                    children: [
                                                                      MouseRegion(
                                                                        onEnter: (_) => controller
                                                                            .isHoveredEditBtn
                                                                            .value = true,
                                                                        onExit: (_) => controller
                                                                            .isHoveredEditBtn
                                                                            .value = false,
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              20,
                                                                          height:
                                                                              20,
                                                                          margin: const EdgeInsets
                                                                              .symmetric(
                                                                              vertical: 5),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                card,
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                          ),
                                                                          child:
                                                                              Icon(
                                                                            Icons.edit_outlined,
                                                                            color: controller.isHoveredEditBtn.value
                                                                                ? buttonColor
                                                                                : icyColor,
                                                                            size:
                                                                                15,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      MouseRegion(
                                                                        onEnter: (_) => controller
                                                                            .isHoveredDeleteBtn
                                                                            .value = true,
                                                                        onExit: (_) => controller
                                                                            .isHoveredDeleteBtn
                                                                            .value = false,
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              20,
                                                                          height:
                                                                              20,
                                                                          margin: const EdgeInsets
                                                                              .symmetric(
                                                                              vertical: 5),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                card,
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                          ),
                                                                          child:
                                                                              Icon(
                                                                            Icons.delete_outline,
                                                                            color: controller.isHoveredDeleteBtn.value
                                                                                ? Colors.red
                                                                                : icyColor,
                                                                            size:
                                                                                15,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        10),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                if (controller
                                                                    .selectedShowDescription
                                                                    .contains(
                                                                        index)) {
                                                                  controller
                                                                      .selectedShowDescription
                                                                      .remove(
                                                                          index);
                                                                } else {
                                                                  controller
                                                                      .selectedShowDescription
                                                                      .add(
                                                                          index);
                                                                }
                                                              },
                                                              child: Container(
                                                                width: 20,
                                                                height: 20,
                                                                margin: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        5),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: card,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                child: Icon(
                                                                  Icons
                                                                      .dataset_outlined,
                                                                  color:
                                                                      buttonColor,
                                                                  size: 15,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Obx(
                                                             () {
                                                              return Visibility(
                                                                visible:controller.selectedShowDescription.contains(index),
                                                                child: Container(
                                                                  width:
                                                                      screen.width,
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(8),
                                                                  decoration: BoxDecoration(
                                                                      color: card,
                                                                      borderRadius: const BorderRadius
                                                                          .only(
                                                                          bottomLeft:
                                                                              Radius.circular(
                                                                                  9),
                                                                          bottomRight:
                                                                              Radius.circular(
                                                                                  9))),
                                                                  child: Column(
                                                                    children: [
                                                                      Text(
                                                                        controller
                                                                            .tasks[
                                                                                index]
                                                                            .description,
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontSize:
                                                                                12),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          );
                                        }),
                                      ),
                                      Divider(
                                        color: divider,
                                      ),
                                      GestureDetector(
                                        onTap: controller.toggle,
                                        // تغییر وضعیت هنگام کلیک
                                        child: Obx(
                                          () => AnimatedContainer(
                                            margin: const EdgeInsets.only(
                                                bottom: 8, right: 8, left: 8),
                                            duration: const Duration(
                                                milliseconds: 300),
                                            // زمان انیمیشن
                                            height: controller.isExpanded.value
                                                ? 130
                                                : 50,
                                            // تغییر ارتفاع هنگام کلیک
                                            decoration: BoxDecoration(
                                              border:
                                                  controller.isExpanded.value
                                                      ? null
                                                      : Border.all(color: card),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: controller.isExpanded.value
                                                  ? Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 4,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              border:
                                                                  Border.all(
                                                                      color:
                                                                          card),
                                                            ),
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Column(
                                                                  children: [
                                                                    TextField(
                                                                      controller: controller.titleTextEditingController,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        border:
                                                                            InputBorder.none,
                                                                        hintStyle: TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                blueGray.withOpacity(.5)),
                                                                        hintText:
                                                                            "Add a new task Title",
                                                                      ),
                                                                    ),
                                                                    TextField(
                                                                      controller: controller.descriptionTextEditingController,
                                                                      maxLines:
                                                                          2,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        border:
                                                                            InputBorder.none,
                                                                        hintStyle:
                                                                            TextStyle(fontSize: 10),
                                                                        hintText:
                                                                            "More details...",
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Colors
                                                                            .red,
                                                                        Colors
                                                                            .green,
                                                                        Colors
                                                                            .yellow
                                                                      ]
                                                                          .map(
                                                                            (color) =>
                                                                                Padding(
                                                                              padding: const EdgeInsets.symmetric(horizontal: 3),
                                                                              child: MouseRegion(
                                                                                cursor: SystemMouseCursors.click,
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    controller.selectedColor.value = color;
                                                                                  },
                                                                                  child: Obx(() {
                                                                                    return Container(
                                                                                      width: 10,
                                                                                      height: 10,
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(2),
                                                                                        color: controller.selectedColor.value == color ? color : color.withOpacity(0.3),
                                                                                      ),
                                                                                    );
                                                                                  }),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          )
                                                                          .toList(),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              HiveServices
                                                                  .addTask(
                                                                ToDoListModel(
                                                                  title: controller
                                                                      .titleTextEditingController
                                                                      .text,
                                                                  description:
                                                                      controller
                                                                          .descriptionTextEditingController
                                                                          .text,
                                                                  color: controller
                                                                      .selectedColor
                                                                      .value,
                                                                ),
                                                              );
                                                              controller
                                                                  .getAllTasks();
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    buttonColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              child: Center(
                                                                child: Icon(
                                                                  Icons.add,
                                                                  color:
                                                                      icyColor,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : Row(
                                                      children: [
                                                        Text(
                                                          "Add a new task",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color: icyColor,
                                                              fontSize: 14),
                                                        ),
                                                        const Spacer(),
                                                        Icon(
                                                          Icons.add,
                                                          color: icyColor,
                                                          size: 20,
                                                        ),
                                                      ],
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Obx(() {
                                    return Visibility(
                                      visible:
                                          controller.isVisiblyToDoList.value,
                                      child: Positioned.fill(
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 10, sigmaY: 10),
                                            child: Container(
                                              width: screen.width,
                                              decoration: const BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 10),
              child: SizedBox(
                width: screen.width / 2.3,
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: cardBox,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                          color: card,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 7, bottom: 7, left: 10, right: 10),
                              child: Container(
                                width: 60,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: buttonColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.getAllTasks();
                                  },
                                  child: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.mic,
                                color: Colors.white,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Icon(
                                Icons.camera,
                                color: Colors.white,
                              ),
                            ),
                            const Expanded(child: TextField()),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Icon(
                                Icons.local_activity_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Wrap(
                      children: [
                        "https://github.com/mgh-devs/extension-theme-chrome",
                        "https://github.com/mgh-de8vs/extension-theme-chrome",
                        "https://github.com/mgh-devs7/extension-theme-chrome",
                        "https://github.com/mgh-devs/e6xtension-theme-chrome",
                        "https://github.com/mgh-devs/ex5tension-theme-chrome",
                        "https://github.com/mgh-devs/exte4nsion-theme-chrome",
                        "https://github.com/mgh-devs/extensiron-theme-chrome",
                        "https://github.com/mgh-devs/extensi3on-theme-chrome",
                        "https://github.com/mgh-devs/extensiong-theme-chrome",
                        "https://github.com/mgh-devs/extension-ftheme-chrome",
                        "https://github.com/mgh-devs/extension-tdheme-chrome",
                        "https://github.com/mgh-devs/extension-thesme-chrome",
                      ]
                          .map(
                            (url) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Obx(
                                () => MouseRegion(
                                  onEnter: (_) {
                                    controller.isHoveredCustomLinkBtn.value =
                                        true;
                                    controller.isHoveredWhereCustomLinkBtn
                                        .value = url;
                                  },
                                  onExit: (_) {
                                    controller.isHoveredCustomLinkBtn.value =
                                        false;
                                    controller
                                        .isHoveredWhereCustomLinkBtn.value = '';
                                  },
                                  child: GestureDetector(
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: controller.isHoveredCustomLinkBtn
                                                    .value &&
                                                controller
                                                        .isHoveredWhereCustomLinkBtn
                                                        .value ==
                                                    url
                                            ? hoverCard
                                            : cardBox,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(
                                        Icons.add_rounded,
                                        color: icyColor,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 50, left: 15, top: 60),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: cardBox,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                        right:
                                            BorderSide(color: card, width: 1.5),
                                      )),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "15:18",
                                            style: TextStyle(
                                              color: blueLight,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 40,
                                            ),
                                          ),
                                          const SizedBox(height: 35),
                                          const Text(
                                            "Mar 28",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                          const Text(
                                            "2025",
                                            style: TextStyle(
                                              color: Colors.white54,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: Colors.transparent,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Image.asset(
                                                "assets/png/cloud.png",
                                                width: 50,
                                                height: 50,
                                              ),
                                              const Text(
                                                "16°",
                                                style: TextStyle(
                                                  color: Colors.white54,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          const Text(
                                            "Grab a juice! 🧃️",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              RichText(
                                                text: const TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "Min ",
                                                      style: TextStyle(
                                                        color: Colors.white60,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: "15° ",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              RichText(
                                                text: const TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "Min ",
                                                      style: TextStyle(
                                                        color: Colors.white60,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: "15° ",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          MouseRegion(
                                            cursor: SystemMouseCursors.click,
                                            child: Obx(() {
                                              return GestureDetector(
                                                onTap: () => controller
                                                        .isForecast.value =
                                                    !controller
                                                        .isForecast.value,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 12,
                                                          right: 12,
                                                          bottom: 4,
                                                          top: 2),
                                                  alignment: Alignment.center,
                                                  width: 75,
                                                  decoration: BoxDecoration(
                                                    color: controller
                                                            .isForecast.value
                                                        ? buttonColor
                                                        : Colors.transparent,
                                                    border: Border.all(
                                                        color: divider,
                                                        width: 1.5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      const Text(
                                                        "Forcast",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                      Icon(
                                                        controller
                                                                .isForecast.value
                                                            ? Icons
                                                                .keyboard_arrow_up_rounded
                                                            : Icons
                                                                .keyboard_arrow_down_rounded,
                                                        color: Colors.white,
                                                        size: 12,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: Obx(
                              () => controller.isForecast.value
                                  ? Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(
                                              color: card, width: 1.5),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          '',
                                          '',
                                          '',
                                          '',
                                          '',
                                        ]
                                            .map(
                                              (weather) => Container(
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  color: card,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    const Text(
                                                      "Fri 29",
                                                      style: TextStyle(
                                                        color: Colors.white54,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 2.0),
                                                      child: Image.asset(
                                                        "assets/png/cloud.png",
                                                        width: 25,
                                                        height: 25,
                                                      ),
                                                    ),
                                                    const Text(
                                                      "22°",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 2,
                                                    ),
                                                    const Text(
                                                      "10°",
                                                      style: TextStyle(
                                                        color: Colors.white54,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(
                                              color: card, width: 1.5),
                                        ),
                                      ),
                                      child: Obx(() => controller
                                              .isGetEventDayLoading.value
                                          ? Center(
                                              child:
                                                  const CircularProgressIndicator())
                                          : ListView.builder(
                                              itemCount: controller
                                                      .responseEventDay
                                                      .events
                                                      .isNotEmpty
                                                  ? controller.responseEventDay
                                                      .events.length
                                                  : 0,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8,
                                                          right: 8,
                                                          bottom: 5,
                                                          top: 3),
                                                  child: Directionality(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    child: RichText(
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  'vazir'),
                                                          text: controller
                                                                  .responseEventDay
                                                                  .events[index]
                                                                  .description ??
                                                              "",
                                                        ),
                                                        TextSpan(
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .red.shade700,
                                                              fontFamily:
                                                                  'vazir'),
                                                          text: controller
                                                                  .responseEventDay
                                                                  .events[index]
                                                                  .isHoliday!
                                                              ? "(تعطیل)"
                                                              : "",
                                                        ),
                                                      ]),
                                                    ),
                                                  ),
                                                  // child: Text(
                                                  //   controller
                                                  //           .responseEventDay
                                                  //           .events[index]
                                                  //           .description ??
                                                  //       "",
                                                  //   textAlign: TextAlign.right,
                                                  //   style: const TextStyle(
                                                  //     color: Colors.white,
                                                  //   ),
                                                  // ),
                                                );
                                              },
                                            )),
                                    ),
                            ))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: cardBox,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Obx(
                          () => JalaliTableCalendar(
                            currentMonth: Jalali.now(),
                            headerStyle: const TextStyle(color: Colors.white),
                            weekDaysStyle: const TextStyle(
                                fontSize: 12, color: Colors.white),
                            selectedDay: controller.s.value,
                            onDaySelected: (date) {
                              print('Selected date: $date');
                              controller.s.value = date;
                              controller.getEventDay(
                                year: date.year.toString(),
                                month: date.month.toString(),
                                day: date.day.toString(),
                              );
                            },
                            headerText: (date) {
                              return '${date.formatter.mN} ${date.year}'
                                  .toFarsiNumber();
                            },
                            onMonthChanged: (date) {
                              // Handle month change
                              print('Current month: $date');
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
