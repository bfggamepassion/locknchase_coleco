#include <coleco.h>

const byte NAMERLE[] = {
  0x83, 0x00, 0x0C, 0x01, 0xB4, 0xB4, 0xB6, 0xB5, 0x10, 0x10, 0xB6, 0xB5, 0xB4, 0xB4, 0xB6,
  0xB5, 0x85, 0xB4, 0x04, 0xB6, 0xB5, 0xB4, 0xB4, 0x04, 0x87, 0x00, 0x00, 0xB3, 0x82, 0x00, 0x00,
  0x69, 0x86, 0x00, 0x00, 0x69, 0x86, 0x00, 0x03, 0x69, 0x00, 0x00, 0xB7, 0x85, 0x00, 0x06, 0xAA,
  0x00, 0xB3, 0x00, 0x3B, 0x3B, 0x69, 0x86, 0x3B, 0x00, 0x69, 0x86, 0x3B, 0x06, 0x69, 0x3B, 0x3B,
  0xB7, 0x00, 0x00, 0xAA, 0x84, 0x00, 0x04, 0xB3, 0x00, 0x3B, 0x25, 0xD7, 0x82, 0xCF, 0x12, 0x0C,
  0x00, 0x3B, 0xBF, 0xC5, 0x00, 0x3B, 0x14, 0x0C, 0x00, 0x3B, 0xBF, 0x2D, 0x00, 0x3B, 0xB7, 0x00,
  0x00, 0x30, 0x84, 0x00, 0x1A, 0xB3, 0x00, 0x3B, 0xCC, 0xD0, 0xD1, 0xD1, 0xD2, 0xCB, 0x69, 0x69,
  0xC9, 0xCB, 0x69, 0x69, 0xC9, 0xCB, 0x69, 0x69, 0xC9, 0x2E, 0x00, 0x3B, 0xB7, 0x00, 0x48, 0x30,
  0x84, 0x00, 0x04, 0xB3, 0x00, 0x3B, 0x00, 0x69, 0x82, 0x00, 0x12, 0x69, 0x00, 0x3B, 0x00, 0x69,
  0x00, 0x3B, 0x00, 0x69, 0x00, 0x3B, 0x00, 0x69, 0x00, 0x3B, 0xB7, 0x00, 0x49, 0x30, 0x84, 0x00,
  0x04, 0xB3, 0x00, 0x3B, 0x3B, 0x69, 0x82, 0x3B, 0x00, 0x69, 0x82, 0x3B, 0x00, 0x69, 0x82, 0x3B,
  0x00, 0x69, 0x82, 0x3B, 0x06, 0x69, 0x3B, 0x3B, 0xB7, 0x00, 0x00, 0x30, 0x84, 0x00, 0x1B, 0xB3,
  0x00, 0x3B, 0xBF, 0xC5, 0x00, 0x3B, 0x23, 0xC5, 0x00, 0x00, 0x23, 0xC5, 0x00, 0x00, 0x23, 0xC5,
  0x00, 0x3B, 0xBF, 0xCA, 0xCF, 0xCF, 0xB7, 0x00, 0x00, 0x30, 0x00, 0x83, 0xD1, 0x14, 0x0A, 0x69,
  0x69, 0xC9, 0xCB, 0x69, 0x69, 0xCD, 0xCE, 0x69, 0x69, 0x15, 0x0A, 0x69, 0x69, 0xCD, 0xCE, 0x69,
  0x00, 0xC9, 0xB8, 0x86, 0xD1, 0x00, 0x68, 0x84, 0x00, 0x00, 0x3B, 0x82, 0x00, 0x02, 0x3B, 0xCF,
  0x02, 0x85, 0x00, 0x05, 0xCF, 0x02, 0x00, 0x3B, 0x00, 0x69, 0x85, 0x00, 0x01, 0x67, 0x68, 0x84,
  0x00, 0x81, 0x3B, 0x04, 0x00, 0x3B, 0x3B, 0xCF, 0x02, 0x85, 0x00, 0x07, 0xCF, 0x02, 0x00, 0x3B,
  0x3B, 0x69, 0x3B, 0x3B, 0x83, 0x00, 0x00, 0x67, 0x83, 0xCF, 0x17, 0x0C, 0x00, 0x3B, 0xBF, 0xC5,
  0x00, 0x3B, 0xCF, 0xD3, 0x00, 0x00, 0x61, 0x62, 0x00, 0x00, 0xCF, 0xD3, 0x00, 0x3B, 0xBF, 0xC5,
  0x00, 0x3B, 0x14, 0x83, 0xCF, 0x83, 0xD1, 0x17, 0x0A, 0x69, 0x69, 0xC9, 0xCB, 0x69, 0x69, 0xC9,
  0xCB, 0x69, 0x69, 0xC9, 0xCB, 0x69, 0x69, 0xC9, 0xCB, 0x69, 0x69, 0xC9, 0xCB, 0x69, 0x69, 0x15,
  0x83, 0xD1, 0x81, 0x00, 0x08, 0x1D, 0x1E, 0x00, 0x00, 0x3B, 0x00, 0x69, 0x00, 0x3B, 0x84, 0x00,
  0x00, 0x69, 0x82, 0x00, 0x0A, 0x69, 0x00, 0x3B, 0x00, 0x69, 0x00, 0x3B, 0x00, 0x00, 0x1D, 0x1E,
  0x82, 0x00, 0x06, 0x1D, 0x1E, 0x00, 0x00, 0x3B, 0x3B, 0x69, 0x82, 0x3B, 0x08, 0x00, 0x3B, 0x3B,
  0x00, 0x69, 0x00, 0x3B, 0x3B, 0x69, 0x82, 0x3B, 0x07, 0x69, 0x3B, 0x3B, 0x00, 0x00, 0x1D, 0x1E,
  0x00, 0x83, 0x1C, 0x17, 0x0C, 0x00, 0x3B, 0x23, 0xC5, 0x00, 0x3B, 0xBF, 0xC5, 0x00, 0x3B, 0xBF,
  0xC5, 0x00, 0x3B, 0xBF, 0xC5, 0x00, 0x3B, 0x23, 0xC5, 0x00, 0x3B, 0x14, 0x83, 0x1C, 0x83, 0x00,
  0x17, 0xC1, 0x69, 0x69, 0xCD, 0xCE, 0x69, 0x69, 0xC9, 0xCB, 0x69, 0x69, 0xCD, 0xCE, 0x69, 0x69,
  0xC9, 0xCB, 0x69, 0x69, 0xCD, 0xCE, 0x69, 0x69, 0xB7, 0x87, 0x00, 0x06, 0xC1, 0x00, 0x3B, 0xCF,
  0x02, 0x00, 0x3B, 0x82, 0x00, 0x0D, 0x3B, 0xCF, 0x02, 0x00, 0x3B, 0x00, 0x69, 0x00, 0x3B, 0xCF,
  0x02, 0x00, 0x3B, 0xB7, 0x87, 0x00, 0x17, 0xC1, 0x00, 0x3B, 0xCF, 0x02, 0x00, 0x3B, 0x3B, 0x00,
  0x3B, 0x3B, 0xCF, 0x02, 0x00, 0x3B, 0x3B, 0x69, 0x3B, 0x3B, 0xCF, 0x02, 0x00, 0x3B, 0xB7, 0x84,
  0x00, 0x1D, 0x63, 0x2A, 0x30, 0xC1, 0x00, 0x3B, 0xCF, 0xD3, 0x00, 0x3B, 0xBF, 0xC5, 0x00, 0x3B,
  0xCF, 0x07, 0x00, 0x3B, 0xBF, 0xC5, 0x00, 0x3B, 0xCF, 0x02, 0x00, 0x3B, 0xB7, 0x4C, 0x56, 0x4C,
  0x84, 0x00, 0x17, 0xC1, 0x00, 0x3B, 0xCC, 0xCB, 0x69, 0x69, 0xC9, 0xCB, 0x69, 0x69, 0x15, 0x0A,
  0x69, 0x69, 0xC9, 0xCB, 0x69, 0x69, 0xC9, 0x2E, 0x00, 0x3B, 0xB7, 0x87, 0x00, 0x0A, 0xC1, 0x00,
  0x3B, 0x00, 0x69, 0x00, 0x3B, 0x00, 0x69, 0x00, 0x3B, 0x82, 0x00, 0x09, 0x3B, 0x00, 0x69, 0x00,
  0x3B, 0x00, 0x69, 0x00, 0x3B, 0xB7, 0x87, 0x00, 0x04, 0xC1, 0x00, 0x3B, 0x3B, 0x69, 0x82, 0x3B,
  0x00, 0x69, 0x86, 0x3B, 0x00, 0x69, 0x82, 0x3B, 0x03, 0x69, 0x3B, 0x3B, 0xB7, 0x87, 0x00, 0x08,
  0x03, 0xC2, 0xC2, 0xC4, 0xC3, 0xC2, 0xC2, 0xC4, 0xC3, 0x85, 0xC2, 0x08, 0xC4, 0xC3, 0x08, 0x08,
  0xC4, 0xC3, 0xC2, 0xC2, 0x06, 0x83, 0x00, 0xFF};

