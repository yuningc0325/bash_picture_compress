FROM node:14-slim

WORKDIR /app/assets
COPY assets/ /app/assets/
WORKDIR /app

ARG RESIZE
ARG QUALITY
ARG CONFIG="{"quality":$QUALITY,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,\
"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,\
"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":$QUALITY}"

RUN npx @squoosh/cli --mozjpeg "$CONFIG" -d output ./assets/*
