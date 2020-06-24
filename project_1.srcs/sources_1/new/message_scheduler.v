module message_schedular(x,w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,
w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27,w28,w29,w30,
w31,w32,w33,w34,w35,w36,w37,w38,w39,w40,w41,w42,w43,w44,w45,w46,w47,w48,w49,w50,
w51,w52,w53,w54,w55,w56,w57,w58,w59,w60,w61,w62,w63,w64,w65,w66,w67,w68,w69,w70,
w71,w72,w73,w74,w75,w76,w77,w78,w79
    );
 input [511:0] x;
output [31:0] w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,
w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27,w28,w29,w30,
w31,w32,w33,w34,w35,w36,w37,w38,w39,w40,w41,w42,w43,w44,w45,w46,w47,w48,w49,w50,
w51,w52,w53,w54,w55,w56,w57,w58,w59,w60,w61,w62,w63,w64,w65,w66,w67,w68,w69,w70,
w71,w72,w73,w74,w75,w76,w77,w78,w79;
  assign w15=x[31:0];
  assign w14=x[63:32] ;
  assign w13=x[95:64] ;
  assign w12=x[127:96] ;
  assign w11=x[159:128] ;
  assign w10=x[191:160] ;
  assign w9=x[223:192] ;
  assign w8=x[255:224] ;
  assign w7=x[287:256] ;
  assign w6=x[319:288] ;
  assign w5=x[351:320] ;
  assign w4=x[383:352] ;
  assign w3=x[415:384] ;
  assign w2=x[447:416] ;
  assign w1=x[479:448] ;
  assign w0=x[511:480] ;
 leftshift l18(w16,{w13^w8^w2^w0});
 leftshift l19(w17,{w1^w3^w9^w14});
 leftshift l20(w18,{w2^w4^w10^w15});
 leftshift l21(w19,{w3^w5^w11^w16});
 leftshift l22(w20,{w4^w6^w12^w17});
 leftshift l23(w21,{w5^w7^w13^w18});
 leftshift l24(w22,{w6^w8^w14^w19});
 leftshift l25(w23,{w7^w9^w15^w20});
 leftshift l26(w24,{w8^w10^w16^w21});
 leftshift l27(w25,{w9^w11^w17^w22});
 leftshift l28(w26,{w10^w12^w18^w23});
 leftshift l29(w27,{w11^w13^w19^w24});
 leftshift l30(w28,{w12^w14^w20^w25});
 leftshift l31(w29,{w13^w15^w21^w26});
 leftshift l32(w30,{w14^w16^w22^w27});
 leftshift l33(w31,{w15^w17^w23^w28});
 leftshift l34(w32,{w16^w18^w24^w29});
 leftshift l35(w33,{w17^w19^w25^w30});
 leftshift l36(w34,{w18^w20^w26^w31});
 leftshift l37(w35,{w19^w21^w27^w32});
 leftshift l38(w36,{w20^w22^w28^w33});
 leftshift l39(w37,{w21^w23^w29^w34});
 leftshift l40(w38,{w22^w24^w30^w35});
 leftshift l41(w39,{w23^w25^w31^w36});
 leftshift l42(w40,{w24^w26^w32^w37});
 leftshift l43(w41,{w25^w27^w33^w38});
 leftshift l44(w42,{w26^w28^w34^w39});
 leftshift l45(w43,{w27^w29^w35^w40});
 leftshift l46(w44,{w28^w30^w36^w41});
 leftshift l47(w45,{w29^w31^w37^w42});
 leftshift l48(w46,{w30^w32^w38^w43});
 leftshift l49(w47,{w31^w33^w39^w44});
 leftshift l50(w48,{w32^w34^w40^w45});
 leftshift l51(w49,{w33^w35^w41^w46});
 leftshift l52(w50,{w34^w36^w42^w47});
 leftshift l53(w51,{w35^w37^w43^w48});
 leftshift l54(w52,{w36^w38^w44^w49});
 leftshift l55(w53,{w37^w39^w45^w50});
 leftshift l56(w54,{w38^w40^w46^w51});
 leftshift l57(w55,{w39^w41^w47^w52});
 leftshift l58(w56,{w40^w42^w48^w53});
 leftshift l59(w57,{w41^w43^w49^w54});
 leftshift l60(w58,{w42^w44^w50^w55});
 leftshift l61(w59,{w43^w45^w51^w56});
 leftshift l62(w60,{w44^w46^w52^w57});
 leftshift l63(w61,{w45^w47^w53^w58});
 leftshift l64(w62,{w46^w48^w54^w59});
 leftshift l65(w63,{w47^w49^w55^w60});
 leftshift l66(w64,{w48^w50^w56^w61});
 leftshift l67(w65,{w49^w51^w57^w62});
 leftshift l68(w66,{w50^w52^w58^w63});
 leftshift l69(w67,{w51^w53^w59^w64});
 leftshift l70(w68,{w52^w54^w60^w65});
 leftshift l71(w69,{w53^w55^w61^w66});
 leftshift l72(w70,{w54^w56^w62^w67});
 leftshift l73(w71,{w55^w57^w63^w68});
 leftshift l74(w72,{w56^w58^w64^w69});
 leftshift l75(w73,{w57^w59^w65^w70});
 leftshift l76(w74,{w58^w60^w66^w71});
 leftshift l77(w75,{w59^w61^w67^w72});
 leftshift l78(w76,{w60^w62^w68^w73});
 leftshift l79(w77,{w61^w63^w69^w74});
 leftshift l80(w78,{w62^w64^w70^w75});
 leftshift l81(w79,{w63^w65^w71^w76});
endmodule