const byte NAMERLE_INTRO[] = {
  0x83, 0x00, 0x0C, 0x01, 0xB4, 0xB4, 0xB6, 0xB5, 0x10, 0x10, 0xB6, 0xB5, 0xB4, 0xB4, 0xB6,
  0xB5, 0x85, 0xB4, 0x04, 0xB6, 0xB5, 0xB4, 0xB4, 0x04, 0x87, 0x00, 0x00, 0xB3, 0x82, 0x00, 0x00,
  0x69, 0x86, 0x00, 0x00, 0x69, 0x86, 0x00, 0x03, 0x69, 0x00, 0x00, 0xB7, 0x87, 0x00, 0x00, 0xB3,
  0x95, 0x00, 0x00, 0xB7, 0x87, 0x00, 0x04, 0xB3, 0x00, 0x00, 0x25, 0xD7, 0x82, 0xCF, 0x0F, 0x0C,
  0x00, 0x00, 0xBF, 0xC5, 0x00, 0x00, 0x14, 0x0C, 0x00, 0x00, 0xBF, 0x2D, 0x00, 0x00, 0xB7, 0x87,
  0x00, 0x17, 0xB3, 0x00, 0x00, 0xCC, 0xD0, 0xD1, 0xD1, 0xD2, 0xCB, 0x69, 0x00, 0xC9, 0xCB, 0x00,
  0x00, 0xC9, 0xCB, 0x69, 0x00, 0xC9, 0x2E, 0x00, 0x00, 0xB7, 0x87, 0x00, 0x00, 0xB3, 0x82, 0x00,
  0x00, 0x69, 0x8A, 0x00, 0x00, 0x69, 0x82, 0x00, 0x03, 0x69, 0x00, 0x00, 0xB7, 0x87, 0x00, 0x00,
  0xB3, 0x95, 0x00, 0x00, 0xB7, 0x87, 0x00, 0x17, 0xB3, 0x00, 0x00, 0xBF, 0xC5, 0x00, 0x00, 0x23,
  0xC5, 0x00, 0x00, 0x23, 0xC5, 0x00, 0x00, 0x23, 0xC5, 0x00, 0x00, 0xBF, 0xCA, 0xCF, 0xCF, 0xB7,
  0x83, 0x00, 0x83, 0xD1, 0x14, 0x0A, 0x00, 0x00, 0xC9, 0xCB, 0x69, 0x00, 0xCD, 0xCE, 0x69, 0x69,
  0x15, 0x0A, 0x69, 0x69, 0xCD, 0xCE, 0x00, 0x00, 0xC9, 0xB8, 0x86, 0xD1, 0x00, 0x68, 0x89, 0x00,
  0x01, 0xCF, 0x02, 0x85, 0x00, 0x01, 0xCF, 0x02, 0x82, 0x00, 0x00, 0x69, 0x85, 0x00, 0x01, 0x67,
  0x68, 0x89, 0x00, 0x01, 0xCF, 0x02, 0x85, 0x00, 0x01, 0xCF, 0x02, 0x82, 0x00, 0x00, 0x69, 0x85,
  0x00, 0x00, 0x67, 0x83, 0xCF, 0x17, 0x0C, 0x00, 0x00, 0xBF, 0xC5, 0x00, 0x00, 0xCF, 0xD3, 0x00,
  0x00, 0x61, 0x62, 0x00, 0x00, 0xCF, 0xD3, 0x00, 0x00, 0xBF, 0xC5, 0x00, 0x00, 0x14, 0x83, 0xCF,
  0x83, 0xD1, 0x17, 0x0A, 0x69, 0x00, 0xC9, 0xCB, 0x69, 0x00, 0xC9, 0xCB, 0x69, 0x69, 0xC9, 0xCB,
  0x69, 0x69, 0xC9, 0xCB, 0x69, 0x00, 0xC9, 0xCB, 0x69, 0x00, 0x15, 0x83, 0xD1, 0x81, 0x00, 0x01,
  0x1D, 0x1E, 0x8B, 0x00, 0x00, 0x69, 0x82, 0x00, 0x00, 0x69, 0x87, 0x00, 0x01, 0x1D, 0x1E, 0x82,
  0x00, 0x01, 0x1D, 0x1E, 0x83, 0x00, 0x00, 0x69, 0x93, 0x00, 0x02, 0x1D, 0x1E, 0x00, 0x83, 0x1C,
  0x17, 0x0C, 0x00, 0x00, 0x23, 0xC5, 0x00, 0x00, 0xBF, 0xC5, 0x00, 0x00, 0xBF, 0xC5, 0x00, 0x00,
  0xBF, 0xC5, 0x00, 0x00, 0x23, 0xC5, 0x00, 0x00, 0x14, 0x83, 0x1C, 0x83, 0x00, 0x17, 0xC1, 0x69,
  0x00, 0xCD, 0xCE, 0x69, 0x69, 0xC9, 0xCB, 0x69, 0x00, 0xCD, 0xCE, 0x69, 0x00, 0xC9, 0xCB, 0x69,
  0x00, 0xCD, 0xCE, 0x69, 0x00, 0xB7, 0x87, 0x00, 0x04, 0xC1, 0x00, 0x00, 0xCF, 0x02, 0x85, 0x00,
  0x01, 0xCF, 0x02, 0x82, 0x00, 0x07, 0x69, 0x00, 0x00, 0xCF, 0x02, 0x00, 0x00, 0xB7, 0x87, 0x00,
  0x04, 0xC1, 0x00, 0x00, 0xCF, 0x02, 0x85, 0x00, 0x01, 0xCF, 0x02, 0x85, 0x00, 0x04, 0xCF, 0x02,
  0x00, 0x00, 0xB7, 0x87, 0x00, 0x17, 0xC1, 0x00, 0x00, 0xCF, 0xD3, 0x00, 0x00, 0xBF, 0xC5, 0x00,
  0x00, 0xCF, 0x07, 0x00, 0x00, 0xBF, 0xC5, 0x00, 0x00, 0xCF, 0x02, 0x00, 0x00, 0xB7, 0x83, 0x00,
  0x84, 0xC2, 0x81, 0x00, 0x14, 0xCC, 0xCB, 0x69, 0x69, 0xC9, 0xCB, 0x69, 0x69, 0x15, 0x0A, 0x69,
  0x69, 0xC9, 0xCB, 0x69, 0x69, 0xC9, 0x2E, 0x00, 0x00, 0xB7, 0x9B, 0x00, 0x03, 0x69, 0x00, 0x00,
  0xB7, 0x9E, 0x00, 0x00, 0xB7, 0x83, 0x00, 0x86, 0xC2, 0x05, 0xC4, 0xC3, 0xC2, 0xC2, 0xC4, 0xC3,
  0x85, 0xC2, 0x08, 0xC4, 0xC3, 0x08, 0x08, 0xC4, 0xC3, 0xC2, 0xC2, 0x06, 0x83, 0x00, 0xFF};
  
