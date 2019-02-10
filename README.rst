################################
pl-tensorflowapp
################################


Abstract
********

Sample Tensorflow application plugin for Chris Project.
The application is a digit-identification application based on MNIST data.

Run
***

.. code-block:: bash

usage: tensorflowapp.py [-h] [--json] [--savejson DIR] [--inputmeta INPUTMETA]
                        [--saveinputmeta] [--saveoutputmeta] [--prefix PREFIX]
                        [--inference_path imagedir] inputdir outputdir

Runs the tensorflow application.

positional arguments:
  inputdir              directory containing the input files
  outputdir             directory containing the output files/folders
  inference_path        directory containing the test digit images

optional arguments:
  -h, --help            show this help message and exit
  --json                show json representation of app and exit
  --savejson DIR        save json representation file to DIR and exit
  --inputmeta INPUTMETA
                        meta data file containing the arguments passed to this
                        app
  --saveinputmeta       save arguments to a JSON file
  --saveoutputmeta      save output meta data to a JSON file
  --prefix PREFIX       prefix for file names



Using ``docker run``
====================

Assign an "input" directory to ``/incoming`` and an output directory to ``/outgoing``.
The input is prepopulated with mnist data.

.. code-block:: bash

    mkdir -p input && mkdir -p output




**To train the mnist model**.
Below command will train a mnist model and output the accuracy to a file in ``$(pwd)/output`` folder.

.. code-block:: bash

    docker run --rm -v $(pwd)/input:/incoming -v $(pwd)/output:/outgoing   \
            submod/pl-tensorflowapp tensorflowapp.py            \
            --prefix mnist-                                     \
            /incoming /outgoing



**To train the mnist model & also run inference**.
Below command will train a mnist model also run inference on the test image against the mnist model.

.. code-block:: bash

    docker run --rm -v $(pwd)/input:/incoming -v $(pwd)/output:/outgoing   \
            submod/pl-tensorflowapp tensorflowapp.py            \
            --prefix mnist-                                     \
            --inference_path /incoming/test/test.png            \
            /incoming /outgoing



Make sure that the host ``$(pwd)/output`` directory is world writable!
