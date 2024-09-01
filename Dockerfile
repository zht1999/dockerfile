FROM ufoym/deepo:all-py38-cu113

RUN apt-get update && \
    apt install -y wget nano ffmpeg && \
    pip --no-cache-dir --default-timeout=10000 install compressai einops xlsxwriter openpyxl imagesize pybind11 timm h5py ffmpy3 -i https://pypi.tuna.tsinghua.edu.cn/simple && \
    pip install -U openmim opencv-python-headless -i https://pypi.tuna.tsinghua.edu.cn/simple && \
    apt-get autoclean && apt-get autoremove
	
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    APT_INSTALL="apt-get install -y --no-install-recommends" && \
    rm -rf /var/lib/apt/lists/* \
           /etc/apt/sources.list.d/cuda.list \
           /etc/apt/sources.list.d/nvidia-ml.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
			openssh-client \
			openssh-server \

