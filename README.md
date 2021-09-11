docker build -t pytorch_env .

docker run --gpus all -it -p 8888:8888 --mount src="$(pwd)",target=/code,type=bind --name pytorch_env pytorch_env bash

source activate pytorch

conda install pytorch torchvision torchaudio cudatoolkit=11.1 -c pytorch -c nvidia

jupyter notebook --no-browser --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.password=''  --allow-root



docker file copied from https://github.com/borundev/jupyter_ml_docker