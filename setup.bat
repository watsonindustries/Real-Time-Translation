@echo off
Title Realtime Whipser Translation App
cls
Echo Creating python environment...
python -m venv data_whisper

Echo Created Env...


call data_whisper\Scripts\activate.bat
Echo Installing Whisper
Echo Updating pip
python.exe -m pip install --upgrade pip

Echo Install PreReqs
pip install wheel
pip install setuptools-rust
pip install git


Echo Downloading Whisper
pip install git+https://github.com/openai/whisper.git 

Echo Installing Requirements...
pip install numpy
pip install tqdm
pip install more-itertools
pip install ffmpeg-python==0.2.0
pip install pyaudio
pip install SpeechRecognition
pip install prettytable

:cuda-patch
Echo Fixing CUDA Since Whisper installs non gpu version.
pip uninstall --yes torch torchvision torchaudio
pip cache purge
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

Echo. Setup Completed!


:creating shortcut
Echo Creating example shortcut in %cd%
Echo You can edit with notepad anytime.
Echo.
Echo @echo off > livetranslation.bat
Echo cls >> livetranslation.bat
Echo call "%cd%\data_whisper\Scripts\activate.bat" >> livetranslation.bat
Echo python "%cd%\transcribe_audio.py" --ram 4gb --non_english --translate >> livetranslation.bat
pause

:eof