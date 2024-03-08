#!/usr/bin/sh

mkdir -p build;
cd build && conan install .. \
	-s build_type=Release \
	-s compiler.cppstd=gnu17 \
	--output-folder=. \
	--build missing \
