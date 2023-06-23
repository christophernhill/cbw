#!/bin/bash
curl -O https://svante.mit.edu/'~cnh/d7/ddd.tgz'
tar -xzvf ddd.tgz
(mkdir -p foo; cd foo; tar -xvf ../mitgcm_and_dar7.tar)
(cd foo/dar7/build_1D; \rm -fr *; ../../tools/genmake2 -mods=../code_6+4+0_RT_1D)
(cd foo/dar7/build_1D; make)
(cd foo/dar7; mkdir -p run)
(cd foo/dar7/run; ln -s ../input_6+4+0_RT_1D/* .; ln -s ../build_1D/mitgcmuv .)
(cd foo/dar7/run; ./mitgcmuv )
