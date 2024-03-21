FROM python:3.12-slim

WORKDIR /botbymoolvi

COPY . /botbymoolvi
COPY pyproject.toml $APP_HOME/pyproject.toml
COPY poetry.lock $APP_HOME/poetry.lock

RUN pip install poetry
RUN poetry config virtualenvs.create false && poetry install --only main

EXPOSE 5000

CMD ["python", "./main.py", "--host", "0.0.0.0", "--port", "5000" ]