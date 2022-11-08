# Podman systemd restart

```bash
podman generate systemd
    --restart-policy=always
    -t 1 -f
    --name $container_name

cp container-$container_name.service /etc/systemd/system/

systemctl enable container-$container_name

podman stop $container_name

systemctl start container-$container_name
systemctl status container-$container_name
```