const byte PATTERNRLE[] = {
  0x88, 0x00, 0x01, 0x1F, 0x3F, 0x84, 0x7F, 0x87, 0x3F, 0x84, 0x7F, 0x05, 0x3F, 0x1F, 0x00,
  0x00, 0xF8, 0xFC, 0x84, 0xFE, 0x87, 0x00, 0x84, 0xFE, 0x02, 0xFC, 0xF8, 0x00, 0x87, 0x3F, 0x81,
  0xFF, 0x8F, 0x00, 0x83, 0xFF, 0x01, 0xFE, 0xFC, 0x87, 0x00, 0x01, 0xFC, 0xFE, 0x85, 0xFF, 0x9D,
  0x00, 0x81, 0xFF, 0x97, 0x00, 0x01, 0x3F, 0x7F, 0x85, 0xFF, 0x81, 0x00, 0x83, 0xFF, 0x01, 0x7F,
  0x3F, 0xAF, 0x00, 0x87, 0xFF, 0x87, 0xE7, 0xA7, 0x00, 0x01, 0x3E, 0x7E, 0x85, 0xFF, 0x87, 0x00,
  0x01, 0x3F, 0x7F, 0x85, 0xFF, 0x8F, 0x00, 0x01, 0x20, 0x40, 0x82, 0x80, 0x03, 0x40, 0x20, 0x00,
  0xFF, 0x87, 0x00, 0x04, 0x44, 0x28, 0x10, 0x28, 0x44, 0x91, 0x00, 0x01, 0x3C, 0x3E, 0x8B, 0x3F,
  0x01, 0x3E, 0x3C, 0x87, 0x00, 0x09, 0x70, 0x88, 0x98, 0xA8, 0xC8, 0x88, 0x70, 0x00, 0x20, 0x60,
  0x83, 0x20, 0x2D, 0x70, 0x00, 0x70, 0x88, 0x08, 0x30, 0x40, 0x80, 0xF8, 0x00, 0xF8, 0x08, 0x10,
  0x30, 0x08, 0x88, 0x70, 0x00, 0x10, 0x30, 0x50, 0x90, 0xF8, 0x10, 0x10, 0x00, 0xF8, 0x80, 0xF0,
  0x08, 0x08, 0x88, 0x70, 0x00, 0x38, 0x40, 0x80, 0xF0, 0x88, 0x88, 0x70, 0x00, 0xF8, 0x08, 0x10,
  0x20, 0x82, 0x40, 0x0F, 0x00, 0x70, 0x88, 0x88, 0x70, 0x88, 0x88, 0x70, 0x00, 0x70, 0x88, 0x88,
  0x78, 0x08, 0x10, 0xE0, 0x88, 0x00, 0x81, 0xC0, 0xA5, 0x00, 0x19, 0x70, 0x88, 0xA8, 0xB8, 0xB0,
  0x80, 0x78, 0x00, 0x20, 0x50, 0x88, 0x88, 0xF8, 0x88, 0x88, 0x00, 0xF0, 0x88, 0x88, 0xF0, 0x88,
  0x88, 0xF0, 0x00, 0x70, 0x88, 0x82, 0x80, 0x03, 0x88, 0x70, 0x00, 0xF0, 0x84, 0x88, 0x0D, 0xF0,
  0x00, 0xF8, 0x80, 0x80, 0xF0, 0x80, 0x80, 0xF8, 0x00, 0xF8, 0x80, 0x80, 0xF0, 0x82, 0x80, 0x01,
  0x00, 0x78, 0x82, 0x80, 0x03, 0x98, 0x88, 0x78, 0x00, 0x82, 0x88, 0x00, 0xF8, 0x82, 0x88, 0x01,
  0x00, 0x70, 0x84, 0x20, 0x01, 0x70, 0x00, 0x84, 0x08, 0x0A, 0x88, 0x70, 0x00, 0x88, 0x90, 0xA0,
  0xC0, 0xA0, 0x90, 0x88, 0x00, 0x85, 0x80, 0x05, 0xF8, 0x00, 0x88, 0xD8, 0xA8, 0xA8, 0x82, 0x88,
  0x09, 0x00, 0x88, 0x88, 0xC8, 0xA8, 0x98, 0x88, 0x88, 0x00, 0x70, 0x84, 0x88, 0x05, 0x70, 0x00,
  0xF0, 0x88, 0x88, 0xF0, 0x82, 0x80, 0x01, 0x00, 0x70, 0x82, 0x88, 0x14, 0xA8, 0x90, 0x68, 0x00,
  0xF0, 0x88, 0x88, 0xF0, 0xA0, 0x90, 0x88, 0x00, 0x70, 0x88, 0x80, 0x70, 0x08, 0x88, 0x70, 0x00,
  0xF8, 0x85, 0x20, 0x00, 0x00, 0x85, 0x88, 0x01, 0x70, 0x00, 0x84, 0x88, 0x02, 0x50, 0x20, 0x00,
  0x82, 0x88, 0x81, 0xA8, 0x0D, 0xD8, 0x88, 0x00, 0x88, 0x88, 0x50, 0x20, 0x50, 0x88, 0x88, 0x00,
  0x88, 0x88, 0x50, 0x83, 0x20, 0x07, 0x00, 0xF8, 0x08, 0x10, 0x20, 0x40, 0x80, 0xF8, 0xB0, 0x00,
  0x87, 0xFF, 0x00, 0xFE, 0x86, 0xFF, 0x06, 0x7E, 0x3C, 0x00, 0x3C, 0x00, 0xBD, 0xFF, 0x90, 0x00,
  0x87, 0xFF, 0x8F, 0x00, 0x07, 0xBA, 0x55, 0xBA, 0x5D, 0xAA, 0x5D, 0xAA, 0x5D, 0x87, 0xC0, 0x81,
  0xFF, 0xFE, 0x00, 0xA6, 0x00, 0x81, 0x80, 0x85, 0x00, 0x81, 0xC0, 0x85, 0x00, 0x81, 0xE0, 0x85,
  0x00, 0x81, 0xF0, 0x85, 0x00, 0x81, 0xF8, 0x85, 0x00, 0x81, 0xFC, 0x85, 0x00, 0x81, 0xFE, 0x85,
  0x00, 0x81, 0xFF, 0x85, 0x00, 0x81, 0x01, 0x85, 0x00, 0x81, 0x03, 0x85, 0x00, 0x81, 0x07, 0x85,
  0x00, 0x81, 0x0F, 0x85, 0x00, 0x81, 0x1F, 0x85, 0x00, 0x81, 0x3F, 0x85, 0x00, 0x81, 0x7F, 0x85,
  0x00, 0x81, 0xFF, 0xFE, 0x00, 0xD6, 0x00, 0x06, 0x70, 0xA8, 0xA0, 0x70, 0x28, 0xA8, 0x70, 0xC0,
  0x00, 0x87, 0x7F, 0x00, 0x00, 0x86, 0xFF, 0x00, 0x00, 0x86, 0xC0, 0x87, 0x00, 0x87, 0xFE, 0x81,
  0x00, 0x85, 0x3F, 0xAF, 0x00, 0x01, 0x3F, 0x7F, 0x85, 0xFF, 0x87, 0x00, 0x87, 0x7F, 0x86, 0xFF,
  0x00, 0x00, 0x86, 0x3F, 0x00, 0x00, 0x86, 0xFF, 0x02, 0x00, 0x3C, 0x3E, 0x85, 0x3F, 0x99, 0x00,
  0x83, 0xFF, 0x00, 0x7F, 0x88, 0x3F, 0x81, 0x00, 0x83, 0x3F, 0x01, 0x3E, 0x3C, 0x85, 0xFF, 0x03,
  0x7F, 0x3F, 0x00, 0x00, 0x85, 0xFF, 0x81, 0x00, 0x85, 0x3F, 0x87, 0xFF, 0x81, 0x00, 0x85, 0x3F,
  0x81, 0x00, 0x85, 0xFF, 0x81, 0x00, 0x85, 0xFF, 0x87, 0x3F, 0x97, 0x00, 0x87, 0x3F, 0xBF, 0x00,
  0x81, 0xFF, 0x1D, 0xFB, 0xF3, 0x82, 0x8D, 0x86, 0xBE, 0xFE, 0xC0, 0xAA, 0xC9, 0xBE, 0xC9, 0xAA,
  0xC1, 0xFF, 0xFB, 0xF2, 0x82, 0x8C, 0x86, 0xBE, 0xFE, 0xFE, 0xC1, 0x94, 0x9C, 0x94, 0x9C, 0x94,
  0xC1, 0x9A, 0xFF, 0x81, 0x80, 0x08, 0xFF, 0xCC, 0xCC, 0xE6, 0xBF, 0xEA, 0x9F, 0xBF, 0xBF, 0x82,
  0xFF, 0x81, 0x80, 0x0A, 0xFF, 0xCC, 0xCC, 0x99, 0x80, 0xCA, 0xE0, 0xE0, 0xBF, 0xBF, 0x80, 0x83,
  0xFF, 0x1B, 0x80, 0xFF, 0xBF, 0xC0, 0xBF, 0xDF, 0xDF, 0xC0, 0xBE, 0x83, 0xFD, 0xF9, 0xFF, 0xFF,
  0x80, 0xFF, 0xBF, 0xC0, 0x80, 0xBF, 0xDF, 0xC0, 0xC0, 0xBE, 0x82, 0xFD, 0xF9, 0xFE, 0x86, 0xFF,
  0x00, 0xF7, 0x82, 0xFE, 0x06, 0xFD, 0xAA, 0x93, 0x82, 0x93, 0xAA, 0x83, 0x83, 0xFF, 0x00, 0xF7,
  0x82, 0xFE, 0x07, 0x81, 0x83, 0xD6, 0xC6, 0xD6, 0xC6, 0xD6, 0x83, 0x8B, 0xF0, 0x83, 0xFF, 0xD7,
  0x00, 0xFF};

