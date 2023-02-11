FROM python:3.11

ENV PYTHONDONTWRITEBYTECODE=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONUTF8=1 \
  PYTHONIOENCODING="UTF-8" \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  POETRY_NO_INTERACTION=1 \
  POETRY_VIRTUALENVS_CREATE=false \
  PATH="/root/.local/bin:$PATH"

RUN python -m pip install -U pip

ARG POETRY_VERSION="1.3.2"
ARG POETRY_URL="https://install.python-poetry.org"

WORKDIR /tmp

# Install `poetry`.
ADD "${POETRY_URL}" ./install-poetry.py
RUN python ./install-poetry.py --version "${POETRY_VERSION}"

WORKDIR /app

COPY ./pyproject.toml ./poetry.lock ./

RUN poetry install

CMD ["/usr/local/bin/jupyter", "notebook", "--allow-root", "--ip=0.0.0.0"]
