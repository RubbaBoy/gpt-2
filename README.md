
Reference:  ["Beginner’s Guide to Retrain GPT-2 (117M) to Generate Custom Text Content"](https://medium.com/@ngwaifoong92/beginners-guide-to-retrain-gpt-2-117m-to-generate-custom-text-content-8bb5363d8b7f)

# gpt-2

Code from the paper ["Language Models are Unsupervised Multitask Learners"](https://d4mucfpksywv.cloudfront.net/better-language-models/language-models.pdf).

We have currently released small (117M parameter) and medium (345M parameter) versions of GPT-2.  While we have not released the larger models, we have [released a dataset](https://github.com/openai/gpt-2-output-dataset) for researchers to study their behaviors.

See more details in our [blog post](https://blog.openai.com/better-language-models/).

## This Fork

This fork by RubbaBoy is just to have some improvements of nshepperd's fork, with some missing requirements, moved files for ease of use, and some shell commands to make training this much easier and faster to set up. Everything below aside from the Citation and License sections are made by RubbaBoy.

This just consists of small changes for myself, however if you want stuff changed let me know.


# Installation

Git clone this repository, and `cd` into directory for remaining commands

```
git clone https://github.com/RubbaBoy/gpt-2.git && cd gpt-2
```

Then, run

```
./setup.sh 117M trainingData.txt
```

with the training data file as an optional parameter. The 117M is the name of the model, with the following accepted values: `117M`, `124M`, `345M`, `355M`, `774M`, `1558M`. This script automatically downloads the model, installs python dependencies, etc. as long as Python 3+ is installed. If the data file is not supplied as an argument, manually put it in the `train.sh` file.

For easy training, you can simply run the generated file

```
./train
```


## Samples

To get samples of your network, run

```
./samplegen.sh modelName modelNumber checkpointName sampleName
```

This should only be ran if a newer checkpoint has been saved, or if you are getting samples for the first time. All parameters are optional. The parameters are as follows:

**modelName** The name of the GPT-2 model. Accepted values: `117M`, `124M`, `345M`, `355M`, `774M`, `1558M`

**modelNumber** This parameter is **suggested**, though not required. The number of the model to copy over. If this is unset, all models will be copied over and the one determined by the checkpoint file will be used.

**checkpointName** The name of the checkpoint. Default as `run1`

**sampleName** An arbitrary name for the sample. Default as `sample`

An example of this command being ran for the model number `500` with no other options changed previously, is:

```
./samplegen.sh 500
```



After running that command, you can either run conditional samples (Requiring user input) via something like:

```
python src/interactive_conditional_samples.py --temperature 0.8 --top_k 40 --model_name sample
```

Or samples requiring no user input:

```
python src/generate_unconditional_samples.py --temperature 0.8 --top_k 40 --model_name sample
```

You can check the args and stuff of the commands, but they're pretty simple. Replace `sample` with whatever your `sampleName` argument was in the command above.


## Citation

Please use the following bibtex entry:
```
@article{radford2019language,
  title={Language Models are Unsupervised Multitask Learners},
  author={Radford, Alec and Wu, Jeff and Child, Rewon and Luan, David and Amodei, Dario and Sutskever, Ilya},
  year={2019}
}
```

## License

[MIT](./LICENSE)