const byte COLORRLE[] = {
  0x87, 0x11, 0x87, 0x41, 0x87, 0x47, 0x8F, 0x41, 0x87, 0x11, 0x87, 0x41, 0x87, 0x47, 0x87,
  0xA1, 0x87, 0x11, 0x85, 0x47, 0x8B, 0x41, 0x85, 0x47, 0x97, 0x11, 0x87, 0xA1, 0x99, 0x41, 0x87,
  0x47, 0x83, 0x4B, 0xB1, 0x41, 0x8F, 0x47, 0xA9, 0x41, 0x85, 0x4D, 0x89, 0x41, 0x85, 0x4D, 0x97,
  0x41, 0x87, 0x81, 0x87, 0xF1, 0x91, 0x41, 0x8B, 0x47, 0x89, 0x41, 0xCF, 0x61, 0x87, 0x11, 0x87,
  0xA1, 0x9F, 0x11, 0xFE, 0xF1, 0xD8, 0xF1, 0xAF, 0x11, 0x87, 0x47, 0x00, 0x41, 0x86, 0x47, 0x87,
  0x71, 0xAF, 0x11, 0x8F, 0xA1, 0xFE, 0x11, 0xA0, 0x11, 0xFC, 0x21, 0x82, 0x21, 0xFE, 0x11, 0xD0,
  0x11, 0x87, 0xA1, 0xBF, 0x11, 0x8F, 0x41, 0x00, 0x71, 0x86, 0x74, 0x00, 0x71, 0x86, 0x74, 0x87,
  0x41, 0x85, 0x47, 0x81, 0x41, 0xAF, 0x11, 0x81, 0x41, 0x85, 0x4B, 0x87, 0x11, 0x8F, 0x41, 0x86,
  0x47, 0x00, 0x41, 0x86, 0x47, 0x82, 0x41, 0x85, 0x47, 0x8F, 0x11, 0x87, 0x41, 0x85, 0x47, 0x83,
  0x41, 0x8B, 0x47, 0x81, 0x41, 0x85, 0x4D, 0x81, 0x41, 0x8F, 0x47, 0x87, 0x4D, 0x85, 0x47, 0x81,
  0x41, 0x97, 0x47, 0x97, 0x11, 0x81, 0x41, 0x85, 0x47, 0xBF, 0x11, 0x81, 0x10, 0x81, 0x12, 0x06,
  0x17, 0x76, 0x76, 0x67, 0xB8, 0x12, 0x1C, 0x82, 0xC1, 0x11, 0x1C, 0x12, 0x10, 0x12, 0x12, 0x17,
  0x76, 0x76, 0x67, 0xB8, 0x1B, 0x12, 0x15, 0xC1, 0x25, 0xC1, 0x15, 0x12, 0x8B, 0xF0, 0x8D, 0x10,
  0x1B, 0x70, 0x1B, 0x1B, 0x70, 0x94, 0x94, 0xE8, 0x87, 0x31, 0x79, 0x91, 0xB1, 0x10, 0x10, 0x70,
  0x1B, 0x1B, 0x70, 0x94, 0x94, 0x8B, 0x78, 0x31, 0xE1, 0x67, 0x91, 0xB1, 0x21, 0x83, 0x10, 0x1B,
  0x71, 0x10, 0x17, 0x71, 0xB1, 0x67, 0x67, 0x19, 0x6E, 0x38, 0x91, 0xA1, 0x10, 0x10, 0x71, 0x10,
  0x17, 0x71, 0x81, 0xB1, 0x67, 0x19, 0x19, 0x6E, 0xE6, 0x91, 0xA1, 0x12, 0x86, 0x10, 0x0A, 0x17,
  0xD1, 0xD1, 0xB1, 0x31, 0xC1, 0xC1, 0x1C, 0xC1, 0xC1, 0x12, 0x83, 0x10, 0x0B, 0x17, 0xD1, 0xD1,
  0xB1, 0xB1, 0x12, 0x51, 0x1C, 0x52, 0x1C, 0x51, 0x12, 0x8B, 0xF1, 0x83, 0x10, 0xD7, 0x00, 0xFF};
  
