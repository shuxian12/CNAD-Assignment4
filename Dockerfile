FROM python:3.12.10-alpine AS base
FROM base AS builder
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir --user -r /requirements.txt

FROM base
LABEL maintainer="shuxian12"
# copy only the dependencies installation from the 1st stage image
COPY --from=builder /root/.local /root/.local
COPY src /app
WORKDIR /app

# update PATH environment variable
ENV PATH=/root/.local/bin:$PATH
ENV FLASK_APP=server
EXPOSE 8000
CMD ["python", "-m", "flask", "run", "--host", "0.0.0.0", "--port", "8000"]
# CMD ["python", "server.py"]