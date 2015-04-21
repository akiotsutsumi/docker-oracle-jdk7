# pull base image
FROM akiotsutsumi/dockerfile-linux-centos6

# Maintainer
MAINTAINER Akio Tsutsumi <akiodeveloper@gmail.com>

# Environment variables required for this build
ENV ORACLE_JDK_URL=http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.rpm
ENV JDK_RPM=jdk-7u79-linux-x64.rpm
ENV DOWNLOAD_DIR=/tmp

# update package
RUN yum -y update

# install wget
RUN yum install -y wget

# download oracle jdk
RUN wget --quiet --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" $ORACLE_JDK_URL -P $DOWNLOAD_DIR

# install and config Oracle JDK
RUN rpm -ivh $DOWNLOAD_DIR/$JDK_RPM
ENV JAVA_HOME /usr/java/default
RUN rm $DOWNLOAD_DIR/$JDK_RPM

