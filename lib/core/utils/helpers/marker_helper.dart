import 'dart:developer';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/gen/assets.gen.dart';

class MarkerHelper {
  static Future<Marker> getMapMarker(Device device,
      {bool addName = false,
      bool playback = false,
      LatLng? position,
      ClusterManagerId? clusterManagerId,
      VoidCallback? onTap}) async {
    final String iconPath = _getMarkerIconFromDevice(device);
    final rotation = device.position?.course;
    BitmapDescriptor icon;

    try {
      if (playback) {
        icon = await _playbackCreateCustomMarker(iconPath);
      } else if (addName) {
        icon = await _createCustomMarkerBitmap(device.name, iconPath, device.status);
      } else {
        icon = await _createCustomMarker(iconPath);
      }
    } catch (e) {
      icon = BitmapDescriptor.defaultMarker;
    }

    final marker = Marker(
      clusterManagerId: clusterManagerId,
      markerId: MarkerId('marker-${device.id}'),
      zIndex: 1,
      position: position ??
          LatLng(
            device.position!.latitude,
            device.position!.longitude,
          ),
      rotation: rotation ?? 0.0,
      flat: true,
      icon: icon,
      anchor: addName ? const Offset(0.5, 0.35) : const Offset(0.5, 0.5),
      onTap: onTap,
    );
    return marker;
  }

  static String _getMarkerIconFromDevice(Device device) {
    log('device category: ${device.category}, status: ${device.status}');
    String iconPath;
    if (device.category != null) {
      if (device.status == DeviceStatus.unknown) {
        iconPath = 'assets/icons/marker/marker_${device.category!}.png';
      } else {
        iconPath = 'assets/icons/marker/marker_${device.category!}_online.png';
      }
    } else {
      if (device.status == DeviceStatus.unknown) {
        iconPath = Assets.icons.marker.markerDefaultStatic.path;
      } else {
        iconPath = 'assets/icons/marker/marker_default_${device.status.name}.png';
      }
    }
    return iconPath;
  }

