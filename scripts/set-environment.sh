DEFAULT_ARCH="s390x"
DEFAULT_SOURCE_DIR="$HOME/projects"
DEFAULT_BUILD_DIR="$HOME/builds"

DEFAULT_V_CMAKE="3.28.3"
DEFAULT_COMPILER_V="12"
DEFAULT_CC="/usr/bin/$DEFAULT_ARCH-linux-gnu-gcc-$DEFAULT_COMPILER_V"
DEFAULT_CXX="/usr/bin/$DEFAULT_ARCH-linux-gnu-g++-$DEFAULT_COMPILER_V"
DEFAULT_RANLIB="/usr/bin/$DEFAULT_ARCH-linux-gnu-ranlib"

ORIGINAL_ARCH=$ARCH
ORIGINAL_SOURCE_DIR=$SOURCE_DIR
ORIGINAL_BUILD_DIR=$BUILD_DIR
ORIGINAL_V_CMAKE=${V_CMAKE}
ORIGINAL_COMPILER_V=${COMPILER_V}
ORIGINAL_CC=${CC}
ORIGINAL_CXX=${CXX}
ORIGINAL_RANLIB=${RANLIB}

display_help() {
	echo "Usage: $0 [options...]" >&2
	echo
	echo "    -h, --help                Display this message. Example: -h"
	echo "    -a, --architecture        Set target architecture. Example: -a s390x"
	echo "                              Default value is: $DEFAULT_ARCH"
	echo "    -s, --sources-dir         Set path to directory which contains all project sources. Example: -s \$HOME/projects"
	echo "                              Default value is: $DEFAULT_SOURCE_DIR"
	echo "    -b, --builds-dir          Set path to directory which contains all project builds. Example: -b \$HOME/builds"
	echo "                              Default value is: $DEFAULT_BUILD_DIR"
	echo "    -v, --verbose             Print result values of environment variables. Example: -v"
	echo "                              Default value is: off"
	echo "    -cmv, --cmake-version     Set cmake version. Example: -cmv 3.27.8"
	echo "                              Default value is: $DEFAULT_V_CMAKE"
	echo "    -cv, --compiler-version   Set compiler version. Example: -cv 12"
	echo "                              Default value is: $DEFAULT_COMPILER_V"
	echo "    -cc, --c-compiler         Set path to C compiler. Example: -cc /usr/bin/gcc"
	echo "                              Default value is: $DEFAULT_CC"
	echo "    -cxx, --cxx-compiler      Set path to C++ compiler. Example: -cxx /usr/bin/g++"
	echo "                              Default value is: $DEFAULT_CXX"
	echo "    -r, --ranlib              Set path to ranlib. Example: -r /usr/bin/ranlib"
	echo "                              Default value is: $DEFAULT_RANLIB"
	echo "    -rs, --reset              Reset all variables before setting them. Example: -rs"
	echo "                              Default value is: $DEFAULT_RANLIB"
	echo
	exit 1
}

reset_vars() {
	unset ARCH
	unset SOURCE_DIR
	unset BUILD_DIR
	unset V_CMAKE
	unset COMPILER_V
	unset CC
	unset CXX
	unset RANLIB
}

restore_original_values() {
	export ARCH=$ORIGINAL_ARCH
	export SOURCE_DIR=$ORIGINAL_SOURCE_DIR
	export BUILD_DIR=$ORIGINAL_BUILD_DIR
	export V_CMAKE=$ORIGINAL_V_CMAKE
	export COMPILER_V=$ORIGINAL_COMPILER_V
	export CC=$ORIGINAL_CC
	export CXX=$ORIGINAL_CXX
	export RANLIB=$ORIGINAL_RANLIB
}

set_defaults() {
	export ARCH="${ARCH:-$DEFAULT_ARCH}"
	export SOURCE_DIR="${SOURCE_DIR:-$DEFAULT_SOURCE_DIR}"
	export BUILD_DIR="${BUILD_DIR:-$DEFAULT_BUILD_DIR}"
	export V_CMAKE="${V_CMAKE:-$DEFAULT_V_CMAKE}"
	export COMPILER_V="${COMPILER_V:-$DEFAULT_COMPILER_V}"
	export CC="${CC:-/usr/bin/$ARCH-linux-gnu-gcc-$COMPILER_V}"
	export CXX="${CXX:-/usr/bin/$ARCH-linux-gnu-g++-$COMPILER_V}"
	export RANLIB="${RANLIB:-/usr/bin/$ARCH-linux-gnu-ranlib}"
}

print_envs() {
	echo "ARCH: $ARCH"
	echo "SOURCE_DIR: $SOURCE_DIR"
	echo "BUILD_DIR: $BUILD_DIR"
	echo "V_CMAKE: $V_CMAKE"
	echo "COMPILER_V: $COMPILER_V"
	echo "CC: $CC"
	echo "CXX: $CXX"
	echo "RANLIB: $RANLIB"
}

while [[ "$#" -gt 0 ]]; do
	case $1 in
	-h | --help)
		display_help
		;;
	-rs | --reset)
		reset_vars
		;;
	-v | --verbose)
		VERBOSE_FLAG="1"
		;;
	-a | --architecture)
		shift
		ARCH="$1"
		;;
	-s | --sources-dir)
		shift
		SOURCE_DIR="$1"
		;;
	-b | --builds-dir)
		shift
		BUILD_DIR="$1"
		;;
	-cmv | --cmake-v)
		shift
		V_CMAKE="$1"
		;;
	-cv | --compiler-v)
		shift
		COMPILER_V="$1"
		;;
	-cc | --c-compiler)
		shift
		CC="$1"
		;;
	-cxx | --cxx-compiler)
		shift
		CXX="$1"
		;;
	-r | --ranlib)
		shift
		RANLIB="$1"
		;;
	*)
		echo "Unknown parameter passed: $1"
		display_help
		;;
	esac
	shift
done

set_defaults

if [[ $VERBOSE_FLAG ]]; then
	print_envs
fi
