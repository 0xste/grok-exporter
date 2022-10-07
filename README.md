# grok-exporter

Containerizes the fstab/grok_exporter repo

## Getting Started

```shell
docker run \
  --name grok-exporter
  --detach
  --volume $(pwd)/config.yml:/etc/grok_exporter/config.yml \
  0xSte/grok-exporter:latest
```
