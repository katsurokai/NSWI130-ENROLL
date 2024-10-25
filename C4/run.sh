#!/usr/bin/env bash

# C4 folder
docker run -it --rm -p 8080:8080 \
    -v /home/vitek/obsidian/VitekVault/5.\ Semestr/Software\ architecture/NSWI130-ENROLL/C4:/usr/local/structurizr \
    structurizr/lite

# lvl1
# docker run -it --rm -p 8080:8080 \
#     -v /home/vitek/obsidian/VitekVault/5.\ Semestr/Software\ architecture/NSWI130-ENROLL/C4/lvl1-System-Software:/usr/local/structurizr \
#     structurizr/lite


# lvl2
# docker run -it --rm -p 8080:8080 \
#     -v /home/vitek/obsidian/VitekVault/5.\ Semestr/Software\ architecture/NSWI130-ENROLL/C4/lvl2-Containers:/usr/local/structurizr \
#     structurizr/lite


