FROM quay.io/keycloak/keycloak:22.0.0

RUN /opt/keycloak/bin/kc.sh build --features-disabled="fips" --cache=local --cache-stack=tcp

COPY ./event-listener-http-jar-with-dependencies.jar /opt/keycloak/providers/

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start --proxy=edge --hostname-strict=false"]
