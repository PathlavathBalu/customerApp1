// import 'package:flutter/material.dart';

class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc(
      "Esaily delegate the small tasks and devote time th the most things!");
  sliderModel.setTitle("Food you love, delivered to you");
  sliderModel.setImageAssetPath("assets/images/Food Frame 1.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc(
      "Esaily delegate the small tasks and devote time th the most things!");
  sliderModel.setTitle("Food you love, delivered to you");
  sliderModel.setImageAssetPath("assets/images/Food Frame 2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc(
      "Esaily delegate the small tasks and devote time th the most things!");
  sliderModel.setTitle("Food you love, delivered to you");
  sliderModel.setImageAssetPath("assets/images/Food Frame 3.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
