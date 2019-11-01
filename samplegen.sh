sampleName="sample"
checkpointName="run1"

if [[ $2 != "" ]]
  then
    checkpointName=$2
fi

if [[ $3 != "" ]]
  then
    sampleName=$3
fi

if [[ $1 != "" ]]
  then
    echo "Copying over model-$1.* files..."
    cp checkpoint/"$checkpointName"/model-"$1".* models/"$sampleName"
  else
    echo "Copying over all model files..."
    cp checkpoint/"$checkpointName"/model-* models/"$sampleName"
fi

echo "Creating sample $sampleName from checkpoint name $checkpointName..."

cp models/117M/encoder.json models/"$sampleName"
cp models/117M/hparams.json models/"$sampleName"
cp models/117M/vocab.bpe models/"$sampleName"

cp checkpoint/"$checkpointName"/checkpoint models/"$sampleName"

echo "You're good to either run the file src/interactive_conditional_samples.py or src/generate_unconditional_samples.py"
echo "See the README.md for more details and instructions."