const byte SPATTERNRLE[] = {
  0x0D, 0x00, 0x1F, 0x06, 0x04, 0x0E, 0x7F, 0x00, 0x3F, 0x3F, 0x73, 0x73, 0x3F, 0x02, 0x0E,
  0x82, 0x00, 0x0C, 0xF8, 0x70, 0x30, 0x78, 0xFC, 0x00, 0xFC, 0xFC, 0x9E, 0x9E, 0xFC, 0x40, 0x70,
  0x82, 0x00, 0x2C, 0x1F, 0x06, 0x04, 0x0E, 0x7F, 0x00, 0x3F, 0x33, 0x73, 0x7F, 0x3F, 0x02, 0x02,
  0x0E, 0x00, 0x00, 0xF8, 0x70, 0x30, 0x78, 0xFC, 0x00, 0xFC, 0x9C, 0x9E, 0xFE, 0xFC, 0x40, 0x40,
  0x70, 0x00, 0x00, 0x1F, 0x06, 0x04, 0x0E, 0x7F, 0x00, 0x33, 0x33, 0x7F, 0x7F, 0x3F, 0x02, 0x0E,
  0x82, 0x00, 0x0C, 0xF8, 0x70, 0x30, 0x78, 0xFC, 0x00, 0x9C, 0x9C, 0xFE, 0xFE, 0xFC, 0x40, 0x70,
  0x82, 0x00, 0x0C, 0x1F, 0x0E, 0x0C, 0x1E, 0x3F, 0x00, 0x3F, 0x3F, 0x79, 0x79, 0x3F, 0x02, 0x0E,
  0x82, 0x00, 0x0C, 0xF8, 0x60, 0x20, 0x70, 0xFE, 0x00, 0xFC, 0xFC, 0xCE, 0xCE, 0xFC, 0x40, 0x70,
  0x82, 0x00, 0x2C, 0x1F, 0x0E, 0x0C, 0x1E, 0x3F, 0x00, 0x3F, 0x39, 0x79, 0x7F, 0x3F, 0x02, 0x02,
  0x0E, 0x00, 0x00, 0xF8, 0x60, 0x20, 0x70, 0xFE, 0x00, 0xFC, 0xCC, 0xCE, 0xFE, 0xFC, 0x40, 0x40,
  0x70, 0x00, 0x00, 0x1F, 0x0E, 0x0C, 0x1E, 0x3F, 0x00, 0x39, 0x39, 0x7F, 0x7F, 0x3F, 0x02, 0x0E,
  0x82, 0x00, 0x0C, 0xF8, 0x60, 0x20, 0x70, 0xFE, 0x00, 0xCC, 0xCC, 0xFE, 0xFE, 0xFC, 0x40, 0x70,
  0x82, 0x00, 0x09, 0x1F, 0x0F, 0x00, 0x0F, 0x00, 0x4F, 0x7F, 0x1E, 0x06, 0x04, 0x85, 0x00, 0x09,
  0xF8, 0xF0, 0x00, 0xF0, 0x00, 0xF2, 0xFE, 0xF0, 0x30, 0x20, 0x8C, 0x00, 0x81, 0x21, 0x04, 0x23,
  0x1F, 0x04, 0x04, 0x0C, 0x88, 0x00, 0x81, 0x0C, 0x10, 0x1C, 0xF8, 0x20, 0x20, 0x30, 0x00, 0x00,
  0x1F, 0x0F, 0x00, 0x0F, 0x00, 0x4F, 0x7F, 0x0F, 0x0C, 0x04, 0x85, 0x00, 0x09, 0xF8, 0xF0, 0x00,
  0xF0, 0x00, 0xF2, 0xFE, 0x78, 0x60, 0x20, 0x8C, 0x00, 0x81, 0x30, 0x04, 0x38, 0x1F, 0x04, 0x04,
  0x0C, 0x88, 0x00, 0x81, 0x84, 0x10, 0xC4, 0xF8, 0x20, 0x20, 0x30, 0x00, 0x00, 0x1F, 0x0F, 0x00,
  0x0F, 0x00, 0x4F, 0x7F, 0x06, 0x06, 0x1C, 0x85, 0x00, 0x09, 0xF8, 0xF0, 0x00, 0xF0, 0x00, 0xF2,
  0xFE, 0x30, 0x30, 0xE0, 0x85, 0x00, 0x09, 0x1F, 0x0F, 0x00, 0x0F, 0x00, 0x4F, 0x7F, 0x0C, 0x0C,
  0x07, 0x85, 0x00, 0x09, 0xF8, 0xF0, 0x00, 0xF0, 0x00, 0xF2, 0xFE, 0x60, 0x60, 0x38, 0x86, 0x00,
  0x0A, 0x1E, 0x0F, 0x07, 0x0D, 0x38, 0x75, 0xF8, 0xFD, 0xF0, 0x7D, 0x1F, 0x84, 0x00, 0x0A, 0x78,
  0xF0, 0xE0, 0xB0, 0x1C, 0xBE, 0x1F, 0xAF, 0x1F, 0xBE, 0xF8, 0x87, 0x00, 0x07, 0x1F, 0x0F, 0x0F,
  0x00, 0x0F, 0x00, 0x4F, 0x7F, 0x87, 0x00, 0x07, 0xF8, 0xF0, 0xF0, 0x00, 0xF0, 0x00, 0xF2, 0xFE,
  0x87, 0x00, 0x07, 0x81, 0x43, 0x66, 0x7C, 0x7C, 0x7E, 0xDB, 0x7F, 0x87, 0x00, 0x07, 0x81, 0xC2,
  0x66, 0x3E, 0x3E, 0x7E, 0xDB, 0xFE, 0x87, 0x00, 0x07, 0x03, 0x04, 0x7F, 0x75, 0x6A, 0x75, 0x6A,
  0x7F, 0x87, 0x00, 0x07, 0xC0, 0x20, 0xFE, 0x56, 0xAE, 0x56, 0xAE, 0xFE, 0x87, 0x00, 0x07, 0x7F,
  0xE6, 0xED, 0x16, 0x1C, 0x36, 0x3D, 0x3F, 0x87, 0x00, 0x07, 0xFE, 0x67, 0xB7, 0x68, 0x38, 0x6C,
  0xBC, 0xFC, 0x87, 0x00, 0x07, 0x0F, 0x12, 0x22, 0x22, 0x3E, 0x20, 0x10, 0x0F, 0x87, 0x00, 0x07,
  0x80, 0x40, 0x28, 0x34, 0x34, 0x28, 0x40, 0x80, 0x87, 0x00, 0x02, 0x03, 0x37, 0x7C, 0x82, 0x7B,
  0x01, 0x7C, 0x7F, 0x87, 0x00, 0x02, 0xC0, 0xEC, 0x3E, 0x82, 0xDE, 0x01, 0x3E, 0xFE, 0x87, 0x00,
  0x07, 0x18, 0x28, 0x40, 0xFE, 0xFB, 0x7A, 0x76, 0x3C, 0x87, 0x00, 0x07, 0x18, 0x14, 0x02, 0x7F,
  0xFB, 0x7A, 0x76, 0x3C, 0x87, 0x00, 0x07, 0x70, 0x79, 0x7E, 0x7F, 0x7E, 0x7F, 0x78, 0x70, 0x88,
  0x00, 0x05, 0x81, 0x7F, 0xFF, 0xAF, 0xFF, 0x01, 0x88, 0x00, 0x00, 0x1E, 0x82, 0x3F, 0x02, 0x1F,
  0x0F, 0x03, 0x88, 0x00, 0x07, 0x3C, 0x7A, 0x7A, 0xF6, 0xFC, 0xF8, 0xE0, 0x80, 0x82, 0x00, 0x1F,
  0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00,
  0x00, 0x80, 0x00, 0x80, 0x00, 0x80, 0x00, 0x80, 0x00, 0x80, 0x00, 0x80, 0x00, 0x80, 0x00, 0x80,
  0x86, 0x00, 0x01, 0x55, 0xAA, 0x8D, 0x00, 0x01, 0x55, 0xAA, 0x8E, 0x00, 0x81, 0x30, 0x04, 0x38,
  0x1F, 0x02, 0x02, 0x06, 0x88, 0x00, 0x81, 0x84, 0x04, 0xC4, 0xF8, 0x40, 0x40, 0x60, 0x88, 0x00,
  0x81, 0x30, 0x04, 0x38, 0x1F, 0x04, 0x04, 0x0C, 0x88, 0x00, 0x81, 0x84, 0x04, 0xC4, 0xF8, 0x20,
  0x20, 0x30, 0x88, 0x00, 0x81, 0x30, 0x03, 0x38, 0x1F, 0x04, 0x0C, 0x89, 0x00, 0x81, 0x84, 0x03,
  0xC4, 0xF8, 0x20, 0x30, 0x89, 0x00, 0x81, 0x30, 0x04, 0x38, 0x1F, 0x04, 0x04, 0x0C, 0x88, 0x00,
  0x81, 0x84, 0x04, 0xC4, 0xF8, 0x20, 0x20, 0x30, 0x88, 0x00, 0x81, 0x21, 0x04, 0x23, 0x1F, 0x04,
  0x04, 0x0C, 0x88, 0x00, 0x81, 0x0C, 0x04, 0x1C, 0xF8, 0x20, 0x20, 0x30, 0x88, 0x00, 0x81, 0x21,
  0x04, 0x23, 0x1F, 0x02, 0x02, 0x06, 0x88, 0x00, 0x81, 0x0C, 0x04, 0x1C, 0xF8, 0x40, 0x40, 0x60,
  0x88, 0x00, 0x81, 0x21, 0x03, 0x23, 0x1F, 0x04, 0x0C, 0x89, 0x00, 0x81, 0x0C, 0x03, 0x1C, 0xF8,
  0x20, 0x30, 0x89, 0x00, 0x81, 0x21, 0x04, 0x23, 0x1F, 0x04, 0x04, 0x0C, 0x88, 0x00, 0x81, 0x0C,
  0x04, 0x1C, 0xF8, 0x20, 0x20, 0x30, 0x88, 0x00, 0x81, 0x21, 0x04, 0x23, 0x1F, 0x04, 0x04, 0x0C,
  0x88, 0x00, 0x81, 0x0C, 0x10, 0x1C, 0xF8, 0x20, 0x20, 0x30, 0x00, 0x00, 0x1F, 0x0F, 0x00, 0x0F,
  0x00, 0x4F, 0x7F, 0x06, 0x06, 0x1C, 0x85, 0x00, 0x09, 0xF8, 0xF0, 0x00, 0xF0, 0x00, 0xF2, 0xFE,
  0x30, 0x30, 0xE0, 0x8D, 0x00, 0x05, 0x21, 0x23, 0x1F, 0x04, 0x04, 0x0C, 0x89, 0x00, 0x05, 0x0C,
  0x1C, 0xF8, 0x20, 0x20, 0x30, 0x8A, 0x00, 0x04, 0x23, 0x1F, 0x04, 0x04, 0x0C, 0x8A, 0x00, 0x04,
  0x1C, 0xF8, 0x20, 0x20, 0x30, 0x8B, 0x00, 0x03, 0x1F, 0x04, 0x04, 0x0C, 0x8B, 0x00, 0x03, 0xF8,
  0x20, 0x20, 0x30, 0x8C, 0x00, 0x81, 0x04, 0x00, 0x0C, 0x8C, 0x00, 0x81, 0x20, 0x09, 0x30, 0x00,
  0x00, 0x1F, 0x0F, 0x00, 0x0F, 0x00, 0x4F, 0x7F, 0x88, 0x00, 0x06, 0xF8, 0xF0, 0x00, 0xF0, 0x00,
  0xF2, 0xFE, 0x87, 0x00, 0xFF};
 
