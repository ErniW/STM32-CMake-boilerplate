## STM32 CMake boilerplate

**A basic boilerplate code.**
- It sets the CMake environment.
- It includes necessary files for STM32F446RE board (linker, svd, startup, system, header).
- Builds the binary file to upload with STLink.

*Please be aware that the boilerplate is made for STM32F446RE but you can simply change the files.*

**Required libraries:**
- Arm-none-eabi toolchain.
- Make and CMake.
- ST-Link.

**Setup:**
1. Set the `CMSIS_DIR` directory in `CMakeLists.txt` to `CMSIS/include` (or copy that folder to CMSIS folder).
2. Make sure to include in system PATH all required libraries (on Windows).
3. To change the microcontroller create STM32F446RE folder with similar structure but switch names in `CMakeLists.txt` both in MCU folder and main CMake file.
4. Set MCU parameters and correct files in main `CMakeLists.txt`.
5. Project name must match with `makefile`.

**How to use:**
1. Run `make init` to prepare build system.
2. Run `make compile` to compile.
3. Run `make upload` to upload the code (`make compile upload` does both).

After uploading the build-in LED should blink.

*I've spend a few days to figure this out from scratch. Please be aware there are many possible issues if it doesn't work on your computer, not necessairly with this code itself. Tested in VS Code.*