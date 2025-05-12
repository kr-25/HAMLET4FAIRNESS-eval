FROM python:3.12-bullseye
RUN wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor | tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null
RUN echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list
RUN apt update && apt install docker.io temurin-21-jre git -y
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip && \
    pip install black && \
    pip install --no-cache-dir --upgrade -r /requirements.txt && \
    rm requirements.txt
RUN cd home && mkdir HAMLET4FAIRNESS-eval
WORKDIR /home/HAMLET4FAIRNESS-eval
RUN mkdir results
COPY resources resources
COPY run_hamlet.py run_hamlet.py
COPY run_experiments.sh run_experiments.sh
RUN chmod 777 run_experiments.sh
ENTRYPOINT ["./run_experiments.sh"]
