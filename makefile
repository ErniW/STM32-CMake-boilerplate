PROJECT_NAME = blink

MAKEFLAGS += --no-print-directory

init-linux:
	rm -rf build
	mkdir build
	cmake -S . -B build

init-windows:
	rmdir /S /Q build
	mkdir build
	cmake -G "MinGW Makefiles" -S . -B build

compile:
	cmake --build ./build

upload:
	st-flash --reset write ./bin/$(PROJECT_NAME).bin 0x8000000