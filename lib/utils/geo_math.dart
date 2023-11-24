import 'dart:math';
import 'package:vector_math/vector_math.dart';

void main() {
  // print(GeoMath.toGMS(37.15));
}

class GeoMath {
  static double _toRad([double deg = 180.0]) {
    double rad = deg * pi / 180;
    return rad;
  }

  static String toDeg([double degree = 0, double min = 0, double sec = 0]) {
    double deg = degree + min / 60 + sec / 3600;
    return "${deg.toStringAsFixed(5)}°";
  }

  static String toGMS([double deg = 0]) {
    int degree = deg.toInt();
    double min = ((deg - deg.toInt()) * 60);
    double sec = double.parse(((min - min.toInt()) * 60).toStringAsFixed(2));
    return "${degree.toString()}° ${min.toInt().toString()}′ ${sec.toString()}′′";
  }

  static double toDegrees([double degree = 0.0, double min = 0.0, double sec = 0.0]) {
    double deg = degree + min / 60 + sec / 3600;
    return deg;
  }

  static String directGeodeticTask([double x1 = 0.0, double y1 = 0.0, double d = 0.0, double deg = 0.0, double min = 0.0, double sec = 0.0]) {
    double angel = toDegrees(deg, min, sec);
    double rad = _toRad(angel);
    double dx = d * cos(rad);
    double dy = d * sin(rad);
    double x2 = x1 + dx;
    double y2 = y1 + dy;
    return "${x2.toStringAsFixed(2)}m  ${y2.toStringAsFixed(2)}m";
  }
  
  static String inverseGeodeticTask([double x1 = 0.0, double y1 = 0.0, double x2 = 0.0, double y2 = 0.0]) {
    double dx = x2 - x1;
    double dy = y2 - y1;
    double r = degrees(atan((dy / dx).abs()));
    double d = sqrt(pow(dx, 2) + pow(dy, 2));
    double a = 0.0;
    
    if (dx > 0 && dy > 0) {
      a = r;
    }
    else if (dx < 0 && dy > 0) {
      a = 180 - r;
    }
    else if (dx > 0 && dy < 0) {
      a = 360 - r;
    }
    else if (dx < 0 && dy < 0) {
      a = 180 + r;
    }
    else if (dx == 0) {
      if (dy > 0) {
        a = 90;
      }
      else if (dy < 0) {
        a = 270;
      }
    }
    else if (dy == 0) {
      if (dx > 0) {
        a = 0;
      }
      else if (dx < 0) {
        a = 180;
      }
    }
    
    return "${d.toStringAsFixed(2)}m  ${toGMS(a)}";
  }
}
