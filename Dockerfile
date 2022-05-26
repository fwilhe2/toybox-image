FROM python:3 AS BUILDER

WORKDIR /usr/src/app

# COPY requirements.txt ./
# RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN python build-rootfs.py

FROM gcr.io/distroless/static

COPY --from=BUILDER /usr/src/app/rootfs/ /

ENTRYPOINT [ "/bin/toybox", "sh" ]