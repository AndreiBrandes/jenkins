FROM python:3.7-alpine
COPY ./py/src/main.py /
RUN chmod 644 main.py
CMD ["python","./main.py"]
