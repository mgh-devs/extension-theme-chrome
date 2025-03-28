import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_tab_chrome/controller/extension_controller.dart';
import 'package:new_tab_chrome/core/utils/colors.dart';

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
                                        child: ListView.builder(
                                          itemCount: 15,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Obx(() {
                                                return MouseRegion(
                                                  onEnter: (_) {
                                                    controller.isHoveredToDoBox
                                                        .value = true;
                                                    controller
                                                            .isHoveredToDoBoxIndex =
                                                        index;
                                                  },
                                                  onExit: (_) {
                                                    controller.isHoveredToDoBox
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
                                                                .circular(10)),
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
                                                                  color: Colors
                                                                      .yellow
                                                                      .withOpacity(
                                                                          0.3),
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .yellow),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              const Text(
                                                                "show it",
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
                                                                            vertical:
                                                                                5),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              card,
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .edit_outlined,
                                                                          color: controller.isHoveredEditBtn.value
                                                                              ? buttonColor
                                                                              : icyColor,
                                                                          size:
                                                                              15,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 10,
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
                                                                            vertical:
                                                                                5),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              card,
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .delete_outline,
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
                                                          child: Container(
                                                            width: 20,
                                                            height: 20,
                                                            margin:
                                                                const EdgeInsets
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
                                                        Visibility(
                                                          visible: index == 1,
                                                          child: Container(
                                                            width: screen.width,
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
                                                            child: const Column(
                                                              children: [
                                                                Text(
                                                                  "dasdadassadhjashjdhjahdjafdsjfskldjfldjfksdljflkdsjfkljfldsjfljklfdslfjljdsjfldsjljdflksdjldfjslhaslhdlahsdlkaslhd",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          12),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
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
                                                ? 100
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
                                                                const SingleChildScrollView(
                                                              child: Column(
                                                                children: [
                                                                  TextField(
                                                                    decoration:
                                                                        InputDecoration(
                                                                      border: InputBorder
                                                                          .none,
                                                                      hintText:
                                                                          "Add a new task Title",
                                                                    ),
                                                                  ),
                                                                  TextField(
                                                                    maxLines: 2,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      border: InputBorder
                                                                          .none,
                                                                      hintText:
                                                                          "More details...",
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(
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
                                                                color: icyColor,
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
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 10, sigmaY: 10),
                                            child: Container(
                                              width: screen.width,
                                              decoration: BoxDecoration(
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
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.mic,
                              color: Colors.white,
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
                                    controller.isHoveredWhereCustomLinkBtn.value =
                                        url;
                                  },
                                  onExit: (_) {
                                    controller.isHoveredCustomLinkBtn.value =
                                        false;
                                    controller.isHoveredWhereCustomLinkBtn.value =
                                        '';
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
                                      child: Icon(Icons.add_rounded,color: icyColor,size: 30,),
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
