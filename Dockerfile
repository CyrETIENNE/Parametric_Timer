FROM ghdl/vunit:llvm-master

WORKDIR /app

COPY . /app

RUN python3 run.py

CMD ["python3", "./run.py"]