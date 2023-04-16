# Detecton method 1
# https://github.com/MarkHershey/AudioDeepFakeDetection

# # Prepare data
# unzip WaveFake.zip
# tar -xf LJSpeech.tar.bz2

# Download modified detection method
# git clone https://github.com/PlayerBerny12/AudioDeepFakeDetection.git

# Run container
# docker build . -t cuda-python
# docker run -it --gpus=all -v "C:\VUT-DIP\Data:/mnt/Data" -v "C:\VUT-DIP\AudioDeepFakeDetection\:/mnt/AudioDeepFakeDetection" cuda-python

# Install tools
# apt update && apt -y install zip bzip2 git python3 python3-venv

# Go to detection method
cd /mnt/AudioDeepFakeDetection

# Set up Python virtual environment
python3 -m venv venv && source venv/bin/activate

# Make sure your PIP is up to date
# pip install -U pip wheel setuptools

# Install required dependencies
# pip install torch torchvision torchaudio
# pip install -r requirements.txt

# Test run
python train.py --debug_all --real /mnt/Data/real --fake /mnt/Data/fake

# Run training
python train.py --real /mnt/Data/real --fake /mnt/Data/fake --batch_size 128 --epochs 15 --seed 1860168 --feature_classname lfcc --model_classname ShallowCNN > /dev/null 2>&1 &
python train.py --real /mnt/Data/real --fake /mnt/Data/fake --batch_size 128 --epochs 15 --seed 89789411 --feature_classname mfcc --model_classname ShallowCNN > /dev/null 2>&1 &
python train.py --real /mnt/Data/real --fake /mnt/Data/fake --batch_size 64 --epochs 15 --seed 659816 --feature_classname wave --model_classname TSSD > /dev/null 2>&1 &

python train.py --real /mnt/Data/real --fake /mnt/Data/fake --batch_size 128 --epochs 15 --seed 78906 --feature_classname lfcc --model_classname ShallowCNN --in_distribution False > /dev/null 2>&1 &
python train.py --real /mnt/Data/real --fake /mnt/Data/fake --batch_size 128 --epochs 15 --seed 1998247 --feature_classname mfcc --model_classname ShallowCNN --in_distribution False > /dev/null 2>&1 &
python train.py --real /mnt/Data/real --fake /mnt/Data/fake --batch_size 64 --epochs 15 --seed 2388908 --feature_classname wave --model_classname TSSD --in_distribution False > /dev/null 2>&1 &

# Run evaluation
python train.py --real /mnt/Data/real --fake /mnt/Data/fake --batch_size 128 --feature_classname lfcc --model_classname ShallowCNN --restore --eval_only
python train.py --feature_classname lfcc --model_classname ShallowCNN --restore --eval_one