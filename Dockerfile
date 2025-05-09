FROM gentoo/portage:latest as portage

FROM gentoo/stage3:amd64-nomultilib-openrc
COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo

RUN emerge dev-util/pkgcheck && \
    rm -rf /var/cache/distfiles/*

CMD [ "bash" ]
