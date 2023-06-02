import 'package:flutter_test/flutter_test.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';

void main() {
  test('Dimensiones calcula correctamente las alturas y anchuras', () {
    // Establece valores de prueba para screenHeight y screenWidth
    Dimensiones.screenHeight = 1000;
    Dimensiones.screenWidth = 500;

    expect(Dimensiones.height2, 20);
    expect(Dimensiones.height5, 50);
    expect(Dimensiones.height10, 100);
    expect(Dimensiones.height15, 150);
    expect(Dimensiones.height20, 200);
    expect(Dimensiones.height30, 300);
    expect(Dimensiones.height40, 400);
    expect(Dimensiones.height50, 500);
    expect(Dimensiones.height60, 600);
    expect(Dimensiones.height70, 700);
    expect(Dimensiones.height80, 800);
    expect(Dimensiones.height90, 900);

    expect(Dimensiones.width5, 25);
    expect(Dimensiones.width10, 50);
    expect(Dimensiones.width15, 75);
    expect(Dimensiones.width20, 100);
    expect(Dimensiones.width30, 150);
    expect(Dimensiones.width35, 175);
    expect(Dimensiones.width40, 200);
    expect(Dimensiones.width50, 250);
    expect(Dimensiones.width60, 300);
    expect(Dimensiones.width70, 350);
    expect(Dimensiones.width80, 400);
    expect(Dimensiones.width90, 450);

    expect(Dimensiones.buttonHeight, 75);
  });
}
