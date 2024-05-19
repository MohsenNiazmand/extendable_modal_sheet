## Extendable Modal Sheet
ExtendableModalSheet is a highly customizable and extendable modal bottom sheet widget for Flutter. It is designed to handle extensive list views and large content efficiently, offering dynamic properties such as rounded corners that adapt based on scroll position, backdrop filtering, snapping behavior, and more.

## Features

- **Customizable Sizes**: Control the initial, minimum, and maximum child sizes.
- **Rounded Corners**: Automatically adjust the corners' radius based on the scroll position.
- **Backdrop Filter**: Apply a blur or other image filters to the backdrop.
- **Snap Behavior**: Enable snapping to predefined sizes.
- **Dismissible**: Optionally allow the sheet to be dismissible by the user.
- **Padding and Background Color**: Customize the content padding and background color.
- **Efficient List Handling**: Optimized for handling large lists and big contents seamlessly.

## Smooth Scrolling

Customizable scroll attributes to create desired modal sheet

![Experience smooth scrolling with ExtendableModalSheet](https://raw.githubusercontent.com/MohsenNiazmand/extendable_modal_sheet/main/doc/extendable_modal_sheet.gif)

## Properties

- **mainWidget**: The main content of the modal sheet.
- **bottomWidget**: An optional widget to display at the bottom of the modal sheet.
- **initialChildSize**: The initial size of the modal sheet relative to the parent container (default: 0.5).
- **minChildSize**: The minimum size of the modal sheet relative to the parent container (default: 0.25).
- **maxChildSize**: The maximum size of the modal sheet relative to the parent container (default: 1.0).
- **turningRadiusPoint**: The point at which the corners' radius should change (default: 80).
- **cornersRadius**: The radius of the modal sheet's corners (default: 24).
- **radiusChangeAnimationDuration**:The duration of the changing modal's radius(default : Duration ( milliseconds: 350 ).
- **contentPadding**: Padding for the content inside the modal sheet (default: EdgeInsets.zero).
- **backdropFilter**: An optional backdrop filter to apply (default: ImageFilter.blur(sigmaX: 6, sigmaY: 6)).
- **dismissible**: Whether the modal sheet can be dismissed by the user (default: true).
- **blendMode**: The blend mode to use for the backdrop filter (default: BlendMode.srcOver).
- **snap**: Whether the modal sheet should snap to predefined sizes (default: false).
- **snapAnimationDuration**: The duration of the snapping animation (default: null).
- **snapSizes**: A list of sizes to snap to (default: null).
- **shouldCloseOnMinExtent**: Whether the modal sheet should close when reaching the minimum extent (default: true).
- **backgroundColor**: The background color of the modal sheet (default: Colors.white).


## Usage
Import the package in your Dart file:
```
import 'package:extendable_modal_sheet/extendable_modal_sheet.dart';
```
Use the **ExtendableModalSheet** widget:



```
showModalBottomSheet(
  context: context,
  builder: (context) => ExtendableModalSheet(
    mainWidget: YourMainWidget(),
    bottomWidget: YourBottomWidget(), // Optional
    initialChildSize: 0.5,
    minChildSize: 0.25,
    maxChildSize: 1.0,
    turningRadiusPoint: 80,
    cornersRadius: 24,
    contentPadding: EdgeInsets.zero,
    backdropFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
    dismissible: true,
    blendMode: BlendMode.srcOver,
    snap: true,
    snapAnimationDuration: Duration(milliseconds: 200),
    snapSizes: [0.25, 0.5, 0.75, 1.0],
    shouldCloseOnMinExtent: true,
    backgroundColor: Colors.white,
  ),
);
```
