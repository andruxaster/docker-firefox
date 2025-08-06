# docker-firefox

git clone https://github.com/andruxaster/docker-firefox

cd docker-firefox

docker build -t andruxaster/docker-firefox .

docker run -d -p 5800:5800 --shm-size 2G andruxaster/docker-firefox

Open with browser http://<your_IP_addres>:5800/
