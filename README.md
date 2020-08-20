
# McFishy

### Made by Xech
- Written for Minecraft 1.16.2 Java Edition - Authored August 2020

## Readme
### What does it do?
- This tool uses AutoHotKey (AHK), Tesseract Optical Character Recognition (OCR), and Subtitles in Minecraft to allow AFK fishing after the 1.16 nerf. No redstone is needed, but a Mending fishing rod is recommended.

### How do I use it?
- Download and extract [Capture2Text 3.9](https://versaweb.dl.sourceforge.net/project/capture2text/Capture2Text/Capture2Text_v3.9/Capture2Text_v3.9.zip).
- Download and install [AutoHotkey](https://www.autohotkey.com/download/ahk-install.exe).
- Download the [McFishy](https://github.com/Xechorizo/McFishy/blob/dev/McFishy.ahk) script.
- Edit the paths 
- Open Minecraft 1.16.2 or later.
- Ensure Subtitles are on (Options... Accessibility Settings... Show Subtitles: ON)
- Run the McFishy script.
- A sound will play when the script starts.
- Click on Minecraft so that it's the active window (**IMPORTANT!**).
- Hit **ALT SHIFT F** to start OCR. Drag a box around the subtitles. Make sure the box is big enough for "Fishing Bobber splashes", but not so big that the script is slow (**IMPORTANT!**).
- A sound will play when the script begins OCR.
- Timed right-clicks will happen when OCR reads the word "Fish" within the box. If another window covers subtitles, or if screensaver comes on, OCR will fail (**IMPORTANT!**)
- Hit **ALT SHIFT Q** to stop OCR. You can start OCR again with **ALT SHIFT F** if you want.
- Hit **ALT SHIFT X** to exit the script.

### How does it work?
- A backup folder and backup script are created.
- A scheduled task is created that invokes the script.
- The task is triggered when the Astroneer is launched.
- The backup script copies save files when changed.
- Backups older than the backup lifetime are deleted.

## Change Log

#### 1.0
- Initial release

#### Future:

## Disclosure
### *PROVIDED AS-IS WITH NO GUARANTEE EXPRESS OR IMPLIED*
