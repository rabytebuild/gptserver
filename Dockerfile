
FROM python:3-alpine

WORKDIR /app
COPY ./requirements.txt /app
COPY ./src/* /app

RUN apk add --no-cache gcc musl-dev linux-headers
# The error is due to missing dependencies
# Adding the necessary packages to fix this issue

RUN pip3 install -r requirements.txt

ENV PORT=5500
EXPOSE $PORT

#ENTRYPOINT nginx && uwsgi --ini /app/params.ini -w FreeGPT4_Server
#shell form necessary
SHELL ["python3","/app/FreeGPT4_Server.py"]
ENTRYPOINT ["python3","/app/FreeGPT4_Server.py"]
CMD ["--cookie-file","/cookies.json"]
