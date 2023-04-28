/********************************************/
/*                                          */
/*   GRAPHICS TABLES  -  WIN ICVGM v3.00    */
/*                                          */
/*        WARNING : RLE COMPRESSION         */
/*                                          */
/********************************************/

#include <coleco.h>

byte NAMERLE[] = {
  0xFC, 0x00, 0x83, 0x00, 0x1C, 0x30, 0x38, 0x40, 0x48, 0x50, 0x00, 0x60, 0x00, 0x70, 0x78,
  0x80, 0x88, 0x90, 0x98, 0x40, 0x48, 0xE0, 0xE8, 0x00, 0xA0, 0xA8, 0xB0, 0xB8, 0xC0, 0xC8, 0x40,
  0x48, 0xD0, 0xD8, 0x82, 0x00, 0x1C, 0x31, 0x39, 0x41, 0x49, 0x51, 0x59, 0x61, 0x69, 0x71, 0x79,
  0x81, 0x89, 0x91, 0x99, 0x41, 0x49, 0xE1, 0xE9, 0x00, 0xA1, 0xA9, 0xB1, 0xB9, 0xC1, 0xC9, 0x41,
  0x49, 0xD1, 0xD9, 0xFE, 0x00, 0xFE, 0x00, 0x8F, 0x00, 0x07, 0x10, 0x12, 0x05, 0x13, 0x05, 0x0E,
  0x14, 0x13, 0xD5, 0x00, 0x0B, 0x0C, 0x0F, 0x03, 0x0B, 0x33, 0x0E, 0x00, 0x03, 0x08, 0x01, 0x13,
  0x05, 0xF2, 0x00, 0x0E, 0x25, 0x00, 0x1D, 0x1B, 0x1C, 0x1C, 0x00, 0x0D, 0x2E, 0x0C, 0x0F, 0x15,
  0x16, 0x05, 0x14, 0xC7, 0x00, 0xFF};

