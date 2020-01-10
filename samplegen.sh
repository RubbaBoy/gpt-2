sampleName="sample"
checkpointName="run1"
modelName="117M"

if [[ $3 != "" ]]
  then
    checkpointName=$3
fi

if [[ $4 != "" ]]
  then
    sampleName=$4
fi

if [[ $1 != "" ]]
  then
    modelName=$1
fi

if [[ $2 != "" ]]
  then
    echo "Copying over model-$2.* files..."
    cp checkpoint/"$checkpointName"/model-"$2".* models/"$sampleName"
  else
    echo "Copying over all model files..."
    cp checkpoint/"$checkpointName"/model-* models/"$sampleName"
fi

echo "Creating sample $sampleName from checkpoint name $checkpointName..."

cp models/$4/encoder.json models/"$sampleName"
cp models/$4/hparams.json models/"$sampleName"
cp models/$4/vocab.bpe models/"$sampleName"

cp checkpoint/"$checkpointName"/checkpoint models/"$sampleName"

echo "You're good to either run the file src/interactive_conditional_samples.py or src/generate_unconditional_samples.py"
echo "See the README.md for more details and instructions."
