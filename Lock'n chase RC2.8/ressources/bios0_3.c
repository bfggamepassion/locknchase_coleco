/********************************************/
/*                                          */
/*   GRAPHICS TABLES  -  WIN ICVGM v3.00    */
/*                                          */
/*        WARNING : RLE COMPRESSION         */
/*                                          */
/********************************************/

#include <coleco.h>

byte NAMERLE[] = {
  0x8A, 0x00, 0x09, 0x09, 0x0E, 0x14, 0x23, 0x33, 0x3D, 0x47, 0x57, 0x66, 0x6C, 0x95, 0x00,
  0x09, 0x0A, 0x00, 0x00, 0x24, 0x34, 0x3E, 0x48, 0x00, 0x00, 0x6D, 0x95, 0x00, 0x09, 0x0A, 0x00,
  0x00, 0x25, 0x00, 0x00, 0x49, 0x00, 0x00, 0x6D, 0x95, 0x00, 0x09, 0x0A, 0x00, 0x00, 0x26, 0x35,
  0x3F, 0x4A, 0x00, 0x00, 0x6D, 0x95, 0x00, 0x09, 0x0A, 0x00, 0x15, 0x27, 0x36, 0x40, 0x4B, 0x58,
  0x00, 0x6D, 0x95, 0x00, 0x09, 0x0A, 0x0F, 0x16, 0x28, 0x00, 0x00, 0x4C, 0x59, 0x67, 0x6D, 0x95,
  0x00, 0x09, 0x0A, 0x10, 0x17, 0x29, 0x00, 0x00, 0x4D, 0x5A, 0x68, 0x6D, 0x95, 0x00, 0x09, 0x0B,
  0x11, 0x18, 0x2A, 0x00, 0x00, 0x4E, 0x5B, 0x69, 0x6E, 0x98, 0x00, 0x03, 0x2B, 0x00, 0x00, 0x4F,
  0x9A, 0x00, 0x05, 0x19, 0x2C, 0x00, 0x00, 0x50, 0x5C, 0x99, 0x00, 0x05, 0x1A, 0x00, 0x37, 0x41,
  0x00, 0x5D, 0x99, 0x00, 0x05, 0x1B, 0x00, 0x38, 0x42, 0x00, 0x5E, 0x99, 0x00, 0x05, 0x1C, 0x2D,
  0x39, 0x43, 0x51, 0x5F, 0x99, 0x00, 0x05, 0x1D, 0x2E, 0x3A, 0x44, 0x52, 0x60, 0x99, 0x00, 0x05,
  0x1E, 0x2F, 0x00, 0x00, 0x53, 0x61, 0x99, 0x00, 0x05, 0x1F, 0x30, 0x00, 0x00, 0x54, 0x62, 0x99,
  0x00, 0x00, 0x20, 0x83, 0x00, 0x00, 0x63, 0x93, 0x00, 0x11, 0x01, 0x03, 0x05, 0x07, 0x0C, 0x12,
  0x21, 0x31, 0x3B, 0x45, 0x55, 0x64, 0x6A, 0x6F, 0x71, 0x73, 0x75, 0x77, 0x8D, 0x00, 0x11, 0x02,
  0x04, 0x06, 0x08, 0x0D, 0x13, 0x22, 0x32, 0x3C, 0x46, 0x56, 0x65, 0x6B, 0x70, 0x72, 0x74, 0x76,
  0x78, 0xFE, 0x00, 0xA7, 0x00, 0xFF};

