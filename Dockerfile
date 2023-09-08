FROM quay.io/keycloak/keycloak:latest
RUN /opt/keycloak/bin/kc.sh build --db=postgres
ENTRYPOINT [ "/opt/keycloak/bin/kc.sh", "start" --hostname-strict=false" ]
