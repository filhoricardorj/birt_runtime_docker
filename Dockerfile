FROM tomcat:9.0.91-jdk17-temurin

RUN apt-get update && apt-get install wget unzip zip -y

RUN wget "https://eclipse.c3sl.ufpr.br/birt/updates/release/4.14.0/downloads/birt-runtime-4.14.0-202312020807.zip" -P /tmp -O "/tmp/birt.zip"

RUN unzip "/tmp/birt.zip" -d "/tmp/birt"
RUN mv "/tmp/birt/birt.war" "/usr/local/tomcat/webapps/ROOT.war"

RUN rm "/tmp/birt.zip"
RUN rm -r "/tmp/birt"

RUN unzip "/usr/local/tomcat/webapps/ROOT.war" -d "/usr/local/tomcat/webapps/ROOT"
RUN rm "/usr/local/tomcat/webapps/ROOT.war"

# MySQL Connector
RUN wget "https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j-9.0.0.zip" -P "/tmp" -O "/tmp/mysql-connector-j-9.0.0.zip"
RUN unzip "/tmp/mysql-connector-j-9.0.0.zip" -d "/tmp"
RUN rm "/tmp/mysql-connector-j-9.0.0.zip"
RUN mv "/tmp/mysql-connector-j-9.0.0/mysql-connector-j-9.0.0.jar" "/usr/local/tomcat/webapps/ROOT/WEB-INF/lib"
RUN rm -r "/tmp/mysql-connector-j-9.0.0"

# MariaDB Connector
RUN wget "https://dlm.mariadb.com/3852266/Connectors/java/connector-java-3.4.1/mariadb-java-client-3.4.1.jar" -P "/usr/local/tomcat/webapps/ROOT/WEB-INF/lib" 

# PostgreSQL Connector
RUN wget "https://jdbc.postgresql.org/download/postgresql-42.7.3.jar" -P "/usr/local/tomcat/webapps/ROOT/WEB-INF/lib" 

RUN cd "/usr/local/tomcat" && ln -s "/etc/tomcat conf"

CMD ["catalina.sh", "run"]

EXPOSE 8080