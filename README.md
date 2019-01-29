# docker-CasparCG
Docker deployment of the CasparCG Linux Server

```bash

docker build . -t casparcg

docker run \
  -d \
  -e "DISPLAY=unix:0.0" \
  -p 3250:3250 \
  -p 5250:5250 \
  -p 9250:9250/udp \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  --privileged \
  --name casparcg \
  casparcg
```
