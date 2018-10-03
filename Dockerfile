FROM open-liberty:microProfile2
MAINTAINER IBM Java engineering at IBM Cloud
ARG LICENSE_JAR_URL
RUN \ 
  if [ $LICENSE_JAR_URL ]; then \
    wget $LICENSE_JAR_URL -O /tmp/license.jar \
    && java -jar /tmp/license.jar -acceptLicense /opt/ibm \
    && rm /tmp/license.jar; \
  fi
RUN apt-get update -y && apt-get install -y curl
COPY /target/liberty/wlp/usr/servers/defaultServer /config/
