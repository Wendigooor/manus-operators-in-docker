FROM python:3.12-slim

RUN apt-get update && apt-get install -y git

WORKDIR /app

RUN git clone https://github.com/mannaandpoem/OpenManus.git
WORKDIR /app/OpenManus

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install flask

RUN playwright install
RUN playwright install-deps

EXPOSE 8080

CMD ["python", "main.py", "--port", "8080"]