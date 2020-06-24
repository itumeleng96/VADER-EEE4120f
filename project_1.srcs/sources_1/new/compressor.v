module compressor(x,y

    );

input [511:0] x;

output [159:0] y;

wire [31:0] w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,

w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27,w28,w29,w30,

w31,w32,w33,w34,w35,w36,w37,w38,w39,w40,w41,w42,w43,w44,w45,w46,w47,w48,w49,w50,

w51,w52,w53,w54,w55,w56,w57,w58,w59,w60,w61,w62,w63,w64,w65,w66,w67,w68,w69,w70,

w71,w72,w73,w74,w75,w76,w77,w78,w79;

 

wire [31:0] a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,
a11,a12,a13,a14,a15,a16,a17,a18,a19,a20,a21,a22,a23,a24,a25,a26,a27,a28,a29,a30,
a31,a32,a33,a34,a35,a36,a37,a38,a39,a40,a41,a42,a43,a44,a45,a46,a47,a48,a49,a50,
a51,a52,a53,a54,a55,a56,a57,a58,a59,a60,a61,a62,a63,a64,a65,a66,a67,a68,a69,a70,
a71,a72,a73,a74,a75,a76,a77,a78,a79;
 

wire [31:0] b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,
b11,b12,b13,b14,b15,b16,b17,b18,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,
b31,b32,b33,b34,b35,b36,b37,b38,b39,b40,b41,b42,b43,b44,b45,b46,b47,b48,b49,b50,
b51,b52,b53,b54,b55,b56,b57,b58,b59,b60,b61,b62,b63,b64,b65,b66,b67,b68,b69,b70,
b71,b72,b73,b74,b75,b76,b77,b78,b79;

 

wire [31:0] c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,
c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,
c31,c32,c33,c34,c35,c36,c37,c38,c39,c40,c41,c42,c43,c44,c45,c46,c47,c48,c49,c50,
c51,c52,c53,c54,c55,c56,c57,c58,c59,c60,c61,c62,c63,c64,c65,c66,c67,c68,c69,c70,
c71,c72,c73,c74,c75,c76,c77,c78,c79;
 

wire [31:0] d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,
d11,d12,d13,d14,d15,d16,d17,d18,d19,d20,d21,d22,d23,d24,d25,d26,d27,d28,d29,d30,
d31,d32,d33,d34,d35,d36,d37,d38,d39,d40,d41,d42,d43,d44,d45,d46,d47,d48,d49,d50,
d51,d52,d53,d54,d55,d56,d57,d58,d59,d60,d61,d62,d63,d64,d65,d66,d67,d68,d69,d70,
d71,d72,d73,d74,d75,d76,d77,d78,d79;
 

wire [31:0] e0,e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,
e11,e12,e13,e14,e15,e16,e17,e18,e19,e20,e21,e22,e23,e24,e25,e26,e27,e28,e29,e30,
e31,e32,e33,e34,e35,e36,e37,e38,e39,e40,e41,e42,e43,e44,e45,e46,e47,e48,e49,e50,
e51,e52,e53,e54,e55,e56,e57,e58,e59,e60,e61,e62,e63,e64,e65,e66,e67,e68,e69,e70,
e71,e72,e73,e74,e75,e76,e77,e78,e79;

 

 

message_schedular m1(x,w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,

w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27,w28,w29,w30,

w31,w32,w33,w34,w35,w36,w37,w38,w39,w40,w41,w42,w43,w44,w45,w46,w47,w48,w49,w50,

w51,w52,w53,w54,w55,w56,w57,w58,w59,w60,w61,w62,w63,w64,w65,w66,w67,w68,w69,w70,

w71,w72,w73,w74,w75,w76,w77,w78,w79

    );

     /* H0 = 32'h67452301
                H1 = 32'hEFCDAB89
                H2 = 32'h98BADCFE
                H3 = 32'h10325476
                H4 = 32'hC3D2E1F0

               

               

                K(t) = 0x5A827999          ( 0 <= t <= 19)
           K(t) = 0x6ED9EBA1          (20 <= t <= 39)
           K(t) = 0x8F1BBCDC          (40 <= t <= 59)
           K(t) = 0xCA62C1D6          (60 <= t <= 79) */
