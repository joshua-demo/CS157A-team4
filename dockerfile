# Use an official Tomcat runtime as a parent image
FROM tomcat:9.0-jdk17

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the Tomcat users file to enable the manager app
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

# Copy the web.xml file
COPY app/src/main/webapp/WEB-INF/web.xml /usr/local/tomcat/webapps/ROOT/WEB-INF/web.xml

# Install necessary build tools
RUN apt-get update && apt-get install -y ant

# Set the working directory
WORKDIR /usr/local/tomcat/webapps/ROOT

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]