byte PATTERNRLE[] = {
  0x8B, 0xFF, 0x81, 0xCC, 0x01, 0xED, 0xE1, 0x83, 0xF3, 0x87, 0xFF, 0x01, 0xE3, 0xC9, 0x83,
  0x9C, 0x01, 0xC9, 0xE3, 0x87, 0xFF, 0x86, 0x99, 0x00, 0xC3, 0x87, 0xFF, 0x00, 0xF8, 0x82, 0xCC,
  0x03, 0xF8, 0xD8, 0xCC, 0xC6, 0x83, 0xFF, 0x81, 0xF0, 0x82, 0xC3, 0x8D, 0xCF, 0x81, 0xC3, 0x81,
  0xF0, 0x84, 0xFF, 0x81, 0x9C, 0x83, 0xC9, 0x81, 0xE3, 0x83, 0xFF, 0x81, 0xF0, 0x8C, 0xFF, 0x8D,
  0xFE, 0x81, 0xF0, 0x84, 0xFF, 0x07, 0x98, 0x93, 0x93, 0x90, 0x9C, 0x9F, 0x93, 0x98, 0x83, 0xFF,
  0x81, 0xF8, 0x87, 0xFF, 0x81, 0xFC, 0x81, 0xF0, 0x82, 0xC3, 0x85, 0xCF, 0x82, 0xF0, 0x8A, 0xC0,
  0x81, 0xF8, 0x85, 0xFF, 0x8E, 0xFC, 0x84, 0xF0, 0x8F, 0xF3, 0x81, 0xC3, 0x86, 0xCF, 0x83, 0xCC,
  0x81, 0xC0, 0x82, 0xC3, 0x88, 0xFF, 0x07, 0x98, 0xD9, 0xE4, 0xE4, 0xDB, 0xDB, 0xD9, 0x98, 0x8E,
  0xFF, 0x82, 0xFE, 0x81, 0xF8, 0x81, 0xF9, 0x81, 0xE1, 0x84, 0xE7, 0x81, 0xE1, 0x81, 0xF9, 0x82,
  0xF8, 0x81, 0xFE, 0x8C, 0xFF, 0x88, 0xE7, 0x86, 0xF8, 0x8F, 0xE0, 0x81, 0xFF, 0x86, 0xFE, 0x81,
  0xF8, 0x81, 0xF9, 0x81, 0xE1, 0x82, 0xE7, 0x81, 0xF8, 0x88, 0xE0, 0x87, 0xFF, 0x01, 0xE3, 0xB3,
  0x83, 0xE4, 0x01, 0xB3, 0xE3, 0x83, 0xFF, 0x81, 0xF0, 0x86, 0xFF, 0x81, 0xF0, 0x82, 0xFC, 0x81,
  0x80, 0x84, 0xFF, 0x82, 0x80, 0x83, 0xF0, 0x84, 0xFF, 0x84, 0xFC, 0x81, 0xF0, 0x81, 0xF3, 0x81,
  0x83, 0x84, 0x8F, 0x81, 0xF0, 0x86, 0x80, 0x89, 0xFF, 0x81, 0xCF, 0x81, 0xB0, 0x81, 0x8F, 0x81,
  0xCF, 0x8C, 0xFF, 0x81, 0xF8, 0x82, 0xC0, 0x81, 0xFE, 0x84, 0xFF, 0x82, 0xFE, 0x83, 0xF8, 0x84,
  0xFF, 0x84, 0xC0, 0x81, 0xF8, 0x81, 0xC7, 0x81, 0xC1, 0x84, 0xF9, 0x81, 0xF8, 0x86, 0xFE, 0x89,
  0xFF, 0x07, 0xCF, 0xD9, 0xD8, 0xDE, 0xC7, 0xC1, 0xD9, 0xCF, 0x83, 0xFF, 0x81, 0xE0, 0x88, 0xFF,
  0x82, 0x80, 0x81, 0xE0, 0x81, 0x9F, 0x81, 0x83, 0x84, 0xE3, 0x81, 0x83, 0x81, 0x9F, 0x82, 0xE0,
  0x81, 0x80, 0x81, 0xE0, 0x81, 0xFC, 0x88, 0xFF, 0x88, 0xE3, 0x86, 0xE0, 0x8F, 0xFC, 0x81, 0xFF,
  0x86, 0x80, 0x81, 0xE0, 0x81, 0x9F, 0x81, 0x83, 0x82, 0xE3, 0x81, 0xE0, 0x88, 0xFC, 0x87, 0xFF,
  0x07, 0xFE, 0x83, 0xF9, 0xF9, 0x86, 0x86, 0x83, 0xFE, 0x8F, 0xFF, 0x81, 0xF0, 0x82, 0xC1, 0x85,
  0xF1, 0x82, 0xF0, 0x8A, 0xFE, 0x87, 0xFF, 0x8E, 0xC0, 0x84, 0xF0, 0x8F, 0xCF, 0x81, 0xC1, 0x86,
  0xF1, 0x83, 0xCE, 0x81, 0xFE, 0x82, 0xC1, 0x88, 0xFF, 0x01, 0xC6, 0x99, 0x83, 0xC9, 0x01, 0x99,
  0xC3, 0x83, 0xFF, 0x81, 0xE0, 0x8C, 0xFF, 0x8D, 0x80, 0x81, 0xE0, 0x84, 0xFF, 0x00, 0x90, 0x82,
  0x93, 0x03, 0x90, 0x92, 0x93, 0xCC, 0x83, 0xFF, 0x81, 0xF0, 0x82, 0xC3, 0x8D, 0xF3, 0x81, 0xC3,
  0x81, 0xF0, 0x84, 0xFF, 0x07, 0x86, 0xC6, 0xC3, 0xC3, 0x83, 0x83, 0xC1, 0x9E, 0x87, 0xFF, 0x81,
  0xC9, 0x83, 0x99, 0x81, 0xC6, 0x87, 0xFF, 0x07, 0x86, 0xCD, 0xC1, 0xF1, 0xC2, 0xF2, 0xCD, 0x86,
  0x87, 0xFF, 0x01, 0x8E, 0x9B, 0x83, 0xB1, 0x01, 0x9B, 0x8E, 0x87, 0xFF, 0x81, 0xCC, 0x81, 0xBB,
  0x81, 0xB7, 0x81, 0xCC, 0x83, 0xFF, 0xFE, 0x00, 0xFE, 0x00, 0xFE, 0x00, 0xFE, 0x00, 0xFE, 0x00,
  0xFE, 0x00, 0xFE, 0x00, 0xFE, 0x00, 0xBF, 0x00, 0xFF};

