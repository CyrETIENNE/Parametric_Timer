FROM ghdl/vunit:llvm-master

ENV GITHUB_USER = CyrETIENNE
ENV REPO_NAME = Parametric_Timer

RUN git clone https://GitHub.com/$GITHUB_USER/$REPO

WORKDIR /app

RUN python3 run.py

CMD ["python3", "./run.py"]
