FROM centos:7

MAINTAINER Donald Simpson <donaldsimspon@gmail.com>


#
#
#

RUN yum update -y && yum groupinstall -y "Development Tools" && yum clean all

#
RUN mkdir /primesum
ADD https://dl.bintray.com/kimwalisch/primesum/primesum-1.0.tar.gz /primesum
RUN ls -al /primesum
#COPY primesum-1.0.tar.gz /primesum

#
RUN cd /primesum \
    && tar zxvf primesum-1.0.tar.gz \
    && /bin/rm /primesum/primesum-1.0.tar.gz \
    && cd /primesum/primesum-1.0 \
    && ./build.sh \
    && make install 

# add && make check \ above last line here when happy


#
#RUN primesum 1e14 --threads=4 --time

# Add Tini
ENV TINI_VERSION v0.10.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

# Run your program under Tini
CMD ["primesum", "1e14", "--threads=4", "--time"]
