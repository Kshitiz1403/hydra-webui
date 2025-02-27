aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 909798297030.dkr.ecr.ap-south-1.amazonaws.com

docker buildx build -f Dockerfile \
  --build-arg SSH_PRIVATE_KEY="$(cat ~/.ssh/id_ed25519)" \
  --platform linux/amd64 \
  --load \
  --tag hydra-webui:0.0.7 .

docker tag hydra-webui:0.0.7 909798297030.dkr.ecr.ap-south-1.amazonaws.com/hydra-webui:0.0.7
docker push 909798297030.dkr.ecr.ap-south-1.amazonaws.com/hydra-webui:0.0.7