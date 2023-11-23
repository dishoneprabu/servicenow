FROM python:3.9-slim

WORKDIR /app

COPY main.py /app/main.py

RUN pip install flask

EXPOSE 5000

ENV FLASK_ENV=production

CMD ["python", "your_python_script.py"]
