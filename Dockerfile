FROM openjdk:8
COPY . /ambari

RUN \
    apt-get update && \
    apt-get install -y maven g++ rpm librpmbuild8 python-dev vim && \
    wget https://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11-py2.7.egg#md5=fe1f997bc722265116870bc7919059ea && \
    sh setuptools-0.6c11-py2.7.egg && \
    rm -f /ambari/Dockerfile

WORKDIR /ambari

RUN \
    mvn versions:set-property -Dproperty=revision -DnewVersion=2.7.5.0.0 && \
    mvn -B clean install package jdeb:jdeb -Dviews -DskipTests -Dpython.ver="python >= 2.6" -Preplaceurl
