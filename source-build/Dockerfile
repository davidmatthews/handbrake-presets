# -------- Build stage --------
FROM ubuntu:24.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    autoconf \
    automake \
    libtool \
    libtool-bin \
    pkg-config \
    python3 \
    python3-pip \
    git \
    nasm \
    yasm \
    gettext \
    meson \
    ninja-build \
    cmake \
    rustc \
    cargo \
    libnuma-dev \
    libmp3lame-dev \
    libopus-dev \
    libspeex-dev \
    libvpx-dev \
    libjansson-dev \
    libx264-dev \
    libtheora-dev \
    libvorbis-dev \
    libturbojpeg-dev \
    libass-dev \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build

# Clone HandBrake source
RUN git clone https://github.com/HandBrake/HandBrake.git
WORKDIR /build/HandBrake

# Build
RUN ./configure --disable-gtk --launch-jobs=$(nproc) --launch

RUN ./build/HandBrakeCLI --version

# -------- Runtime stage --------
FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    libstdc++6 \
    libgcc-s1 \
    libnuma1 \
    libass9 \
    libbz2-1.0 \
    libz1 \
    libvpx9 \
    libx264-164 \
    libopus0 \
    libmp3lame0 \
    libvorbis0a \
    libvorbisenc2 \
    libtheora0 \
    libjansson4 \
    libturbojpeg \
    libspeex1 \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# Copy HandBrake binary
COPY --from=builder /build/HandBrake/build/HandBrakeCLI /usr/local/bin/HandBrakeCLI

# Copy bundled libraries built by HandBrake
#COPY --from=builder /build/HandBrake/build/contrib /usr/local/handbrake-contrib

#RUN ls -l /usr/lib/aarch64-linux-gnu
#RUN find / -name "libvpx.so*"

# Register HandBrake library paths
#RUN echo "/usr/local/handbrake-contrib/lib"   >  /etc/ld.so.conf.d/handbrake.conf \
# && echo "/usr/local/handbrake-contrib/lib64" >> /etc/ld.so.conf.d/handbrake.conf \
# && ldconfig

#RUN ldd /usr/local/bin/HandBrakeCLI
RUN HandBrakeCLI --version

ENTRYPOINT ["HandBrakeCLI"]