Docker compose read .env environments by default if it does not exist then read the file from env_file
>PS: if an environment variables is used with the env_file option you can't use one of those vars in the docker-compose configuration

>A great way to secure your environment variables is to create a .gitignore (and .dockerignore if you are pushing your work to docker hub) and make sure to ignore your env file so your secret data used for testing won't be pushed there.