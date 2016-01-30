# change if location is different
TILED = $$HOME/Applications/Tiled.app/Contents/MacOS/Tiled

MAPS_SRC = assets/maps/src/
MAPS_TARGET = assets/maps/build/
TMX_FILES = $(wildcard $(MAPS_SRC)*.tmx)

build:
# make maps build directory if it does not already exist
	@mkdir -p $(MAPS_TARGET)
	@echo "Exporting TMX maps to LUA"
	$(foreach file, $(TMX_FILES), $(TILED) --export-map "Lua files (*.lua)" $(file) $(patsubst $(MAPS_SRC)%.tmx, $(MAPS_TARGET)%.lua, $(file)); )
	@echo "Finished building"

.PHONY: build
