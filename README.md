## STM32 CMake boilerplate

**A basic boilerplate code.**
- It sets the CMake environment.
- It includes necessary files for STM32F446RE board.
- Builds the binary file to upload with STLink.

*I've spend a few days to figure this out from scratch. Please be aware there are many possible issues if it doesn't work on your computer, not necessairly with this code itself.*

### Things you need to do (on Ubuntu):
1. Set the CMSIS directory, or copy the files to CMSIS/Include folder. Project is set for STM32F446RE so you have to change the files for different board.
2. Run `build_cmake.sh`. It will setup the CMake into build folder. (on Windows, in build folder you have to build it manually, check the commands inside this file).
3. Run `make compile upload` to first compile the code, then upload to STM32. On windows you have to change the st-flash dir in makefile.