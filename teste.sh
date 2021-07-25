#!/bin/sh

shared=false

shortname=avdevice
name=lib${shortname}
fullname=${name}${build_suffix}
libs="-lTeste"
libdir=/usr/lib64
libs_cuda="-Wl,-Bstatic /usr/cuda/lib64/libcublasLt_static.a /usr/cuda/lib64/libcublas_static.a /usr/cuda/lib64/libcudadevrt.a /usr/cuda/lib64/libcudart_static.a /usr/cuda/lib64/libcufft_static_nocallback.a /usr/cuda/lib64/libcufftw_static.a /usr/cuda/lib64/libculibos.a /usr/cuda/lib64/libcurand_static.a /usr/cuda/lib64/libcusolver_static.a /usr/cuda/lib64/libcusparse_static.a /usr/cuda/lib64/liblapack_static.a /usr/cuda/lib64/libmetis_static.a /usr/cuda/lib64/libnppc_static.a /usr/cuda/lib64/libnppial_static.a /usr/cuda/lib64/libnppicc_static.a /usr/cuda/lib64/libnppidei_static.a /usr/cuda/lib64/libnppif_static.a /usr/cuda/lib64/libnppig_static.a /usr/cuda/lib64/libnppim_static.a /usr/cuda/lib64/libnppist_static.a /usr/cuda/lib64/libnppisu_static.a /usr/cuda/lib64/libnppitc_static.a /usr/cuda/lib64/libnpps_static.a /usr/cuda/lib64/libnvjpeg_static.a"
libs_nvidia="-Wl,-Bdynamic -L/usr/nvidia/lib -lGL -lEGL -lGLX -lnvcuvid"

echo -e "Name: $fullname"
echo -e "Libs: -L\${libdir} $($shared && echo -Wl,-Bdynamic -l${fullname#lib} || echo -Wl,-Bstatic /usr/lib64/${fullname}.a) $($shared || echo $libs_cuda $libs_nvidia $libs)"
echo -e "Libs.private: $($shared && echo $libs_cuda $libs_nvidia $libs)"
