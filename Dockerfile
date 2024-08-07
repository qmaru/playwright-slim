FROM python:3.11-slim-bullseye AS builder

WORKDIR /app

RUN pip install --no-cache-dir playwright==1.45.1 pytest-playwright==0.5.1 \
    && PLAYWRIGHT_BROWSERS_PATH=/app/pw-browsers playwright install --with-deps webkit \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /lib1 /lib2 \
    && cp /lib/x86_64-linux-gnu/libbz2.so.1.0 /lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/libdbus-1.so.3 /lib/x86_64-linux-gnu/libdl.so.2 /lib/x86_64-linux-gnu/libexpat.so.1 /lib/x86_64-linux-gnu/libgcc_s.so.1 /lib/x86_64-linux-gnu/libgpg-error.so.0 /lib/x86_64-linux-gnu/liblzma.so.5 /lib/x86_64-linux-gnu/libm.so.6 /lib/x86_64-linux-gnu/libpcre.so.3 /lib/x86_64-linux-gnu/libpthread.so.0 /lib/x86_64-linux-gnu/libresolv.so.2 /lib/x86_64-linux-gnu/librt.so.1 /lib/x86_64-linux-gnu/libselinux.so.1 /lib/x86_64-linux-gnu/libz.so.1 /lib1 \
    && cp /usr/lib/x86_64-linux-gnu/libGLESv2.so.2 /usr/lib/x86_64-linux-gnu/libEGL_mesa.so.0 /usr/lib/x86_64-linux-gnu/libglapi.so.0 /usr/lib/x86_64-linux-gnu/libxcb-dri2.so.0 /usr/lib/x86_64-linux-gnu/libxcb-xfixes.so.0 /usr/lib/x86_64-linux-gnu/libxcb-dri3.so.0 /usr/lib/x86_64-linux-gnu/libxcb-present.so.0 /usr/lib/x86_64-linux-gnu/libxcb-sync.so.1 /usr/lib/x86_64-linux-gnu/libxshmfence.so.1 /usr/lib/x86_64-linux-gnu/libsensors.so.5 /usr/lib/x86_64-linux-gnu/libLLVM-11.so.1 /usr/lib/x86_64-linux-gnu/libdrm_radeon.so.1 /usr/lib/x86_64-linux-gnu/libdrm_amdgpu.so.1 /usr/lib/x86_64-linux-gnu/libdrm_nouveau.so.2 /usr/lib/x86_64-linux-gnu/libvulkan.so.1 /usr/lib/x86_64-linux-gnu/libedit.so.2 /usr/lib/x86_64-linux-gnu/libz3.so.4 /usr/lib/x86_64-linux-gnu/gstreamer1.0/gstreamer-1.0/gst-plugin-scanner /usr/lib/x86_64-linux-gnu/libmpg123.so.0 /usr/lib/x86_64-linux-gnu/libproxy.so.1 /usr/lib/x86_64-linux-gnu/libnghttp2.so.14 /usr/lib/x86_64-linux-gnu/libpsl.so.5 /usr/lib/x86_64-linux-gnu/libasound.so.2 /usr/lib/x86_64-linux-gnu/libatk-1.0.so.0 /usr/lib/x86_64-linux-gnu/libatk-bridge-2.0.so.0 /usr/lib/x86_64-linux-gnu/libatomic.so.1 /usr/lib/x86_64-linux-gnu/libatspi.so.0 /usr/lib/x86_64-linux-gnu/libblkid.so.1 /usr/lib/x86_64-linux-gnu/libbrotlicommon.so.1 /usr/lib/x86_64-linux-gnu/libbrotlidec.so.1 /usr/lib/x86_64-linux-gnu/libbsd.so.0 /usr/lib/x86_64-linux-gnu/libcairo.so.2 /usr/lib/x86_64-linux-gnu/libdrm.so.2 /usr/lib/x86_64-linux-gnu/libdw.so.1 /usr/lib/x86_64-linux-gnu/libEGL.so.1 /usr/lib/x86_64-linux-gnu/libelf.so.1 /usr/lib/x86_64-linux-gnu/libepoxy.so.0 /usr/lib/x86_64-linux-gnu/libevent-2.1.so.7 /usr/lib/x86_64-linux-gnu/libffi.so.7 /usr/lib/x86_64-linux-gnu/libflite_cmu_grapheme_lang.so.1 /usr/lib/x86_64-linux-gnu/libflite_cmu_grapheme_lex.so.1 /usr/lib/x86_64-linux-gnu/libflite_cmu_indic_lang.so.1 /usr/lib/x86_64-linux-gnu/libflite_cmu_indic_lex.so.1 /usr/lib/x86_64-linux-gnu/libflite_cmu_time_awb.so.1 /usr/lib/x86_64-linux-gnu/libflite_cmu_us_awb.so.1 /usr/lib/x86_64-linux-gnu/libflite_cmu_us_kal.so.1 /usr/lib/x86_64-linux-gnu/libflite_cmu_us_kal16.so.1 /usr/lib/x86_64-linux-gnu/libflite_cmu_us_rms.so.1 /usr/lib/x86_64-linux-gnu/libflite_cmu_us_slt.so.1 /usr/lib/x86_64-linux-gnu/libflite_cmulex.so.1 /usr/lib/x86_64-linux-gnu/libflite_usenglish.so.1 /usr/lib/x86_64-linux-gnu/libflite.so.1 /usr/lib/x86_64-linux-gnu/libfontconfig.so.1 /usr/lib/x86_64-linux-gnu/libfreetype.so.6 /usr/lib/x86_64-linux-gnu/libgbm.so.1 /usr/lib/x86_64-linux-gnu/libgcrypt.so.20 /usr/lib/x86_64-linux-gnu/libgio-2.0.so.0 /usr/lib/x86_64-linux-gnu/libGL.so.1 /usr/lib/x86_64-linux-gnu/libGLdispatch.so.0 /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0 /usr/lib/x86_64-linux-gnu/libGLX.so.0 /usr/lib/x86_64-linux-gnu/libgmodule-2.0.so.0 /usr/lib/x86_64-linux-gnu/libgobject-2.0.so.0 /usr/lib/x86_64-linux-gnu/libgraphite2.so.3 /usr/lib/x86_64-linux-gnu/libgstallocators-1.0.so.0 /usr/lib/x86_64-linux-gnu/libgstapp-1.0.so.0 /usr/lib/x86_64-linux-gnu/libgstaudio-1.0.so.0 /usr/lib/x86_64-linux-gnu/libgstbase-1.0.so.0 /usr/lib/x86_64-linux-gnu/libgstcodecparsers-1.0.so.0 /usr/lib/x86_64-linux-gnu/libgstfft-1.0.so.0 /usr/lib/x86_64-linux-gnu/libgstgl-1.0.so.0 /usr/lib/x86_64-linux-gnu/libgstpbutils-1.0.so.0 /usr/lib/x86_64-linux-gnu/libgstreamer-1.0.so.0 /usr/lib/x86_64-linux-gnu/libgsttag-1.0.so.0 /usr/lib/x86_64-linux-gnu/libgstvideo-1.0.so.0 /usr/lib/x86_64-linux-gnu/libgudev-1.0.so.0 /usr/lib/x86_64-linux-gnu/libharfbuzz-icu.so.0 /usr/lib/x86_64-linux-gnu/libharfbuzz.so.0 /usr/lib/x86_64-linux-gnu/libicudata.so.67 /usr/lib/x86_64-linux-gnu/libicui18n.so.67 /usr/lib/x86_64-linux-gnu/libicuuc.so.67 /usr/lib/x86_64-linux-gnu/libjpeg.so.62 /usr/lib/x86_64-linux-gnu/liblcms2.so.2 /usr/lib/x86_64-linux-gnu/liblz4.so.1 /usr/lib/x86_64-linux-gnu/libmd.so.0 /usr/lib/x86_64-linux-gnu/libmount.so.1 /usr/lib/x86_64-linux-gnu/libopus.so.0 /usr/lib/x86_64-linux-gnu/liborc-0.4.so.0 /usr/lib/x86_64-linux-gnu/libpcre2-8.so.0 /usr/lib/x86_64-linux-gnu/libpixman-1.so.0 /usr/lib/x86_64-linux-gnu/libpng16.so.16 /usr/lib/x86_64-linux-gnu/libsqlite3.so.0 /usr/lib/x86_64-linux-gnu/libstdc++.so.6 /usr/lib/x86_64-linux-gnu/libsystemd.so.0 /usr/lib/x86_64-linux-gnu/libtasn1.so.6 /usr/lib/x86_64-linux-gnu/libudev.so.1 /usr/lib/x86_64-linux-gnu/libunwind.so.8 /usr/lib/x86_64-linux-gnu/libuuid.so.1 /usr/lib/x86_64-linux-gnu/libwayland-client.so.0 /usr/lib/x86_64-linux-gnu/libwayland-cursor.so.0 /usr/lib/x86_64-linux-gnu/libwayland-egl.so.1 /usr/lib/x86_64-linux-gnu/libwayland-server.so.0 /usr/lib/x86_64-linux-gnu/libwebp.so.6 /usr/lib/x86_64-linux-gnu/libwebpdemux.so.2 /usr/lib/x86_64-linux-gnu/libwoff2common.so.1.0.2 /usr/lib/x86_64-linux-gnu/libwoff2dec.so.1.0.2 /usr/lib/x86_64-linux-gnu/libX11-xcb.so.1 /usr/lib/x86_64-linux-gnu/libX11.so.6 /usr/lib/x86_64-linux-gnu/libXau.so.6 /usr/lib/x86_64-linux-gnu/libxcb-render.so.0 /usr/lib/x86_64-linux-gnu/libxcb-shm.so.0 /usr/lib/x86_64-linux-gnu/libxcb.so.1 /usr/lib/x86_64-linux-gnu/libXdmcp.so.6 /usr/lib/x86_64-linux-gnu/libXext.so.6 /usr/lib/x86_64-linux-gnu/libxkbcommon.so.0 /usr/lib/x86_64-linux-gnu/libxml2.so.2 /usr/lib/x86_64-linux-gnu/libXrender.so.1 /usr/lib/x86_64-linux-gnu/libxslt.so.1 /usr/lib/x86_64-linux-gnu/libzstd.so.1 /lib2 \
    && rm -fr /app/pw-browsers/webkit-2035/minibrowser-gtk

