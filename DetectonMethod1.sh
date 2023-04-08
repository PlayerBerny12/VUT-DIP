# Detecton method 1
# https://github.com/MarkHershey/AudioDeepFakeDetection

apt update
apt install git python3 python3-venv

git clone https://github.com/MarkHershey/AudioDeepFakeDetection.git
cd AudioDeepFakeDetection

# Set up Python virtual environment
python3 -m venv venv && source venv/bin/activate

# Make sure your PIP is up to date
pip install -U pip wheel setuptools

# Install required dependencies
pip install -r requirements.txt