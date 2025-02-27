###############################################################################

cmake --preset osx -S$PWD/llvm -B$PWD/build

cmake --build $PWD/build --target all
# cmake --build $PWD/build --target install

###############################################################################

export PATH="$PWD/build/bin:$PATH"

bash xyz_tests/add_intrinsic.sh

bash xyz_tests/add.sh

###############################################################################
