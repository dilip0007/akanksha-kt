FROM python:3.9-slim-buster
RUN pip install flask
WORKDIR /app
COPY app.py .
EXPOSE 50000
echo xyx
ENTRYPOINT ["python", "app.py"]
