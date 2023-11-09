FROM gcc:4.9 as stage1
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN gcc -o myapp main.c
CMD ["./myapp"]

FROM timberio/vector:0.21.X-distroless-libc
COPY --from=stage1 /usr/src/myapp/myapp ./myapp
# ENTRYPOINT ["./myapp"]
# CMD [ "/etc" ]