const int SPRITESINITSIZE = 128;

const byte GHOSTGAMEZONE[] = {
  0x68, 0x68, 0x68, 0x68, 0x01, 0x09, 0x09, 0x11, 0x0D, 0xFD, 0xFD, 0x0E, 0x09, 0x09, 0x09, 0x11,
  0x12, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x11, 0x12, 0x09, 0x09, 0x04, 0x68, 0x68, 0x68, 0x68,
  0x68, 0x68, 0x68, 0x68, 0x02, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
  0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0x05, 0x68, 0x68, 0x68, 0x68,
  0x68, 0x68, 0x68, 0x68, 0x02, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
  0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0x05, 0x68, 0x68, 0x68, 0x68,
  0x68, 0x68, 0x68, 0x68, 0x02, 0xFF, 0xFF, 0x25, 0x07, 0x0B, 0x0B, 0x0B, 0x0C, 0xFF, 0xFF, 0x23,
  0x2B, 0xFF, 0xFF, 0x14, 0x0C, 0xFF, 0xFF, 0x23, 0x2D, 0xFF, 0xFF, 0x05, 0x68, 0x68, 0x68, 0x68,
  0x68, 0x68, 0x68, 0x68, 0x02, 0xFF, 0xFF, 0x26, 0x12, 0x09, 0x09, 0x11, 0x2C, 0xFE, 0xFE, 0x24,
  0x2C, 0xFE, 0xFE, 0x24, 0x2C, 0xFE, 0xFE, 0x24, 0x2E, 0xFF, 0xFF, 0x05, 0x68, 0x68, 0x68, 0x68,
  0x68, 0x68, 0x68, 0x68, 0x02, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF,
  0xFE, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0x05, 0x68, 0x68, 0x68, 0x68,
  0x68, 0x68, 0x68, 0x68, 0x02, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF,
  0xFE, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0x05, 0x68, 0x68, 0x68, 0x68,
  0x68, 0x68, 0x68, 0x68, 0x07, 0xFF, 0xFF, 0x23, 0x2F, 0xFF, 0xFF, 0x27, 0x2B, 0xFF, 0xFF, 0x23,
  0x2B, 0xFF, 0xFF, 0x23, 0x2B, 0xFF, 0xFF, 0x23, 0x07, 0x0B, 0x0B, 0x13, 0x68, 0x68, 0x68, 0x68,
  0x19, 0x09, 0x09, 0x09, 0x0A, 0xFE, 0xFE, 0x24, 0x5C, 0xFE, 0xFE, 0x5E, 0x12, 0xFE, 0xFE, 0x15,
  0x0A, 0xFE, 0xFE, 0x11, 0x12, 0xFE, 0xFE, 0x24, 0x12, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x1B,
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0x05, 0x02, 0xFF, 0xFF, 0xFF,
  0xFF, 0xFF, 0xFF, 0x05, 0x02, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0x05, 0x02, 0xFF, 0xFF, 0xFF,
  0xFF, 0xFF, 0xFF, 0x05, 0x02, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
  0x1A, 0x0B, 0x0B, 0x0B, 0x0C, 0xFF, 0xFF, 0x23, 0x2B, 0xFF, 0xFF, 0x13, 0x5F, 0xFF, 0xFF, 0x61,
  0x62, 0xFF, 0xFF, 0x5B, 0x07, 0xFF, 0xFF, 0x23, 0x2B, 0xFF, 0xFF, 0x14, 0x0B, 0x0B, 0x0B, 0x1C,
  0x19, 0x09, 0x18, 0x20, 0x0A, 0xFE, 0xFE, 0x24, 0x2C, 0xFE, 0xFE, 0x24, 0x5C, 0xFE, 0xFE, 0x5D,
  0x5C, 0xFE, 0xFE, 0x5D, 0x2C, 0xFE, 0xFE, 0x24, 0x2C, 0xFE, 0xFE, 0x15, 0x09, 0x18, 0x20, 0x1B,
  0x68, 0x68, 0x1D, 0x1E, 0xFF, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF,
  0xFE, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0x1D, 0x1E, 0x68,
  0x68, 0x68, 0x1D, 0x1E, 0xFF, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF,
  0xFE, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0x1D, 0x1E, 0x68,
  0x1A, 0x0B, 0x21, 0x22, 0x0C, 0xFF, 0xFF, 0x23, 0x2B, 0xFF, 0xFF, 0x23, 0x2B, 0xFF, 0xFF, 0x14,
  0x2F, 0xFF, 0xFF, 0x27, 0x2B, 0xFF, 0xFF, 0x23, 0x2B, 0xFF, 0xFF, 0x14, 0x0B, 0x21, 0x22, 0x1C,
  0x68, 0x68, 0x68, 0x68, 0x12, 0xFE, 0xFE, 0x11, 0x12, 0xFE, 0xFE, 0x24, 0x2C, 0xFE, 0xFE, 0x11,
  0x60, 0xFE, 0xFE, 0x5D, 0x2C, 0xFE, 0xFE, 0x11, 0x12, 0xFE, 0xFE, 0x11, 0x68, 0x68, 0x68, 0x68,
  0x68, 0x68, 0x68, 0x68, 0x02, 0xFF, 0xFF, 0x05, 0x02, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0x05,
  0x02, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0x05, 0x02, 0xFF, 0xFF, 0x05, 0x68, 0x68, 0x68, 0x68,
  0x68, 0x68, 0x68, 0x68, 0x02, 0xFF, 0xFF, 0x05, 0x02, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0x05,
  0x02, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0x05, 0x02, 0xFF, 0xFF, 0x05, 0x68, 0x68, 0x68, 0x68,
  0x68, 0x68, 0x68, 0x68, 0x02, 0xFF, 0xFF, 0x05, 0x07, 0xFF, 0xFF, 0x23, 0x2B, 0xFF, 0xFF, 0x13,
  0x07, 0xFF, 0xFF, 0x23, 0x2B, 0xFF, 0xFF, 0x13, 0x02, 0xFF, 0xFF, 0x05, 0x68, 0x68, 0x68, 0x68,
  0x68, 0x68, 0x68, 0x68, 0x02, 0xFF, 0xFF, 0x26, 0x2C, 0xFE, 0xFE, 0x24, 0x2C, 0xFE, 0xFE, 0x15,
  0x0A, 0xFE, 0xFE, 0x24, 0x2C, 0xFE, 0xFE, 0x24, 0x2E, 0xFF, 0xFF, 0x05, 0x68, 0x68, 0x68, 0x68,
  0x68, 0x68, 0x68, 0x68, 0x02, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF,
  0xFF, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0x05, 0x68, 0x68, 0x68, 0x68,
  0x68, 0x68, 0x68, 0x68, 0x02, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF,
  0xFF, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFE, 0xFF, 0xFF, 0x05, 0x68, 0x68, 0x68, 0x68,
  0x68, 0x68, 0x68, 0x68, 0x03, 0x0B, 0x0B, 0x13, 0x07, 0x0B, 0x0B, 0x13, 0x07, 0x0B, 0x0B, 0x0B,
  0x0B, 0x0B, 0x0B, 0x13, 0x0F, 0xFD, 0xFD, 0x17, 0x07, 0x0B, 0x0B, 0x06, 0x68, 0x68, 0x68, 0x68};

