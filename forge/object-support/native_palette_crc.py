"""Unsigned-32 scalar transcription of Reach FUN_18006bd5c.

REA/Ghidra evidence ev_1980de16eacbd3f6e1f16d19f1e47d6b6c129f11dd96961f7e564b2780d093a6,
DLL SHA-256 738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894.
The native function hashes category, entry and variant COUNTS, not object names.
This code does not execute the DLL or modify any cache.
"""
MASK = 0xFFFFFFFF


def rotate(value, bits):
    value &= MASK
    return ((value << bits) | (value >> (32 - bits))) & MASK


def finish(a, b, c):
    c = ((c ^ b) - rotate(b, 14)) & MASK
    a = ((a ^ c) - rotate(c, 11)) & MASK
    b = ((b ^ a) - rotate(a, 25)) & MASK
    c = ((c ^ b) - rotate(b, 16)) & MASK
    a = ((a ^ c) - rotate(c, 4)) & MASK
    b = ((b ^ a) - rotate(a, 14)) & MASK
    return ((c ^ b) - rotate(b, 24)) & MASK


def palette_crc(categories):
    """Categories are lists of variant counts, one count for every entry slot."""
    base = 0xDEADBEF2
    value = finish((base + len(categories)) & MASK, base, base)
    for category in categories:
        for word in [len(category)] + list(category):
            base = (value + 0xDEADBEF3) & MASK
            value = finish((base + word) & MASK, base, base)
    return value
