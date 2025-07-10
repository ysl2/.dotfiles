# gitea

```bash
# start
docker compose up -d
# stop and clean
docker compose down; docker rm -f $(docker ps | grep mysql | awk '{print $1}'); docker rm -f $(docker ps | grep gitea | grep com | awk '{print $1}'); docker volume rm gitea_gitea; docker network rm gitea_gitea; sudo sudo kill -9 $(ps aux | grep dockerd | grep -v grep | awk '{print $2}')

# WARNING: This will remove all data in the gitea container, including repositories and settings.
sudo rm -rf /mnt/nas/gitea
```

| result | sshd  | inner | outer | SSH_PORT | SSH_LISTEN_PORT |
| ------ | ----- | ----- | ----- | -------- | --------------- |
| Y      | 22    | 22    | 222   | 222      | 222             |
| Y      | 22    | 22    | 35001 | 35001    | 35001           |
| Y      | 36000 | 22    | 35001 | 35001    | 35001           |
| Y      | 36000 | 22    | 35001 | 35001    | 22              |
| N      | 36000 | 22    | 35001 | 22       | 35001           |

| result | inner | outer | HTTP_PORT |
| ------ | ----- | ----- | --------- |
| Y      | 3000  | 3000  | 3000      |
| Y      | 3000  | 36001 | 3000      |
| N      | 3000  | 36001 | 36001     |
