FROM hub.idig88.com:8888/micro-service/java:openjdk-8
MAINTAINER liming www.idig8.com

COPY target/gataway-zuul-1.0-SNAPSHOT.jar /gataway-zuul.jar

ENTRYPOINT ["java","-jar","/gataway-zuul.jar"]