#!/usr/bin/env bash


SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

echo -e "\n  build-libs.sh  \n"




#
# Download External Static Libraries:
#

echo -e "Checking external libraries: \n"


#
#
#
EXT_LIB_DIR="$SCRIPT_DIR/ext"
if [[ ! -d "$EXT_LIB_DIR" ]]; then
	mkdir "$EXT_LIB_DIR"
	echo -e "  INFO: Created external libraries dir: $EXT_LIB_DIR \n"
fi


#
#
#
IMGUI_DIR="$EXT_LIB_DIR/imgui"
IMGUI_REPO='https://github.com/ocornut/imgui.git'
echo -e "  Checking external library: imgui"
if [[ ! -d "$IMGUI_DIR" ]]; then
	echo "    Could not find source directory: $IMGUI_DIR"
	echo "    Downloading from: $IMGUI_REPO"
	CLONE_CMD="git clone $IMGUI_REPO $IMGUI_DIR"
	$CLONE_CMD
	if [[ "$?" -ne 0 ]]; then
		echo -e "\n  ERROR: Failed to clone the repo."
		echo "  The library can be downloaded manually with the command: "
		echo -e "\n  $CLONE_CMD \n"
		exit 1
	fi
	echo "    Download complete."
fi
echo -e "  Using: $IMGUI_DIR \n"


echo -e "External libraries are all available. \n"




#
# Build Shared Libraries:
#

echo -e "Building C++ libraries with Conan: \n"


BUILD_CMD="conan install . --build=missing"
echo "Conan build command: $BUILD_CMD"
$BUILD_CMD
if [[ "$?" -ne 0 ]]; then
	echo -e "\n  ERROR: Failed to build the required libraries. \n"
	echo -e "  Check the system is configured with the required build tools. \n"
	exit 1
fi
echo -e "\nConan build command completed successfully."


echo -e "C++ Libraries were built successfully. \n"




#
# Display Library Info:
#

exit 0