byte COLORRLE[] = {
  0x8A, 0x10, 0x88, 0x12, 0x87, 0x10, 0x87, 0x12, 0x87, 0x10, 0x87, 0x12, 0x87, 0x10, 0x87,
  0x21, 0x83, 0x10, 0x96, 0x12, 0x84, 0x10, 0x87, 0x12, 0x83, 0x10, 0x81, 0x27, 0x8C, 0x10, 0x8D,
  0x17, 0x81, 0x27, 0x84, 0x10, 0x87, 0x17, 0x83, 0x10, 0x81, 0x76, 0x87, 0x10, 0x83, 0x16, 0x88,
  0x17, 0x8D, 0x71, 0x81, 0x76, 0x85, 0x10, 0x93, 0x16, 0xA1, 0x17, 0x88, 0x10, 0x81, 0x71, 0x81,
  0x17, 0x83, 0x71, 0x83, 0x10, 0x81, 0x60, 0x88, 0x10, 0x96, 0x16, 0x81, 0x60, 0x8A, 0x10, 0x88,
  0x16, 0x96, 0x61, 0x81, 0x10, 0x8F, 0x16, 0x8A, 0x61, 0x87, 0x10, 0x81, 0x61, 0x83, 0x16, 0x81,
  0x61, 0x83, 0x10, 0x81, 0x69, 0x86, 0x10, 0x81, 0x19, 0x84, 0x61, 0x84, 0x10, 0x86, 0x61, 0x84,
  0x10, 0x88, 0x19, 0x86, 0x16, 0x88, 0x61, 0x89, 0x10, 0x81, 0x16, 0x81, 0x61, 0x83, 0x16, 0x83,
  0x10, 0x81, 0x90, 0x86, 0x10, 0x81, 0x91, 0x84, 0x19, 0x84, 0x10, 0x86, 0x19, 0x84, 0x10, 0x86,
  0x91, 0x91, 0x19, 0x89, 0x10, 0x87, 0x91, 0x83, 0x10, 0x81, 0x9A, 0x88, 0x10, 0x84, 0x91, 0x81,
  0x19, 0x88, 0x1A, 0x81, 0x19, 0x84, 0x91, 0x81, 0x9A, 0x81, 0x1A, 0x88, 0x10, 0x9F, 0x1A, 0x81,
  0x10, 0x88, 0x91, 0x81, 0x19, 0x8F, 0x1A, 0x87, 0x10, 0x03, 0x1A, 0xA1, 0x1A, 0x1A, 0x82, 0xA1,
  0x00, 0x1A, 0x83, 0x10, 0x81, 0xA0, 0x89, 0x10, 0x81, 0xA1, 0x96, 0x1A, 0x81, 0xA0, 0x85, 0x10,
  0x93, 0xA1, 0x98, 0x1A, 0x85, 0xA1, 0x82, 0x1A, 0x88, 0x10, 0x00, 0xA1, 0x85, 0x1A, 0x00, 0xA1,
  0x83, 0x10, 0x81, 0xA3, 0x8C, 0x10, 0x8D, 0xA1, 0x81, 0xA3, 0x84, 0x10, 0x86, 0x13, 0x00, 0x31,
  0x83, 0x10, 0x81, 0x31, 0x92, 0x13, 0x81, 0x31, 0x84, 0x10, 0x86, 0x31, 0x00, 0x13, 0x87, 0x10,
  0x85, 0x19, 0x81, 0x91, 0x87, 0x10, 0x00, 0x19, 0x82, 0x91, 0x81, 0x19, 0x01, 0x91, 0x19, 0x87,
  0x10, 0x87, 0x71, 0x87, 0x10, 0x81, 0x12, 0x83, 0x21, 0x81, 0x12, 0x83, 0x10, 0xFE, 0x00, 0xFE,
  0x00, 0xFE, 0x00, 0xFE, 0x00, 0xFE, 0x00, 0xFE, 0x00, 0xFE, 0x00, 0xFE, 0x00, 0xBF, 0x00, 0xFF};
 
