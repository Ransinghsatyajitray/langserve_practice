# Steps to follow for the project
1. prepare the requirements.txt file, .env file and langservedemo.py file 
2. prepare Dockerfile
   
    FROM python:3.9-slim-buster: This line specifies the base image for your Docker container. We're using a slim Python 3.9 image to keep the image size smaller.

    WORKDIR /app: This sets the working directory inside the container to /app. This is where your application code will be placed.

    COPY . .: This copies all the files and folders from your current directory (where your Dockerfile and langservedemo.py are located) into the /app directory inside the container.

    RUN python -m venv venv: creating the virtual environment within the docker container

    ENV PATH="/app/.venv/bin:$PATH": activating the environment

    RUN pip install --no-cache-dir -r requirements.txt: installing all the required packages within the docker container

    CMD ["uvicorn", "langservedemo:app", "--host", "0.0.0.0", "--port", "8000"]: This is the command that will be executed when the container starts. 
        unicorn: It uses uvicorn to run your FastAPI application.
        langservedemo:app: This refers to your langservedemo.py file and the FastAPI app object (usually named app) within that file.
        --host, 0.0.0.0: This makes your app accessible from the host machine.
        --port, 8000: This specifies the port your app will listen on.
3. Open the docker desktop
4. Building the container: docker build -t my-langserve-app .
5. docker run -d --name my-langserve-container -p 8000:8000 my-langserve-app
        docker run: This is the core command to start a new container.
        -d: This flag stands for "detached" mode. It means the container will run in the background, and you'll get your command prompt back immediately.
        --name my-langserve-container: This assigns a name to your container. In this case, the name is "my-langserve-container." You can choose any name you like, but it's helpful to give meaningful names to your containers.
        -p 8000:8000: This is for port mapping. It maps port 8000 on your host machine (your computer) to port 8000 inside the container. This is essential for accessing your FastAPI application running inside the container from your web browser.
        my-langserve-app: This is the name of the Docker image you want to use to create the container. You would have built this image earlier using the docker build command.

   docker run -d(run in detached mode) container_name(name of the container) -p 8000:800(port mapping) my-langserve-app(the image name created using docker build command)

6. In the browser run http://localhost:8000/chain/playground/

![alt text](<snapshots/Screenshot 2025-01-11 205816.png>)

**Full process**
![alt text](<snapshots/Screenshot 2025-01-11 211121.png>)

