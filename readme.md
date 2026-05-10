Working on a template with basic functionalities that I can use for game jams.

### Credits:
- Font: https://rurr.itch.io/tremolo-mono
- HTML5 File Dialog plugin: https://gitlab.com/mocchapi/godot-4-html5-file-dialogs

### To-do:
- [x] Auto stretch game area to fit whole screen, no black bars
- [x] Landscape only: prevent the game from being played if width < height
- [x] Settings
	- [x] Autosave and autoload config
	- [x] Music and SFX sliders to impact audio
- [x] Title
	- [x] New game / continue based on savegame being present
- [x] Global theme
- [x] Popup system with signals
- [x] Save to .tmp before .json
- [ ] Better documentation
- [ ] More output messages for debugging
- [ ] Export / import savefile
	- [ ] Test clipboard method instead of this file thing, could help ditch the plugin

### Devlog:
- 2026-03-31
	- Watching a ton of videos about save systems
	- Setting up this project with some pseudocode
- 2026-04-01
	- Watching a ton of tutorials on pretty much anything lmao
	- Started work on the scenes manager
	- Defined other important screens
- 2026-04-02
	- Learning about localization
- 2026-04-03
	- Adding save and load
	- Added download savegame
- 2026-04-04
	- Finished setting up HTML5 File Dialogs
- 2026-04-05
	- Added an on-screen debugger option to check stuff on mobile
	- Started fiddling with screen sizes
	- Troubleshooting the web export not working on iOS
- 2026-04-06
	- Spent my morning trying to debug stupid iOS issues. It works fine everywhere else
- 2026-04-07
	- Getting my shit together because the jam is in 3 days
- 2026-04-08
	- Finally getting some work done: music and sfx and config sorted out, new font, fixed viewport issues
- 2026-04-09
	- Adjusted sliders and fonts for pixel art style
	- Started working on popup manager, I want signals and buttons for "yes" and "no", and "next" use cases
	- Finished the popup manager basics, added buttons flair
- 2026-04-10
	- Temp file saving
	- Adjusted button flavor, bit hacky but it works
- 2026-05-10
	- Updating the template with feedback from my Space Druid jam
	- Pause menu now always loaded
	- Removing default assets
	- Removed debugger because... F12 exists on web
	- Merged ScenesConstants into the ScenesManager, didn't make sense to have them separate
	
