modelName="117M"
pyVer=`python --version`
majorMinor=$(echo $pyVer | cut -c8-)

if [[ $1 != "" ]]
  then
    modelName=$1
fi

if [[ $majorMinor == "3."* ]]
then
  echo "Python version is good!"
  pip install -r requirements.txt
  python download_model.py $modelName

  npzFile="<npz file>"
  npzSet=false
  if [[ $2 == "" ]]
  then
    echo "No input file found to encode, skipping..."
  else
    npzFile="${2/.txt/}.npz"
    npzSet=true
    echo "Encoding $2 to $npzFile"
    python src/encode.py $2 $npzFile
  fi

  echo "python src/train.py --dataset $npzFile --sample_every 200 --save_every 200 --sample_num 3 --batch_size 1" | tee train.sh

  echo "To start training, simply run ./train.sh"

  if [[ $npzSet ]]
  then
    echo "As there was no .npz file set, replace <npz file> with a path to the file before training"
  fi
else
  echo "You must have Python 3!"
fi
