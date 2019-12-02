FROM registry.access.redhat.com/ubi8/python-36
RUN python3 -m venv homeassistant
WORKDIR homeassistant
RUN source bin/activate
RUN python3 -m pip install homeassistant
RUN ls -lanR
VOLUME /opt/app-root/src/.homeassistant
EXPOSE 8123
ENTRYPOINT ["hass" , "--open-ui"]
