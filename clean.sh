#!/usr/bin/env bash

echo -e "\nStarting Cleanup: \n"


echo -e "  Cleaning up CMake files..."
rm -rf CMakeCache.txt CMakeFiles/ Makefile cmake_install.cmake
echo "  Done."

echo -e "\n  Cleaning up Conan build files..."
rm -rf conanbuildinfo.* conaninfo.txt
echo "  Done."

echo -e "\n  Cleaning up external library files..."
rm -rf ext/
echo "  Done."

if [[ -f engine.sln ]]; then
	echo -e "\n  Cleaning up Visual Studio project files..."
	rm -rf engine.sln *.vcxproj* *.VC.db lib/ x64/ engine.dir
	echo "  Done."
fi

echo -e "\n  Cleaning up binary files..."
rm -rf bin/
echo "  Done."


echo -e "\nCleanup completed successfully. \n"
exit 0
