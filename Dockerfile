FROM drydockaarch64/u16all:master

ADD . /u16cppall

RUN /u16cppall/install.sh
