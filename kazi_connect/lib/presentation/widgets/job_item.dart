import 'package:flutter/material.dart';

var loremIpsumText =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a congue magna, "
    "eu volutpat tellus. Nulla sit amet purus et sapien gravida vestibulum ac quis risus. "
    "Integer nec maximus leo. Sed dapibus luctus velit et tincidunt. Donec non nisi sapien. "
    "Donec non bibendum elit. In dignissim, sapien at placerat gravida, justo nibh lobortis elit, "
    "quis facilisis justo enim vel ex. Aliquam eu gravida leo, in consequat elit. Integer sed metus odio. "
    "Etiam nec pretium mi. Nam ac elementum turpis. Nunc iaculis mi eu erat consectetur ornare.";

Widget jobItem() {
  return ListTile(
    title: Text(
      "Job title",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    subtitle: Text(
      loremIpsumText,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    ),
  );
}
