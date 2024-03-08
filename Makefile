SHELL:=/usr/bin/bash

#Name of executable
EXC_NAME::=test
override EXC_NAME::=$(EXC_NAME).out
MYLIB_NAME::=my_lib
CONFIGURED_FILES_DIR::=configured_files

#name of target to build
WTARGET::=test.out

dependency_graph:
	cd build && \
	cmake .. --graphviz=graph.dot && dot -Tpng graph.dot -o dep_graph.png

.clean:
	@rm -rf build

.prepare: .clean
	@mkdir build

.deps:
	@cd build && conan install .. \
		-s build_type=Release \
		-s compiler.cppstd=gnu17 \
		--output-folder=. \
		--build missing

.generate: .deps
	@cmake  \
	-DEXECUTABLE_NAME:STRING=$(EXC_NAME) \
	-DMYLIB_NAME:STRING=$(MYLIB_NAME) \
	-DCONFIGURED_FILES_DIR:STRING=$(CONFIGURED_FILES_DIR) \
	-B build .

.generate_with_warnerrs: .deps
	@cmake  \
	-DWARNINGS_ENABLED_AS_ERROR:BOOL=ON \
	-DEXECUTABLE_NAME:STRING=$(EXC_NAME) \
	-DMYLIB_NAME:STRING=$(MYLIB_NAME) \
	-DCONFIGURED_FILES_DIR:STRING=$(CONFIGURED_FILES_DIR) \
	-B build .

.generate_strict: .deps
	@cmake  \
	-DCMAKE_BUILD_TYPE=Release \
	-DSANITIZE_ENABLED:BOOL=ON \
	-DWARNINGS_ENABLED_AS_ERROR:BOOL=ON \
	-DEXECUTABLE_NAME:STRING=$(EXC_NAME) \
	-DMYLIB_NAME:STRING=$(MYLIB_NAME) \
	-DCONFIGURED_FILES_DIR:STRING=$(CONFIGURED_FILES_DIR) \
	-B build .

.build:
	@make --silent -C build/
	@mv ./build/app/$(EXC_NAME) .

.reset: .prepare .deps

.docs:
	@make --silent -C build/ docs

re: .prepare .generate .build

.PHONY: .prepare .deps .generate .generate_with_warnerrs .generate_strict .clean .build