byte PATTERNRLE[] = {
  0x87, 0x00, 0x11, 0x20, 0x50, 0x88, 0x88, 0xF8, 0x88, 0x88, 0x00, 0xF0, 0x88, 0x88, 0xF0,
  0x88, 0x88, 0xF0, 0x00, 0x70, 0x88, 0x82, 0x80, 0x03, 0x88, 0x70, 0x00, 0xF0, 0x84, 0x88, 0x0D,
  0xF0, 0x00, 0xF8, 0x80, 0x80, 0xF0, 0x80, 0x80, 0xF8, 0x00, 0xF8, 0x80, 0x80, 0xF0, 0x82, 0x80,
  0x01, 0x00, 0x78, 0x82, 0x80, 0x03, 0x98, 0x88, 0x78, 0x00, 0x82, 0x88, 0x00, 0xF8, 0x82, 0x88,
  0x01, 0x00, 0x70, 0x84, 0x20, 0x01, 0x70, 0x00, 0x84, 0x08, 0x0A, 0x88, 0x70, 0x00, 0x88, 0x90,
  0xA0, 0xC0, 0xA0, 0x90, 0x88, 0x00, 0x85, 0x80, 0x05, 0xF8, 0x00, 0x88, 0xD8, 0xA8, 0xA8, 0x82,
  0x88, 0x09, 0x00, 0x88, 0x88, 0xC8, 0xA8, 0x98, 0x88, 0x88, 0x00, 0x70, 0x84, 0x88, 0x05, 0x70,
  0x00, 0xF0, 0x88, 0x88, 0xF0, 0x82, 0x80, 0x01, 0x00, 0x70, 0x82, 0x88, 0x14, 0xA8, 0x90, 0x68,
  0x00, 0xF0, 0x88, 0x88, 0xF0, 0xA0, 0x90, 0x88, 0x00, 0x70, 0x88, 0x80, 0x70, 0x08, 0x88, 0x70,
  0x00, 0xF8, 0x85, 0x20, 0x00, 0x00, 0x85, 0x88, 0x01, 0x70, 0x00, 0x84, 0x88, 0x02, 0x50, 0x20,
  0x00, 0x82, 0x88, 0x81, 0xA8, 0x0D, 0xD8, 0x88, 0x00, 0x88, 0x88, 0x50, 0x20, 0x50, 0x88, 0x88,
  0x00, 0x88, 0x88, 0x50, 0x83, 0x20, 0x12, 0x00, 0xF8, 0x08, 0x10, 0x20, 0x40, 0x80, 0xF8, 0x00,
  0x70, 0x88, 0x98, 0xA8, 0xC8, 0x88, 0x70, 0x00, 0x20, 0x60, 0x83, 0x20, 0x2D, 0x70, 0x00, 0x70,
  0x88, 0x08, 0x30, 0x40, 0x80, 0xF8, 0x00, 0xF8, 0x08, 0x10, 0x30, 0x08, 0x88, 0x70, 0x00, 0x10,
  0x30, 0x50, 0x90, 0xF8, 0x10, 0x10, 0x00, 0xF8, 0x80, 0xF0, 0x08, 0x08, 0x88, 0x70, 0x00, 0x38,
  0x40, 0x80, 0xF0, 0x88, 0x88, 0x70, 0x00, 0xF8, 0x08, 0x10, 0x20, 0x82, 0x40, 0x19, 0x00, 0x70,
  0x88, 0x88, 0x70, 0x88, 0x88, 0x70, 0x00, 0x70, 0x88, 0x88, 0x78, 0x08, 0x10, 0xE0, 0x00, 0x7E,
  0x81, 0xBD, 0xA1, 0xA1, 0xBD, 0x81, 0x7E, 0x1F, 0x82, 0x04, 0x83, 0x00, 0x03, 0x44, 0x6C, 0x54,
  0x54, 0x83, 0x00, 0x06, 0x40, 0xA0, 0xA0, 0x40, 0xA8, 0x90, 0x68, 0x83, 0x00, 0x00, 0xF8, 0x83,
  0x00, 0x0E, 0x20, 0xA8, 0x70, 0x20, 0x70, 0xA8, 0x20, 0x00, 0x50, 0x50, 0xF8, 0x50, 0xF8, 0x50,
  0x50, 0x84, 0x00, 0x81, 0x20, 0x00, 0x40, 0x83, 0x00, 0x00, 0xF8, 0x89, 0x00, 0x00, 0x20, 0x82,
  0x00, 0x02, 0x20, 0x00, 0x20, 0x83, 0x00, 0x01, 0x07, 0x0F, 0x89, 0x1F, 0x0C, 0x0F, 0x07, 0x00,
  0x70, 0x88, 0x10, 0x20, 0x20, 0x00, 0x20, 0x00, 0x80, 0x40, 0xA6, 0x00, 0x0D, 0xE0, 0xF0, 0xF8,
  0xF8, 0x78, 0x78, 0x00, 0x00, 0x78, 0x78, 0xF8, 0xF8, 0xF0, 0xE0, 0xB1, 0x00, 0x03, 0x07, 0x0F,
  0x1F, 0x1F, 0x85, 0x1E, 0x81, 0x1F, 0x01, 0x0F, 0x07, 0xB1, 0x00, 0x03, 0xE0, 0xF0, 0xF8, 0xF8,
  0x85, 0x78, 0x81, 0xF8, 0x01, 0xF0, 0xE0, 0xB1, 0x00, 0x89, 0x1E, 0x83, 0x1F, 0xBB, 0x00, 0x83,
  0xF8, 0xB1, 0x00, 0x89, 0x1E, 0x83, 0x1F, 0xBB, 0x00, 0x83, 0xF8, 0xB1, 0x00, 0x82, 0x1F, 0x81,
  0x1E, 0x82, 0x1F, 0x81, 0x1E, 0x83, 0x1F, 0xB1, 0x00, 0x82, 0xF8, 0x81, 0x00, 0x82, 0xE0, 0x81,
  0x00, 0x83, 0xF8, 0xB1, 0x00, 0x01, 0x07, 0x0F, 0x89, 0x1F, 0x01, 0x0F, 0x07, 0xB1, 0x00, 0x0D,
  0xE0, 0xF0, 0xF8, 0xF8, 0x78, 0x78, 0x00, 0x00, 0x78, 0x78, 0xF8, 0xF8, 0xF0, 0xE0, 0xB1, 0x00,
  0x82, 0x0F, 0x8A, 0x03, 0xB1, 0x00, 0x82, 0xF0, 0x8A, 0xC0, 0xB1, 0x00, 0x82, 0x1E, 0x82, 0x0F,
  0x82, 0x07, 0x82, 0x03, 0x81, 0x01, 0xB1, 0x00, 0x82, 0x3C, 0x82, 0x78, 0x82, 0xF0, 0x82, 0xE0,
  0x81, 0xC0, 0xB1, 0x00, 0x8D, 0x1E, 0xB1, 0x00, 0x01, 0x03, 0x07, 0x84, 0x0F, 0x06, 0x07, 0x03,
  0x00, 0x0F, 0x0F, 0x07, 0x03, 0xB1, 0x00, 0x0D, 0xF0, 0xF8, 0xFC, 0x3C, 0x00, 0xF0, 0xF8, 0xFC,
  0xFC, 0x3C, 0x3C, 0xFC, 0xF8, 0xF0, 0xB1, 0x00, 0x8D, 0x1E, 0xB1, 0x00, 0x81, 0x3C, 0x82, 0x3E,
  0x83, 0x3F, 0x82, 0x3D, 0x81, 0x3C, 0xB1, 0x00, 0x8D, 0xF0, 0xB1, 0x00, 0x05, 0x07, 0x0F, 0x1F,
  0x1F, 0x1E, 0x1E, 0x82, 0x1F, 0x84, 0x1E, 0xB1, 0x00, 0x07, 0xE0, 0xF0, 0xF8, 0xF8, 0x78, 0x78,
  0xF0, 0xE0, 0x82, 0xF0, 0x82, 0x78, 0xFE, 0x00, 0xB1, 0x00, 0xFF};

byte COLORRLE[] = {
  0x87, 0x41, 0xFE, 0xF1, 0xFE, 0xF1, 0xF9, 0xF1, 0x8F, 0xD1, 0x8F, 0xF1, 0x9F, 0x41, 0x8F,
  0xD1, 0xAF, 0x41, 0x8F, 0x61, 0xAF, 0x41, 0x8F, 0x61, 0xAF, 0x41, 0x8F, 0x81, 0xB7, 0x41, 0x87,
  0x81, 0xAF, 0x41, 0x8F, 0xB1, 0xB7, 0x41, 0x87, 0xB1, 0xAF, 0x41, 0x8F, 0x31, 0xAF, 0x41, 0x8F,
  0x31, 0xFE, 0x41, 0xB0, 0x41, 0x8F, 0xD1, 0xAF, 0x41, 0x8F, 0xD1, 0xAF, 0x41, 0x8F, 0xB1, 0xAF,
  0x41, 0x8F, 0xB1, 0xAF, 0x41, 0x8F, 0x31, 0xFE, 0x41, 0xB0, 0x41, 0x8F, 0xD1, 0xFE, 0x41, 0xB0,
  0x41, 0x8F, 0x91, 0xAF, 0x41, 0x8F, 0x91, 0xFE, 0x41, 0xB0, 0x41, 0xFF};
