import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class AdsRemoveElement extends CustomPainter {
  final Color elementColor;

  AdsRemoveElement({
    required this.elementColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4423828, size.height * 0.9976563);
    path_0.cubicTo(size.width * 0.3736328, size.height * 0.9900391, size.width * 0.2951172, size.height * 0.9625000, size.width * 0.2355469, size.height * 0.9253906);
    path_0.cubicTo(size.width * 0.1736328, size.height * 0.8867188, size.width * 0.1132812, size.height * 0.8263672, size.width * 0.07460937, size.height * 0.7644531);
    path_0.cubicTo(size.width * 0.03671875, size.height * 0.7035156, size.width * 0.009765625, size.height * 0.6257812, size.width * 0.002148437, size.height * 0.5542969);
    path_0.cubicTo(size.width * -0.0005859375, size.height * 0.5298828, size.width * -0.0005859375, size.height * 0.4701172, size.width * 0.002148437, size.height * 0.4457031);
    path_0.cubicTo(size.width * 0.009765625, size.height * 0.3742187, size.width * 0.03671875, size.height * 0.2964844, size.width * 0.07460937, size.height * 0.2355469);
    path_0.cubicTo(size.width * 0.1136719, size.height * 0.1728516, size.width * 0.1755859, size.height * 0.1113281, size.width * 0.2373047, size.height * 0.07363281);
    path_0.cubicTo(size.width * 0.3007813, size.height * 0.03496094, size.width * 0.3742187, size.height * 0.009765625, size.width * 0.4457031, size.height * 0.002148437);
    path_0.cubicTo(size.width * 0.4701172, size.height * -0.0005859375, size.width * 0.5298828, size.height * -0.0005859375, size.width * 0.5542969, size.height * 0.002148437);
    path_0.cubicTo(size.width * 0.6257813, size.height * 0.009765625, size.width * 0.6992188, size.height * 0.03496094, size.width * 0.7626953, size.height * 0.07363281);
    path_0.cubicTo(size.width * 0.8251953, size.height * 0.1117187, size.width * 0.8882813, size.height * 0.1748047, size.width * 0.9263672, size.height * 0.2373047);
    path_0.cubicTo(size.width * 0.9650391, size.height * 0.3007812, size.width * 0.9902344, size.height * 0.3742187, size.width * 0.9978516, size.height * 0.4457031);
    path_0.cubicTo(size.width * 1.000586, size.height * 0.4701172, size.width * 1.000586, size.height * 0.5298828, size.width * 0.9978516, size.height * 0.5542969);
    path_0.cubicTo(size.width * 0.9902344, size.height * 0.6257812, size.width * 0.9650391, size.height * 0.6992187, size.width * 0.9263672, size.height * 0.7626953);
    path_0.cubicTo(size.width * 0.8886719, size.height * 0.8244141, size.width * 0.8271484, size.height * 0.8863281, size.width * 0.7644531, size.height * 0.9253906);
    path_0.cubicTo(size.width * 0.7035156, size.height * 0.9632812, size.width * 0.6257812, size.height * 0.9902344, size.width * 0.5542969, size.height * 0.9978516);
    path_0.cubicTo(size.width * 0.5318359, size.height * 1.000391, size.width * 0.4646484, size.height * 1.000195, size.width * 0.4423828, size.height * 0.9976562);
    path_0.close();
    path_0.moveTo(size.width * 0.5373047, size.height * 0.9082031);
    path_0.cubicTo(size.width * 0.6314453, size.height * 0.8988281, size.width * 0.7169922, size.height * 0.8595703, size.width * 0.7839844, size.height * 0.7949219);
    path_0.cubicTo(size.width * 0.8371094, size.height * 0.7435547, size.width * 0.8740234, size.height * 0.6830078, size.width * 0.8937500, size.height * 0.6142578);
    path_0.cubicTo(size.width * 0.9269531, size.height * 0.4992187, size.width * 0.9080078, size.height * 0.3730469, size.width * 0.8429688, size.height * 0.2746094);
    path_0.lineTo(size.width * 0.8314453, size.height * 0.2574219);
    path_0.lineTo(size.width * 0.8056641, size.height * 0.2832031);
    path_0.lineTo(size.width * 0.7798828, size.height * 0.3089844);
    path_0.lineTo(size.width * 0.7525391, size.height * 0.3058594);
    path_0.cubicTo(size.width * 0.7128906, size.height * 0.3013672, size.width * 0.6779297, size.height * 0.3021484, size.width * 0.6572266, size.height * 0.3078125);
    path_0.cubicTo(size.width * 0.6550781, size.height * 0.3083984, size.width * 0.6794922, size.height * 0.2828125, size.width * 0.7115234, size.height * 0.2505859);
    path_0.cubicTo(size.width * 0.7433594, size.height * 0.2185547, size.width * 0.7695313, size.height * 0.1917969, size.width * 0.7695313, size.height * 0.1910156);
    path_0.cubicTo(size.width * 0.7695313, size.height * 0.1902344, size.width * 0.7623047, size.height * 0.1839844, size.width * 0.7535156, size.height * 0.1771484);
    path_0.cubicTo(size.width * 0.6984375, size.height * 0.1343750, size.width * 0.6345703, size.height * 0.1062500, size.width * 0.5664063, size.height * 0.09472656);
    path_0.cubicTo(size.width * 0.5404297, size.height * 0.09023437, size.width * 0.4863281, size.height * 0.08886719, size.width * 0.4587891, size.height * 0.09160156);
    path_0.cubicTo(size.width * 0.2875000, size.height * 0.1095703, size.width * 0.1445313, size.height * 0.2324219, size.width * 0.1027344, size.height * 0.3980469);
    path_0.cubicTo(size.width * 0.09277344, size.height * 0.4371094, size.width * 0.09101563, size.height * 0.4529297, size.width * 0.09101563, size.height * 0.5009766);
    path_0.cubicTo(size.width * 0.09121094, size.height * 0.5378906, size.width * 0.09199219, size.height * 0.5500000, size.width * 0.09531250, size.height * 0.5683594);
    path_0.cubicTo(size.width * 0.1083984, size.height * 0.6406250, size.width * 0.1402344, size.height * 0.7093750, size.width * 0.1851563, size.height * 0.7628906);
    path_0.lineTo(size.width * 0.1914063, size.height * 0.7705078);
    path_0.lineTo(size.width * 0.2300781, size.height * 0.7318359);
    path_0.lineTo(size.width * 0.2685547, size.height * 0.6933594);
    path_0.lineTo(size.width * 0.3208984, size.height * 0.6933594);
    path_0.cubicTo(size.width * 0.3537109, size.height * 0.6933594, size.width * 0.3765625, size.height * 0.6941406, size.width * 0.3822266, size.height * 0.6955078);
    path_0.lineTo(size.width * 0.3910156, size.height * 0.6978516);
    path_0.lineTo(size.width * 0.3244141, size.height * 0.7644531);
    path_0.lineTo(size.width * 0.2576172, size.height * 0.8312500);
    path_0.lineTo(size.width * 0.2757813, size.height * 0.8431641);
    path_0.cubicTo(size.width * 0.3517578, size.height * 0.8931641, size.width * 0.4474609, size.height * 0.9169922, size.width * 0.5373047, size.height * 0.9082031);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = elementColor;
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.2158203, size.height * 0.6238281);
    path_1.cubicTo(size.width * 0.2019531, size.height * 0.6212891, size.width * 0.1875000, size.height * 0.6187500, size.width * 0.1837891, size.height * 0.6181641);
    path_1.lineTo(size.width * 0.1771484, size.height * 0.6169922);
    path_1.lineTo(size.width * 0.1785156, size.height * 0.5941406);
    path_1.cubicTo(size.width * 0.1818359, size.height * 0.5373047, size.width * 0.1896484, size.height * 0.4707031, size.width * 0.2013672, size.height * 0.3972656);
    path_1.lineTo(size.width * 0.2074219, size.height * 0.3597656);
    path_1.lineTo(size.width * 0.2148437, size.height * 0.3576172);
    path_1.cubicTo(size.width * 0.2341797, size.height * 0.3517578, size.width * 0.2966797, size.height * 0.3457031, size.width * 0.3361328, size.height * 0.3457031);
    path_1.cubicTo(size.width * 0.3562500, size.height * 0.3457031, size.width * 0.3591797, size.height * 0.3460937, size.width * 0.3601563, size.height * 0.3492188);
    path_1.cubicTo(size.width * 0.3636719, size.height * 0.3617188, size.width * 0.3751953, size.height * 0.4476563, size.width * 0.3798828, size.height * 0.4984375);
    path_1.cubicTo(size.width * 0.3841797, size.height * 0.5447266, size.width * 0.3867188, size.height * 0.6097656, size.width * 0.3843750, size.height * 0.6126953);
    path_1.cubicTo(size.width * 0.3833984, size.height * 0.6140625, size.width * 0.3783203, size.height * 0.6164063, size.width * 0.3734375, size.height * 0.6179688);
    path_1.cubicTo(size.width * 0.3636719, size.height * 0.6210938, size.width * 0.3380859, size.height * 0.6259766, size.width * 0.3371094, size.height * 0.6248047);
    path_1.cubicTo(size.width * 0.3367188, size.height * 0.6244141, size.width * 0.3343750, size.height * 0.6138672, size.width * 0.3318359, size.height * 0.6015625);
    path_1.lineTo(size.width * 0.3271484, size.height * 0.5791016);
    path_1.lineTo(size.width * 0.3056641, size.height * 0.5785156);
    path_1.cubicTo(size.width * 0.2804688, size.height * 0.5777344, size.width * 0.2613281, size.height * 0.5794922, size.width * 0.2570313, size.height * 0.5826172);
    path_1.cubicTo(size.width * 0.2550781, size.height * 0.5841797, size.width * 0.2523438, size.height * 0.5929688, size.width * 0.2496094, size.height * 0.6070313);
    path_1.cubicTo(size.width * 0.2472656, size.height * 0.6189453, size.width * 0.2443359, size.height * 0.6289063, size.width * 0.2431641, size.height * 0.6287109);
    path_1.cubicTo(size.width * 0.2421875, size.height * 0.6285156, size.width * 0.2298828, size.height * 0.6263672, size.width * 0.2158203, size.height * 0.6238281);
    path_1.close();
    path_1.moveTo(size.width * 0.3007813, size.height * 0.5435547);
    path_1.lineTo(size.width * 0.3128906, size.height * 0.5423828);
    path_1.lineTo(size.width * 0.3117187, size.height * 0.5324219);
    path_1.cubicTo(size.width * 0.3109375, size.height * 0.5269531, size.width * 0.3085938, size.height * 0.5156250, size.width * 0.3062500, size.height * 0.5074219);
    path_1.lineTo(size.width * 0.3023437, size.height * 0.4921875);
    path_1.lineTo(size.width * 0.2880859, size.height * 0.4921875);
    path_1.lineTo(size.width * 0.2738281, size.height * 0.4921875);
    path_1.lineTo(size.width * 0.2718750, size.height * 0.5044922);
    path_1.cubicTo(size.width * 0.2707031, size.height * 0.5111328, size.width * 0.2691406, size.height * 0.5230469, size.width * 0.2683594, size.height * 0.5308594);
    path_1.lineTo(size.width * 0.2669922, size.height * 0.5449219);
    path_1.lineTo(size.width * 0.2777344, size.height * 0.5449219);
    path_1.cubicTo(size.width * 0.2835937, size.height * 0.5449219, size.width * 0.2939453, size.height * 0.5443359, size.width * 0.3007812, size.height * 0.5435547);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = elementColor;
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.7119141, size.height * 0.6275391);
    path_2.cubicTo(size.width * 0.6929688, size.height * 0.6248047, size.width * 0.6605469, size.height * 0.6123047, size.width * 0.6523438, size.height * 0.6042969);
    path_2.cubicTo(size.width * 0.6500000, size.height * 0.6019531, size.width * 0.6503906, size.height * 0.6007813, size.width * 0.6552734, size.height * 0.5955078);
    path_2.cubicTo(size.width * 0.6585937, size.height * 0.5921875, size.width * 0.6675781, size.height * 0.5841797, size.width * 0.6753906, size.height * 0.5779297);
    path_2.lineTo(size.width * 0.6898437, size.height * 0.5662109);
    path_2.lineTo(size.width * 0.6974609, size.height * 0.5730469);
    path_2.cubicTo(size.width * 0.7083984, size.height * 0.5830078, size.width * 0.7199219, size.height * 0.5882813, size.width * 0.7333984, size.height * 0.5894531);
    path_2.cubicTo(size.width * 0.7429687, size.height * 0.5900391, size.width * 0.7460937, size.height * 0.5896484, size.width * 0.7486328, size.height * 0.5871094);
    path_2.cubicTo(size.width * 0.7531250, size.height * 0.5826172, size.width * 0.7527344, size.height * 0.5738281, size.width * 0.7480469, size.height * 0.5679688);
    path_2.cubicTo(size.width * 0.7437500, size.height * 0.5623047, size.width * 0.7375000, size.height * 0.5605469, size.width * 0.6892578, size.height * 0.5500000);
    path_2.cubicTo(size.width * 0.6560547, size.height * 0.5427734, size.width * 0.6433594, size.height * 0.5375000, size.width * 0.6324219, size.height * 0.5259766);
    path_2.cubicTo(size.width * 0.6130859, size.height * 0.5060547, size.width * 0.6097656, size.height * 0.4687500, size.width * 0.6234375, size.height * 0.4257813);
    path_2.cubicTo(size.width * 0.6396484, size.height * 0.3748047, size.width * 0.6779297, size.height * 0.3472656, size.width * 0.7333984, size.height * 0.3470703);
    path_2.cubicTo(size.width * 0.7628906, size.height * 0.3468750, size.width * 0.7910156, size.height * 0.3541016, size.width * 0.8134766, size.height * 0.3675781);
    path_2.lineTo(size.width * 0.8236328, size.height * 0.3736328);
    path_2.lineTo(size.width * 0.8218750, size.height * 0.3841797);
    path_2.cubicTo(size.width * 0.8185547, size.height * 0.4058594, size.width * 0.8068359, size.height * 0.4527344, size.width * 0.8000000, size.height * 0.4714844);
    path_2.cubicTo(size.width * 0.7962891, size.height * 0.4820312, size.width * 0.7929687, size.height * 0.4910156, size.width * 0.7925781, size.height * 0.4914062);
    path_2.cubicTo(size.width * 0.7921875, size.height * 0.4916016, size.width * 0.7818359, size.height * 0.4910156, size.width * 0.7697266, size.height * 0.4898437);
    path_2.cubicTo(size.width * 0.7544922, size.height * 0.4884766, size.width * 0.7431641, size.height * 0.4884766, size.width * 0.7339844, size.height * 0.4898437);
    path_2.cubicTo(size.width * 0.7103516, size.height * 0.4933594, size.width * 0.6945312, size.height * 0.5064453, size.width * 0.6957031, size.height * 0.5214844);
    path_2.cubicTo(size.width * 0.6964844, size.height * 0.5312500, size.width * 0.7015625, size.height * 0.5330078, size.width * 0.7376953, size.height * 0.5351562);
    path_2.cubicTo(size.width * 0.7546875, size.height * 0.5363281, size.width * 0.7744141, size.height * 0.5380859, size.width * 0.7816406, size.height * 0.5392578);
    path_2.cubicTo(size.width * 0.8029297, size.height * 0.5425781, size.width * 0.8142578, size.height * 0.5529297, size.width * 0.8160156, size.height * 0.5701172);
    path_2.cubicTo(size.width * 0.8171875, size.height * 0.5839844, size.width * 0.8097656, size.height * 0.5992187, size.width * 0.7974609, size.height * 0.6076172);
    path_2.cubicTo(size.width * 0.7751953, size.height * 0.6230469, size.width * 0.7394531, size.height * 0.6312500, size.width * 0.7119141, size.height * 0.6275391);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = elementColor;
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.4244141, size.height * 0.6246094);
    path_3.cubicTo(size.width * 0.4111328, size.height * 0.6228516, size.width * 0.4101563, size.height * 0.6222656, size.width * 0.4101563, size.height * 0.6179688);
    path_3.cubicTo(size.width * 0.4101563, size.height * 0.6154297, size.width * 0.4083984, size.height * 0.5871094, size.width * 0.4062500, size.height * 0.5550781);
    path_3.cubicTo(size.width * 0.4011719, size.height * 0.4783203, size.width * 0.3984375, size.height * 0.4166016, size.width * 0.3984375, size.height * 0.3830078);
    path_3.lineTo(size.width * 0.3984375, size.height * 0.3556641);
    path_3.lineTo(size.width * 0.4136719, size.height * 0.3521484);
    path_3.cubicTo(size.width * 0.4351563, size.height * 0.3470703, size.width * 0.4757813, size.height * 0.3476563, size.width * 0.4970703, size.height * 0.3533203);
    path_3.cubicTo(size.width * 0.5251953, size.height * 0.3607422, size.width * 0.5466797, size.height * 0.3728516, size.width * 0.5669922, size.height * 0.3923828);
    path_3.cubicTo(size.width * 0.5953125, size.height * 0.4195313, size.width * 0.6095703, size.height * 0.4523438, size.width * 0.6095703, size.height * 0.4904297);
    path_3.cubicTo(size.width * 0.6095703, size.height * 0.5289063, size.width * 0.5953125, size.height * 0.5603516, size.width * 0.5660156, size.height * 0.5869141);
    path_3.cubicTo(size.width * 0.5515625, size.height * 0.6000000, size.width * 0.5210938, size.height * 0.6154297, size.width * 0.4990234, size.height * 0.6210938);
    path_3.cubicTo(size.width * 0.4804688, size.height * 0.6259766, size.width * 0.4449219, size.height * 0.6275391, size.width * 0.4244141, size.height * 0.6246094);
    path_3.close();
    path_3.moveTo(size.width * 0.4910156, size.height * 0.5849609);
    path_3.cubicTo(size.width * 0.5257812, size.height * 0.5802734, size.width * 0.5460938, size.height * 0.5636719, size.width * 0.5328125, size.height * 0.5513672);
    path_3.cubicTo(size.width * 0.5265625, size.height * 0.5455078, size.width * 0.5152344, size.height * 0.5429688, size.width * 0.4960938, size.height * 0.5429688);
    path_3.cubicTo(size.width * 0.4718750, size.height * 0.5429688, size.width * 0.4703125, size.height * 0.5437500, size.width * 0.4714844, size.height * 0.5535156);
    path_3.cubicTo(size.width * 0.4720703, size.height * 0.5578125, size.width * 0.4730469, size.height * 0.5675781, size.width * 0.4736328, size.height * 0.5748047);
    path_3.cubicTo(size.width * 0.4748047, size.height * 0.5859375, size.width * 0.4753906, size.height * 0.5878906, size.width * 0.4781250, size.height * 0.5871094);
    path_3.cubicTo(size.width * 0.4800781, size.height * 0.5867187, size.width * 0.4857422, size.height * 0.5857422, size.width * 0.4910156, size.height * 0.5849609);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = elementColor;
    canvas.drawPath(path_3, paint_3_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
