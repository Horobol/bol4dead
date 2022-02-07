FROM debian:stretch-slim


# Default configurations

ENV SV_HOSTNAME "L4D2 Server"
ENV SV_RCON_PASSWORD "rconpassword"


ENV DEBIAN_FRONTEND noninteractive

EXPOSE 27015
EXPOSE 27015/udp

RUN /bin/bash -c ' \
      set -o pipefail \
      && echo "steamcmd steam/question select I AGREE" \
      | debconf-set-selections \
    ' \
  && dpkg --add-architecture i386 \
  && echo "deb http://mirrors.linode.com/debian stretch main non-free" >> /etc/apt/sources.list.d/linode.list \
  && echo "deb-src http://mirrors.linode.com/debian stretch main non-free" >> /etc/apt/sources.list.d/linode.list \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    gettext \
    steamcmd \
  && apt-get clean \
  && rm -rf /var/lib/apt/list/* \
  && groupadd -g 61000 appuser \
  && useradd -g 61000 -l -m -s /bin/false -u 61000 appuser


USER appuser

RUN /usr/games/steamcmd +login anonymous +quit \
  && mkdir -p /home/appuser/.steam/sdk32 \
  && ln -s /home/appuser/.steam/steamcmd/linux32/steamclient.so /home/appuser/.steam/sdk32/steamclient.so \
  && /usr/games/steamcmd +login anonymous +force_install_dir /home/appuser/l4d2server +app_update 222860 validate +quit


# Install Sourcemod/Metamod/l4dtoolz/etc

COPY --chown=appuser:appuser ./addons/addons/stripper /home/appuser/l4d2server/left4dead2/addons/stripper
COPY --chown=appuser:appuser ./addons/addons/metamod /home/appuser/l4d2server/left4dead2/addons/metamod
COPY --chown=appuser:appuser ./addons/addons/sourcemod /home/appuser/l4d2server/left4dead2/addons/sourcemod
COPY --chown=appuser:appuser ./addons/cfg /home/appuser/l4d2server/left4dead2/cfg
COPY --chown=appuser:appuser ./addons/addons/metamod.vdf /home/appuser/l4d2server/left4dead2/addons
COPY --chown=appuser:appuser ./addons/addons/metamod_x64.vdf /home/appuser/l4d2server/left4dead2/addons
# COPY --chown=appuser:appuser ./addons/scripts /home/appuser/l4d2server/left4dead2/scripts

COPY --chown=appuser:appuser admins_simple.ini /home/appuser/l4d2server/left4dead2/addons/sourcemod/configs/
COPY --chown=appuser:appuser ./left4dead2 /home/appuser/l4d2server/left4dead2
COPY --chown=appuser:appuser server.cfg.tpl /home/appuser/server.cfg.tpl
COPY --chown=appuser:appuser entrypoint.sh /home/appuser/entrypoint.sh

COPY --chown=appuser:appuser ./addons/l4dtoolz /home/appuser/l4d2server/left4dead2/addons/l4dtoolz
COPY --chown=appuser:appuser ./addons/l4dtoolz.vdf /home/appuser/l4d2server/left4dead2/addons/metamod/l4dtoolz.vdf


ENTRYPOINT ["/bin/bash", "/home/appuser/entrypoint.sh"]
