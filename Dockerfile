FROM openjdk:8
COPY . /ambari

RUN \
    apt-get update && \
    apt-get install -y maven g++ rpm librpmbuild8 python-dev vim && \
    wget https://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11-py2.7.egg#md5=fe1f997bc722265116870bc7919059ea && \
    sh setuptools-0.6c11-py2.7.egg && \
    rm -f /ambari/Dockerfile

WORKDIR /ambari

ENV AMBARI_VERSION=2.7.5.0.0

RUN \
    mvn versions:set -DnewVersion=${AMBARI_VERSION} && \
    pushd ambari-metrics && mvn versions:set -DnewVersion=${AMBARI_VERSION} && popd && \
    pushd ambari-infra && mvn versions:set -DnewVersion=${AMBARI_VERSION} && popd && \
    mvn -B clean install package jdeb:jdeb -Dviews -DskipTests -Dpython.ver="python >= 2.6" -Preplaceurl && \
    cd ./ambari-infra/ && mvn clean package -Dbuild-deb -DskipTests && \
    cd ./../ambari-metrics && mvn clean package -Dbuild-deb -DskipTests

RUN \
   mkdir -p /artifacts && \
   mv /ambari/ambari-server/target/*.deb /artifacts/                            && \
   mv /ambari/ambari-agent/target/*.deb /artifacts/                             && \
   mv /ambari/ambari-infra/ambari-infra-assembly/target/*.deb /artifacts/       && \
   mv /ambari/ambari-metrics/ambari-metrics-assembly/target/*.deb /artifacts/
