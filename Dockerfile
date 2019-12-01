FROM registry.access.redhat.com/ubi8/python-36
RUN python3 -m venv homeassistant
WORKDIR homeassistant
RUN source bin/activate
RUN python3 -m pip install homeassistant
RUN ls -lanR
USER 2000
ENTRYPOINT ["hass" , "--open-ui"]
