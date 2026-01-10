FROM ghdl/vunit:llvm-master

WORKDIR /user/src/app

RUN python3 run.py

COPY . .

CMD ["python3", "./run.py"]

