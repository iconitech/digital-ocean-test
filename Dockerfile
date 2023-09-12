FROM quay.io/keycloak/keycloak:22.0.0

COPY ./event-listener-http-jar-with-dependencies.jar /opt/keycloak/providers/
#COPY ./org.infinispan.infinispan-commons-jakarta-14.0.10.Final.jar /opt/keycloak/lib/lib/main/
#COPY ./org.infinispan.infinispan-core-jakarta-14.0.10.Final.jar /opt/keycloak/lib/lib/main/


RUN /opt/keycloak/bin/kc.sh build --features-disabled="fips"

COPY ./jgroups.properties /opt/keycloak/conf/

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start --proxy=edge --hostname-strict=false"]
