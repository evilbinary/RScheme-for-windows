# RScheme-for-windows
RScheme-for-windows run time library and example to call by c.

#使用说明
使用环境：mingw gcc
配置安装路径，比如安装在/usr/local/lib下。


export RS_INSTALL_DIR=/usr/local/lib/rs/0.7.3.4-b7u

export INSTALL_DIR=/usr/local/lib/rs/0.7.3.4-b7u

export PATH=$INSTALL_DIR:$PATH

cd sshell

make

./sshell


####在vs或者vc等IDE下使用需要加入以下库
librs.a libmingwex.a libdl.a libgcc.a libpsapi.a libmsvcr71.a libmold