COPY main.py local.html /app

FROM python:3.11-slim-bullseye AS prod

# basic
COPY --from=builder /usr/local/lib/python3.11/site-packages/ /usr/local/lib/python3.11/site-packages
COPY --from=builder /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs
# .so
COPY --from=builder /lib1/ /lib/x86_64-linux-gnu
COPY --from=builder /lib2/ /usr/lib/x86_64-linux-gnu
COPY --from=builder /usr/lib/x86_64-linux-gnu/dri/swrast_dri.so /usr/lib/x86_64-linux-gnu/dri/swrast_dri.so
# font and image
COPY --from=builder /etc/fonts/ /etc/fonts
COPY --from=builder /usr/local/share/fonts/ /usr/local/share/fonts
COPY --from=builder /usr/share/fonts/ /usr/share/fonts
COPY --from=builder /usr/share/fontconfig /usr/share/fontconfig
COPY --from=builder /usr/share/glib-2.0 /usr/share/glib-2.0
COPY --from=builder /usr/share/glvnd /usr/share/glvnd

# your code
COPY --from=builder /app/ /app

WORKDIR /app

ENV GST_PLUGIN_SCANNER=/usr/lib/x86_64-linux-gnu/gst-plugin-scanner
ENV PYTHONPATH=/usr/local/lib/python3.11/site-packages
ENV PLAYWRIGHT_BROWSERS_PATH=/app/pw-browsers
ENV LD_LIBRARY_PATH=/app/pw-browsers/webkit-2035/minibrowser-wpe/lib:/app/pw-browsers/webkit-2035/minibrowser-wpe/sys/lib:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu

CMD ["python","main.py"]
