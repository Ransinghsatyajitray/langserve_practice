FROM python:3.9-slim-buster

WORKDIR /app

COPY . .
RUN python -m venv venv
ENV PATH="/app/.venv/bin:$PATH"
RUN pip install --no-cache-dir -r requirements.txt

CMD ["uvicorn", "langservedemo:app", "--host", "0.0.0.0", "--port", "8000"]