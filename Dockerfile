FROM python:3.13-alpine

WORKDIR /app

COPY . .
RUN apk add gcc libc-dev libressl-dev
RUN pip install --no-cache-dir -r requirements.txt

ENV HOST=0.0.0.0
ENV CHAIN_ID=0x53
ENV ENDPOINT=http://localhost:8669

EXPOSE 8545
EXPOSE 8546

CMD [ "sh", "-c", "python -m gear.cli --host $HOST --chainid $CHAIN_ID --endpoint ${ENDPOINT}"]
