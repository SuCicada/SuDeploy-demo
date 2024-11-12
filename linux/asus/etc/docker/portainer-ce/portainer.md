dockerupdate
```bash
docker stop portainer
docker rm portainer

# docker volume create portainer_data
docker run -d -p 9444:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:2.20.3

```