//block 1

roundblock r0(32'h67452301,32'hEFCDAB89,32'h98BADCFE,32'h10325476,32'hC3D2E1F0,a0,b0,c0,d0,e0,w0,32'h5A827999,2'b00);

roundblock r1(a0,b0,c0,d0,e0,a1,b1,c1,d1,e1,w1,32'h5A827999,2'b00);

roundblock r2(a1,b1,c1,d1,e1,a2,b2,c2,d2,e2,w2,32'h5A827999,2'b00);

roundblock r3(a2,b2,c2,d2,e2,a3,b3,c3,d3,e3,w3,32'h5A827999,2'b00);

roundblock r4(a3,b3,c3,d3,e3,a4,b4,c4,d4,e4,w4,32'h5A827999,2'b00);

roundblock r5(a4,b4,c4,d4,e4,a5,b5,c5,d5,e5,w5,32'h5A827999,2'b00);

roundblock r6(a5,b5,c5,d5,e5,a6,b6,c6,d6,e6,w6,32'h5A827999,2'b00);

roundblock r7(a6,b6,c6,d6,e6,a7,b7,c7,d7,e7,w7,32'h5A827999,2'b00);

roundblock r8(a7,b7,c7,d7,e7,a8,b8,c8,d8,e8,w8,32'h5A827999,2'b00);

roundblock r9(a8,b8,c8,d8,e8,a9,b9,c9,d9,e9,w9,32'h5A827999,2'b00);

roundblock r10(a9,b9,c9,d9,e9,a10,b10,c10,d10,e10,w10,32'h5A827999,2'b00);

roundblock r11(a10,b10,c10,d10,e10,a11,b11,c11,d11,e11,w11,32'h5A827999,2'b00);

roundblock r12(a11,b11,c11,d11,e11,a12,b12,c12,d12,e12,w12,32'h5A827999,2'b00);

roundblock r13(a12,b12,c12,d12,e12,a13,b13,c13,d13,e13,w13,32'h5A827999,2'b00);

roundblock r14(a13,b13,c13,d13,e13,a14,b14,c14,d14,e14,w14,32'h5A827999,2'b00);

roundblock r15(a14,b14,c14,d14,e14,a15,b15,c15,d15,e15,w15,32'h5A827999,2'b00);

roundblock r16(a15,b15,c15,d15,e15,a16,b16,c16,d16,e16,w16,32'h5A827999,2'b00);

roundblock r17(a16,b16,c16,d16,e16,a17,b17,c17,d17,e17,w17,32'h5A827999,2'b00);

roundblock r18(a17,b17,c17,d17,e17,a18,b18,c18,d18,e18,w18,32'h5A827999,2'b00);

roundblock r19(a18,b18,c18,d18,e18,a19,b19,c19,d19,e19,w19,32'h5A827999,2'b00);

 

//block 2

roundblock r20(a19,b19,c19,d19,e19,a20,b20,c20,d20,e20,w20,32'h6ED9EBA1,2'b01);

roundblock r21(a20,b20,c20,d20,e20,a21,b21,c21,d21,e21,w21,32'h6ED9EBA1,2'b01);

roundblock r22(a21,b21,c21,d21,e21,a22,b22,c22,d22,e22,w22,32'h6ED9EBA1,2'b01);

roundblock r23(a22,b22,c22,d22,e22,a23,b23,c23,d23,e23,w23,32'h6ED9EBA1,2'b01);

roundblock r24(a23,b23,c23,d23,e23,a24,b24,c24,d24,e24,w24,32'h6ED9EBA1,2'b01);

roundblock r25(a24,b24,c24,d24,e24,a25,b25,c25,d25,e25,w25,32'h6ED9EBA1,2'b01);

roundblock r26(a25,b25,c25,d25,e25,a26,b26,c26,d26,e26,w26,32'h6ED9EBA1,2'b01);

roundblock r27(a26,b26,c26,d26,e26,a27,b27,c27,d27,e27,w27,32'h6ED9EBA1,2'b01);

roundblock r28(a27,b27,c27,d27,e27,a28,b28,c28,d28,e28,w28,32'h6ED9EBA1,2'b01);

roundblock r29(a28,b28,c28,d28,e28,a29,b29,c29,d29,e29,w29,32'h6ED9EBA1,2'b01);

roundblock r30(a29,b29,c29,d29,e29,a30,b30,c30,d30,e30,w30,32'h6ED9EBA1,2'b01);

roundblock r31(a30,b30,c30,d30,e30,a31,b31,c31,d31,e31,w31,32'h6ED9EBA1,2'b01);

roundblock r32(a31,b31,c31,d31,e31,a32,b32,c32,d32,e32,w32,32'h6ED9EBA1,2'b01);

roundblock r33(a32,b32,c32,d32,e32,a33,b33,c33,d33,e33,w33,32'h6ED9EBA1,2'b01);

roundblock r34(a33,b33,c33,d33,e33,a34,b34,c34,d34,e34,w34,32'h6ED9EBA1,2'b01);

roundblock r35(a34,b34,c34,d34,e34,a35,b35,c35,d35,e35,w35,32'h6ED9EBA1,2'b01);

roundblock r36(a35,b35,c35,d35,e35,a36,b36,c36,d36,e36,w36,32'h6ED9EBA1,2'b01);

roundblock r37(a36,b36,c36,d36,e36,a37,b37,c37,d37,e37,w37,32'h6ED9EBA1,2'b01);

roundblock r38(a37,b37,c37,d37,e37,a38,b38,c38,d38,e38,w38,32'h6ED9EBA1,2'b01);

roundblock r39(a38,b38,c38,d38,e38,a39,b39,c39,d39,e39,w39,32'h6ED9EBA1,2'b01);

 

//block 3

roundblock r40(a39,b39,c39,d39,e39,a40,b40,c40,d40,e40,w40,32'h8F1BBCDC,2'b10);

roundblock r41(a40,b40,c40,d40,e40,a41,b41,c41,d41,e41,w41,32'h8F1BBCDC,2'b10);

roundblock r42(a41,b41,c41,d41,e41,a42,b42,c42,d42,e42,w42,32'h8F1BBCDC,2'b10);

roundblock r43(a42,b42,c42,d42,e42,a43,b43,c43,d43,e43,w43,32'h8F1BBCDC,2'b10);

roundblock r44(a43,b43,c43,d43,e43,a44,b44,c44,d44,e44,w44,32'h8F1BBCDC,2'b10);

roundblock r45(a44,b44,c44,d44,e44,a45,b45,c45,d45,e45,w45,32'h8F1BBCDC,2'b10);

roundblock r46(a45,b45,c45,d45,e45,a46,b46,c46,d46,e46,w46,32'h8F1BBCDC,2'b10);

roundblock r47(a46,b46,c46,d46,e46,a47,b47,c47,d47,e47,w47,32'h8F1BBCDC,2'b10);

roundblock r48(a47,b47,c47,d47,e47,a48,b48,c48,d48,e48,w48,32'h8F1BBCDC,2'b10);

roundblock r49(a48,b48,c48,d48,e48,a49,b49,c49,d49,e49,w49,32'h8F1BBCDC,2'b10);

roundblock r50(a49,b49,c49,d49,e49,a50,b50,c50,d50,e50,w50,32'h8F1BBCDC,2'b10);

roundblock r51(a50,b50,c50,d50,e50,a51,b51,c51,d51,e51,w51,32'h8F1BBCDC,2'b10);

roundblock r52(a51,b51,c51,d51,e51,a52,b52,c52,d52,e52,w52,32'h8F1BBCDC,2'b10);

roundblock r53(a52,b52,c52,d52,e52,a53,b53,c53,d53,e53,w53,32'h8F1BBCDC,2'b10);

roundblock r54(a53,b53,c53,d53,e53,a54,b54,c54,d54,e54,w54,32'h8F1BBCDC,2'b10);

roundblock r55(a54,b54,c54,d54,e54,a55,b55,c55,d55,e55,w55,32'h8F1BBCDC,2'b10);

roundblock r56(a55,b55,c55,d55,e55,a56,b56,c56,d56,e56,w56,32'h8F1BBCDC,2'b10);

roundblock r57(a56,b56,c56,d56,e56,a57,b57,c57,d57,e57,w57,32'h8F1BBCDC,2'b10);

roundblock r58(a57,b57,c57,d57,e57,a58,b58,c58,d58,e58,w58,32'h8F1BBCDC,2'b10);

roundblock r59(a58,b58,c58,d58,e58,a59,b59,c59,d59,e59,w59,32'h8F1BBCDC,2'b10);

 

//block 4

 

roundblock r60(a59,b59,c59,d59,e59,a60,b60,c60,d60,e60,w60,32'hCA62C1D6,2'b11);

roundblock r61(a60,b60,c60,d60,e60,a61,b61,c61,d61,e61,w61,32'hCA62C1D6,2'b11);

roundblock r62(a61,b61,c61,d61,e61,a62,b62,c62,d62,e62,w62,32'hCA62C1D6,2'b11);

roundblock r63(a62,b62,c62,d62,e62,a63,b63,c63,d63,e63,w63,32'hCA62C1D6,2'b11);

roundblock r64(a63,b63,c63,d63,e63,a64,b64,c64,d64,e64,w64,32'hCA62C1D6,2'b11);

roundblock r65(a64,b64,c64,d64,e64,a65,b65,c65,d65,e65,w65,32'hCA62C1D6,2'b11);

roundblock r66(a65,b65,c65,d65,e65,a66,b66,c66,d66,e66,w66,32'hCA62C1D6,2'b11);

roundblock r67(a66,b66,c66,d66,e66,a67,b67,c67,d67,e67,w67,32'hCA62C1D6,2'b11);

roundblock r68(a67,b67,c67,d67,e67,a68,b68,c68,d68,e68,w68,32'hCA62C1D6,2'b11);

roundblock r69(a68,b68,c68,d68,e68,a69,b69,c69,d69,e69,w69,32'hCA62C1D6,2'b11);

roundblock r70(a69,b69,c69,d69,e69,a70,b70,c70,d70,e70,w70,32'hCA62C1D6,2'b11);

roundblock r71(a70,b70,c70,d70,e70,a71,b71,c71,d71,e71,w71,32'hCA62C1D6,2'b11);

roundblock r72(a71,b71,c71,d71,e71,a72,b72,c72,d72,e72,w72,32'hCA62C1D6,2'b11);

roundblock r73(a72,b72,c72,d72,e72,a73,b73,c73,d73,e73,w73,32'hCA62C1D6,2'b11);

roundblock r74(a73,b73,c73,d73,e73,a74,b74,c74,d74,e74,w74,32'hCA62C1D6,2'b11);

roundblock r75(a74,b74,c74,d74,e74,a75,b75,c75,d75,e75,w75,32'hCA62C1D6,2'b11);

roundblock r76(a75,b75,c75,d75,e75,a76,b76,c76,d76,e76,w76,32'hCA62C1D6,2'b11);

roundblock r77(a76,b76,c76,d76,e76,a77,b77,c77,d77,e77,w77,32'hCA62C1D6,2'b11);

roundblock r78(a77,b77,c77,d77,e77,a78,b78,c78,d78,e78,w78,32'hCA62C1D6,2'b11);

roundblock r79(a78,b78,c78,d78,e78,a79,b79,c79,d79,e79,w79,32'hCA62C1D6,2'b11);

modulo32 x1(a79,32'h67452301, y[159:128]);

modulo32 x2(b79,32'hEFCDAB89, y[127:96]);

modulo32 x3(c79,32'h98BADCFE, y[95:64]);

modulo32 x4(d79,32'h10325476, y[63:32]);

modulo32 x5(e79,32'hC3D2E1F0, y[31:0]);

endmodule
