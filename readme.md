Working on a template with basic functionality that I can use for game jams.

Want:
- [x] Scenes manager
- [ ] Save system with:
	- [x] Save, load, reset game -> Resetting a game will be done by the GameData, the SavesManager just takes care of replacing a slot with empty data or smth
	- [ ] .tmp corruption protection, at least a basic ones
	- [x] Slots system, at last 3 datestamped previous .bak files per slot
	- [x] Export, import savefiles with native file pickers -> Web builds work a little different, need JavaScript
- [ ] Various game screens and enstablished flow
	- [x] Main menu
	- [x] Game
	- [x] Settings
		- [ ] In-game settings with import / export, back to main menu
		- [ ] Title screen settings with just music and sfx controls
- [ ] Options menu with accessibility controls
	- [ ] Separate config file to create, load, and save back
	- [ ] Reset to default
- [ ] Audio setup
	- [x] Main background music player
	- [ ] Separate SFX manager 
- [ ] Translation support right off the bat
- [ ] Responsive landscape layout with proper margins for mobile devices, and proper UI scale

### Devlog:
- 2023-03-31
	- Watching a ton of videos about save systems
	- Setting up this project with some pseudocode
- 2023-04-01
	- Watching a ton of tutorials on pretty much anything lmao
	- Started work on the scenes manager
	- Defined other important screens
- 2023-04-02
	- Learning about localization
- 2023-04-03
	- Adding save and load
	- Added download savegame
- 2023-04-04
	- Finished setting up HTML5 File Dialogs
- 2023-04-05
	- Added an on-screen debugger option to check stuff on mobile
	- Started fiddling with screen sizes
	- Troubleshooting the web export not working on iOS
