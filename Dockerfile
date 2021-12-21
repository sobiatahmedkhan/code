
FROM openjdk
COPY ./target/java-maven-app-1.1.0-SNAPSHOT.jar /
# RUN java -jar java-maven-app-1.1.0-SNAPSHOT.jar
RUN pwd
ENTRYPOINT [ "java","-jar" , "java-maven-app-1.1.0-SNAPSHOT.jar" ]