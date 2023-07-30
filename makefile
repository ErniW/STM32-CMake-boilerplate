PROJECT_NAME = blink

MAKEFLAGS += --no-print-directory

compile:
	cmake --build ./build

upload:
	st-flash --reset write ./bin/$(PROJECT_NAME).bin 0x8000000