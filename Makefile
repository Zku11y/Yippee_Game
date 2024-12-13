install:
	curl -L -O https://github.com/godotengine/godot/releases/download/4.3-stable/Godot_v4.3-stable_macos.universal.zip
	unzip Godot_v4.3-stable_macos.universal.zip
	rm -fr Godot_v4.3-stable_macos.universal.zip

info:
	@echo "to install godot type make"
	@echo "to launch godot type make godot and enjoy :D"

godot:
	~/Godot.app/Contents/MacOS/Godot
