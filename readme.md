# Anagramarama 0.9 — ArcaOS/OS2 Port

Anagramarama is a free word puzzle game. A scrambled 7-letter word is displayed;
you must guess as many valid anagrams of that word as possible before the 5-minute
clock runs out. Finding the original 7-letter word advances you to the next puzzle.

- **Original game:** Colm Gallagher / [Identical Games](http://identicalsoftware.com/anagramarama/)
- **ArcaOS/OS2 SDL2 port:** Martin Iturbide
- **License:** GNU General Public License v2 or later

---

## Requirements

| Component | Notes |
|-----------|-------|
| ArcaOS 5.0+ | (or eComStation 2.x with DIVE support) |
| SDL2.dll | SDL2 for OS/2 |
| SDL2_image.dll | SDL2_image for OS/2 |
| SDL2_mixer.dll | SDL2_mixer for OS/2 |

The SDL2 DLLs must be on the `LIBPATH` or in the same directory as `anagramarama.exe`.

---

## Installation

Extract the archive so the layout is:

```
anagramarama.exe
anagramarama.def
audio\
i18n\
    en_GB\
        images\
        wordlist.txt
```

Run `anagramarama.exe` from a command prompt or double-click it.

---

## Controls

### Mouse

| Click target | Action |
|---|---|
| Letter in shuffle row | Move to answer row |
| Letter in answer row | Move back to shuffle row |
| ENTER button | Submit guess |
| CLEAR button | Clear current guess |
| SHUFFLE button | Shuffle remaining letters |
| SOLVE button | Reveal all answers |
| NEW button | Start a new game |
| QUIT button | Quit |

### Keyboard

| Key | Action |
|-----|--------|
| `a`–`z` | Move first matching letter from shuffle row to answer row |
| Space | Shuffle remaining letters |
| Enter | Submit guess |
| Backspace | Remove last letter from answer row |
| Escape | Clear current guess |
| F1 | Toggle fullscreen / windowed |

---

## Languages

The game ships with English (en\_GB), French (fr), Italian (it), and Brazilian
Portuguese (pt\_BR) word lists.

To select a language, set `LANG` before running:

```
SET LANG=fr
anagramarama.exe
```

Supported values: `en_GB`, `fr`, `it`, `pt_BR`. Default is `en_GB`.

---

## Building from Source

**Requirements:** GCC 9.2 / kLIBC (ArcaOS), GNU Make, SDL2 development headers.

```
compile-anagramarama.cmd
```

The script sets `EMXOMFLD_TYPE`, `EMXOMFLD_LINKER`, and `EMXOMFLD_PRELINK`,
then runs `make -f Makefile.os2` inside `src\`. The build log is written to
`src\compile-anagramarama.log`.

---

## Port Notes

This port compiles the upstream SDL2 codebase (version 0.9) for ArcaOS without
changes to game logic.

### Key OS/2 adaptations

- **Build system:** `CMakeLists.txt` replaced with `Makefile.os2` and
  `compile-anagramarama.cmd` targeting the GCC 9.2 / OMF / WLINK toolchain.
- **SDL2 headers:** Include path extended to `C:/usr/include/SDL2` to match the
  flat `#include <SDL.h>` style used by the upstream source.
- **Fullscreen:** F1 uses `SDL_WINDOW_FULLSCREEN_DESKTOP` instead of
  `SDL_WINDOW_FULLSCREEN`, which is better supported by the OS/2 DIVE backend.
- **Module definition:** `anagramarama.def` sets the `WINDOWAPI` subsystem and
  embeds BLDLEVEL version information readable by `bldlevel.exe`.

## Links
- https://github.com/OS2World/GAME-SDL-PUZZLE-anagramarama