# DarkHelp - C++ helper class for Darknet's C API.
# Copyright 2019-2020 Stephane Charette <stephanecharette@gmail.com>
# MIT license applies.  See "license.txt" for details.
# $Id: CM_dependencies.cmake 3059 2020-10-04 19:59:51Z stephane $


FIND_PACKAGE ( Threads			REQUIRED	)
FIND_PACKAGE ( OpenCV	CONFIG	REQUIRED	)

# vcpkg was causing problems -- see docs for details
#FIND_PACKAGE ( Darknet CONFIG REQUIRED )
FIND_LIBRARY ( Darknet darknet )

SET ( StdCppFS "" )

IF (NOT WIN32)
	FIND_LIBRARY ( Magic magic ) # sudo apt-get install libmagic-dev

	# On older 18.04, we need to use "experimental/filesystem" instead of "filesystem"
	# and we need to pass in the -lstdc++fs flag when linking.  This seems to have no
	# impact even when using newer versions of g++ which technically doesn't need this
	# to link.  (Does this need to be fixed in a different manner?)
	SET ( StdCppFS stdc++fs	)
ENDIF ()

FIND_PATH ( TCLAP_INCLUDE_DIRS "tclap/Arg.h" ) # sudo apt-get install libtclap-dev

INCLUDE_DIRECTORIES ( ${Darknet_INCLUDE_DIR}	)
INCLUDE_DIRECTORIES ( ${OpenCV_INCLUDE_DIRS}	)
INCLUDE_DIRECTORIES ( ${TCLAP_INCLUDE_DIRS}		)
