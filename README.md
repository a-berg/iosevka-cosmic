# Iosevka Cosmic

A custom version of the Iosevka font for my own use.

The font tends to be a bit more "roundy" in some instances and glyphs. There are 3 fonts defined:
Cosmic (monospaced), MilkyWay (quasi-proportional) and Andromeda (quasi-proportional + serif).

Switched to docker as a sustainable way to have the font up to date more easily.

---

Note: this repo uses `just`, a convenient script runner with lots of niceties, instead
of `make`. In order to use the justfile commands, install `just` using [any of the
available methods](https://just.systems/man/en/chapter_4.html).

Use `just --list` to view the commands available. Also, use `just --evaluate` to see
variables you could override in the command line (e.g. to target `ttf` use `just
target=ttf build`).
