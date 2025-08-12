# Use the official Tomcat 9 image with OpenJDK 11
FROM tomcat:9.0.104-jdk11

# Optional: Remove default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Optional: Add your WAR file (uncomment and replace with your actual war file)
COPY openmrs.war /usr/local/tomcat/webapps/openmrs.war

# Optional: Add custom configuration files if needed
COPY server.xml /usr/local/tomcat/conf/server.xml

COPY csrfguard.properties /root/.OpenMRS/csrfguard.properties

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]