FROM quay.io/keycloak/keycloak:22.0.0

COPY ./event-listener-http-jar-with-dependencies.jar /opt/keycloak/providers/

RUN /opt/keycloak/bin/kc.sh build --features-disabled="fips"

#ENV JGROUPS_DISCOVERY_PROTOCOL=dns.DNS_PING
#ENV JGROUPS_DISCOVERY_PROPERTIES=dns_query=

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start --proxy=edge --hostname-strict=false"]