  static Future<BitmapDescriptor> _createCustomMarkerBitmap(
      String? title, String markerIconPath, DeviceStatus status) async {
    final double pixelRatio = ui.PlatformDispatcher.instance.views.first.devicePixelRatio;

    const double baseIconSize = 50.0;
    const double baseFontSize = 15.0;
    const double textPadding = 5.0;
    const double cornerRadius = 8.0;
    const double borderThickness = 2.0;
    const double extraPadding = 5.0;
    const double triangleHeight = 15.0;

    final double iconSize = baseIconSize * pixelRatio;
    final double fontSize = baseFontSize * pixelRatio;
    final double scaledTextPadding = textPadding * pixelRatio;
    final double scaledBorderThickness = borderThickness * pixelRatio;
    final double circleRadius = (iconSize / 2) + scaledBorderThickness;

    final ByteData iconData = await rootBundle.load(markerIconPath);
    final Uint8List iconBytes = iconData.buffer.asUint8List();
    final ui.Codec codec = await ui.instantiateImageCodec(
      iconBytes,
      targetWidth: iconSize.toInt(),
    );
    final ui.FrameInfo frameInfo = await codec.getNextFrame();

    final String name = title ?? '';
    final TextSpan span = TextSpan(
      style: TextStyle(
        color: Colors.black,
        fontSize: fontSize,
      ),
      text: name,
    );
    final TextPainter textPainter = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final double markerWidth = math.max(
          iconSize + scaledBorderThickness * 2,
          textPainter.width + 2 * scaledTextPadding,
        ) +
        extraPadding * 2;

    final double markerHeight = circleRadius * 2 +
        triangleHeight +
        textPainter.height +
        2 * scaledTextPadding +
        scaledBorderThickness +
        extraPadding;

    final ui.PictureRecorder recorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(recorder);

    final Offset circleCenter = Offset(markerWidth / 2, circleRadius + extraPadding);

    final Paint circlePaint = Paint()
      ..color = status != DeviceStatus.online ? const Color(0xFFFFCCCC) : const Color(0xFFE5F5D2);
    canvas.drawCircle(circleCenter, circleRadius, circlePaint);

    final Paint borderPaint = Paint()
      ..color = status != DeviceStatus.online ? Colors.red : Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = scaledBorderThickness;
    canvas.drawCircle(circleCenter, circleRadius, borderPaint);

    final ui.Rect dstRect = Rect.fromCircle(
      center: circleCenter,
      radius: iconSize / 2,
    );
    canvas.drawImageRect(
      frameInfo.image,
      Rect.fromLTWH(0, 0, frameInfo.image.width.toDouble(), frameInfo.image.height.toDouble()),
      dstRect,
      Paint(),
    );

    final Path trianglePath = Path()
      ..moveTo(markerWidth / 2 - 20, circleCenter.dy + circleRadius + triangleHeight)
      ..lineTo(markerWidth / 2 + 20, circleCenter.dy + circleRadius + triangleHeight)
      ..lineTo(markerWidth / 2, circleCenter.dy + circleRadius)
      ..close();

    final Paint trianglePaint = Paint()..color = const Color(0xFFFFFFFF);
    canvas.drawPath(trianglePath, trianglePaint);

    final Paint triangleStrokePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawPath(trianglePath, triangleStrokePaint);

    final Paint bgPaint = Paint()..color = const ui.Color.fromARGB(255, 255, 255, 255);

    final RRect background = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        extraPadding,
        circleCenter.dy + circleRadius + triangleHeight + scaledBorderThickness / 2,
        markerWidth - extraPadding * 2,
        textPainter.height + 2 * scaledTextPadding,
      ),
      Radius.circular(cornerRadius * pixelRatio),
    );
    canvas.drawRRect(background, bgPaint);

    final Paint strokePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawRRect(background, strokePaint);

    textPainter.paint(
      canvas,
      Offset(
        (markerWidth - textPainter.width) / 2,
        circleCenter.dy + circleRadius + triangleHeight + scaledTextPadding + scaledBorderThickness / 2,
      ),
    );

    final ui.Image markerImage = await recorder.endRecording().toImage(
          markerWidth.toInt(),
          markerHeight.toInt(),
        );

    final ByteData? byteData = await markerImage.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) {
      throw Exception('Failed to generate marker image');
    }
    return BitmapDescriptor.fromBytes(byteData.buffer.asUint8List());
  }

  static Future<BitmapDescriptor> _createCustomMarker(String imagePath) async {
    final double pixelRatio = ui.PlatformDispatcher.instance.views.first.devicePixelRatio;

    const double baseSize = 50.0;
    const double borderThickness = 2.0;
    final double size = baseSize * pixelRatio;
    final double circleRadius = (size / 2);
    final double scaledBorderThickness = borderThickness * pixelRatio;
    final double totalRadius = circleRadius + scaledBorderThickness;
    final double canvasSize = (totalRadius * 2).toInt().toDouble();

    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    final Paint borderPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = scaledBorderThickness;

    final Paint backgroundPaint = Paint()..color = const Color(0xFFE5F5D2);

    final Offset center = Offset(totalRadius, totalRadius);

    canvas.drawCircle(center, circleRadius, backgroundPaint);

    final Path clipPath = Path()
      ..addOval(Rect.fromCircle(center: center, radius: circleRadius - scaledBorderThickness / 2));
    canvas.save();
    canvas.clipPath(clipPath);

    final ByteData data = await rootBundle.load(imagePath);
    final Uint8List imageBytes = data.buffer.asUint8List();
    final ui.Codec codec = await ui.instantiateImageCodec(imageBytes, targetWidth: (size - 20).toInt());
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    final ui.Image image = frameInfo.image;

    paintImage(
      canvas: canvas,
      rect: Rect.fromCircle(center: center, radius: circleRadius - scaledBorderThickness / 2),
      image: image,
      fit: BoxFit.cover,
    );

    canvas.restore();

    canvas.drawCircle(center, circleRadius, borderPaint);

    final ui.Image finalImage = await pictureRecorder.endRecording().toImage(canvasSize.toInt(), canvasSize.toInt());

    final ByteData? byteData = await finalImage.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) {
      throw Exception('Failed to generate marker image');
    }
    return BitmapDescriptor.fromBytes(byteData.buffer.asUint8List());
  }

  static String toCamelCase(String text) {
    if (text.trim().isEmpty) return '';

    final List<String> words = text.toLowerCase().split(' ');

    return words.asMap().entries.map((entry) {
      final String word = entry.value;
      return word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '';
    }).join(' ');
  }

  static Future<BitmapDescriptor> _playbackCreateCustomMarker(String imagePath) async {
    final double pixelRatio = ui.PlatformDispatcher.instance.views.first.devicePixelRatio;
    const double baseSize = 50.0;
    final double size = baseSize * pixelRatio;

    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    // Load image
    final ByteData data = await rootBundle.load(imagePath);
    final Uint8List imageBytes = data.buffer.asUint8List();
    final ui.Codec codec = await ui.instantiateImageCodec(
      imageBytes,
      targetWidth: size.toInt(),
      targetHeight: size.toInt(),
    );
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    final ui.Image image = frameInfo.image;

    final Rect srcRect = Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble());
    final Rect dstRect = Rect.fromLTWH(0, 0, size, size);

    // ===== Draw shadow using image alpha =====
    final Paint shadowPaint = Paint()
      ..imageFilter = ui.ImageFilter.blur(sigmaX: 18, sigmaY: 18) // blur amount
      ..colorFilter = const ui.ColorFilter.mode(ui.Color.fromARGB(255, 255, 255, 255), BlendMode.srcIn); // shadow color
    // Shift shadow slightly
    canvas.save();
    canvas.translate(2, 2);
    canvas.drawImageRect(image, srcRect, dstRect, shadowPaint);
    canvas.restore();

    // ===== Draw actual image on top =====
    final Paint imagePaint = Paint()..isAntiAlias = true;
    canvas.drawImageRect(image, srcRect, dstRect, imagePaint);

    // End recording
    final ui.Image finalImage = await pictureRecorder.endRecording().toImage(
          size.toInt(),
          size.toInt(),
        );

    final ByteData? byteData = await finalImage.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) {
      throw Exception('Failed to generate marker image');
    }

    return BitmapDescriptor.fromBytes(byteData.buffer.asUint8List());
  }
}
