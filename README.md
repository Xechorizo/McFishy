
# [Download McFishy 1.0](https://github.com/Xechorizo/McFishy/blob/master/McFishy.ahk)

### Made by Xech
- Written for Minecraft 1.16.2 Java Edition - Authored August 2020

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=Q6EZY28VVDGCL&currency_code=USD&source=url)


## Readme
### What does it do?
- This tool uses AutoHotKey (AHK), Tesseract Optical Character Recognition (OCR), and Subtitles in Minecraft to allow AFK fishing after the 1.16 nerf.
- No redstone is needed, but a Mending fishing rod is recommended.

### How do I set it up?
- Download and install [AutoHotkey](https://www.autohotkey.com/download/ahk-install.exe).
- Download and extract [Capture2Text 3.9](https://versaweb.dl.sourceforge.net/project/capture2text/Capture2Text/Capture2Text_v3.9/Capture2Text_v3.9.zip).
- Download the [McFishy](https://github.com/Xechorizo/McFishy/blob/master/McFishy.ahk) script.
- Open the script in a text editor, and change the paths for **Capture2Text.exe** and **ocr.txt**. Variable names are **FullC2TPath** and **FullOCRPath**.

### How do I use it?
- Open **Minecraft 1.16.2** or later.
- Ensure **Subtitles** are on (Options... Accessibility Settings... Show Subtitles: ON).
- Run the **McFishy** script. A sound plays when **McFishy** starts.
- Click on **Minecraft** so it's the active window.
- **Cast** your rod in [open water](https://minecraft.gamepedia.com/Fishing#Junk_and_treasure).
- Press **ALT SHIFT F** to start OCR. Drag a box around the subtitles area. A sound plays when OCR starts.
- **IMPORTANT!** The box must be big enough for the subtitle "**Fishing Bobber splashes**" on any line.
- **IMPORTANT!** The box must not be *too* big, or OCR will be slow and fish can get away.
- Right-click sends to **Minecraft** when OCR reads "**Fish**" in the OCR box, and again after 4.5 seconds to recast.
- **IMPORTANT!** Subtitles must be visible. Other windows or screensavers covering subtitles will make OCR fail.
- Press **ALT SHIFT Q** to stop OCR. A sound plays when OCR stops. Sart again with **ALT SHIFT F** if desired.
- Press **ALT SHIFT X** to exit **McFishy**. A sound plays when **McFishy** exits.

### How does it work?
- **AutoHotKey** listens for hotkeys.
- **AutoHotKey** then runs **Capture2Text.exe**.
- **Capture2Text.exe** reads subtitles in the dragged box.
- **Capture2Text.exe** writes the subtitles to **ocr.txt**.
- **AutoHotKey** checks **ocr.txt** for the word **Fish**.
- If found, **AutoHotKey** sends right-clicks to **Minecraft**.

## Change Log

#### 1.0
- Initial release

#### Future:
- Nothing yet!

## Disclosure
### *PROVIDED AS-IS WITH NO GUARANTEE EXPRESS OR IMPLIED*
