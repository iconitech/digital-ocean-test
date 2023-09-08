FROM quay.io/keycloak/keycloak:latest
RUN /opt/keycloak/bin/kc.sh build --db=mysql
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start --proxy=edge --hostname-strict=false --db-username=${KC_DB_USERNAME} --db-password=${KC_DB_PASSWORD}"]
