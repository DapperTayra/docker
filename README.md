# docker

Use-case: Duplicate jupyter environment many times, distribute (push) it via network to hosts without privileges.

Dockerfile defines image with Ubuntu 16.04 (jupyter, python3) installs requirements.txt.
start_jupyter.sh is started by docker when running the image, using the config jupyter_notebook_config.py.
Configured is password-less jupyter on 0.0.0.0:8888, meaning listening on any interface.
The scripts are for building, exporting, importing and running the image.



