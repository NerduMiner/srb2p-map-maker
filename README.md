# srb2p-map-maker
 Creates map data from a 48x48 palletted image that can be used in SRB2P

# Usage
This is to be used to facilitate development of Custom Dungeons in SRB2P that use the Expanded Custom Dungeon Code Pack mod(https://gamebanana.com/tools/10461) and also make use of specific floor layouts.<br/><br/>
Create a 48x48 png file, and then paint with the following colors to define specific dungeon floor features:
| Dungeon Feature | Color Code |
| --- | --- |
| T_WALL | #000000 |
| T_EMPTY | #ffffff |
| T_ITEM | #ffff00 |
| T_ENEMY | #ff0000 |
| T_START | #800080 |
| T_EXIT | #008000 |
| T_CHECKPOINT | #00ff00 |
| T_BOSS | #800000 |
| T_PIT | #808080 |
| T_RINGS | #daa520 |
| T_GOLDI | #ffd900 |
| T_SHOP | #00008b |
| T_SPIKES | #a9a9a9 |
| T_FLOORSPIKES | #c0c0c0 |
| T_GATE | #ff00ff |
| T_GOLDENEMY | #b8870b |
| T_NOSWITCH | #e0e0e0 |

Once you are ready to convert your image into map data provide the filepath of the png image to the tool via `srb2p-map-maker [path to .png file]`, or the filename of the PNG file if its next to the executable.

# Building
srb2p-map-maker requires a D compiler(DMD is recommended), downloads can be found at https://dlang.org/.<br/>Once installed, run `dub build` in your CLI/Terminal in the root directory of the repository to compile the project.
# Contributing
I have not yet established a consistent code style for this project. Keep this in mind if you decide to submit a pull request with features. I aim to keep with the D style, however https://dlang.org/dstyle.html

<br/>Thanks to Adam D. Ruppe for the arsd png library https://code.dlang.org/packages/arsd-official%3Apng
