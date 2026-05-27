FROM python:3.10-slim


#Essential enviroment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

#work directory inside the docker ocntainer
WORKDIR /app

# installing system dependancies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && rm -rf \var\lib\apt\list\*

# copying your all contents from local directory to app directory
COPY . . 

# run setup.py
RUN pip install --no-cache-dir -e .

# used ports
EXPOSE 8501
EXPOSE 9999

# run the app
CMD [ "python","app/main.py" ]