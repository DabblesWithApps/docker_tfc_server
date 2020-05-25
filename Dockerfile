FROM cm2network/steamcmd

ENV STEAMCMD ${STEAMCMDDIR}/steamcmd.sh
ENV STEAMAPPDIR /home/steam/tfc

RUN ${STEAMCMDDIR}/steamcmd.sh +login anonymous +force_install_dir /home/steam/tfc +app_set_config 90 mod tfc +quit 

# Known SteamCMD bug - app 90 takes multiple install attempts
RUN ${STEAMCMDDIR}/steamcmd.sh +login anonymous +app_update 90 +quit || \
  ${STEAMCMDDIR}/steamcmd.sh +login anonymous +app_update 90 +quit && \
  ${STEAMCMDDIR}/steamcmd.sh +login anonymous +app_update 90 validate +quit
