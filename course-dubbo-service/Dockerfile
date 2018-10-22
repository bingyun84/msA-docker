FROM hub.idig88.com:8888/micro-service/java:openjdk-8
MAINTAINER liming www.idig8.com

COPY target/course-dubbo-service-1.0-SNAPSHOT.jar /course-dubbo-service.jar

ENTRYPOINT ["java","-jar","/course-dubbo-service.jar"]