################################
pl-tensorflowapp
################################


Abstract
********

test tf apps

Run
***

Using ``docker run``
====================

Assign an "input" directory to ``/incoming`` and an output directory to ``/outgoing``

.. code-block:: bash

    docker run --rm -v $(pwd)/in:/incoming -v $(pwd)/out:/outgoing   \
            fnndsc/pl-tensorflowapp tensorflowapp.py            \
            /incoming /outgoing

This will ...

Make sure that the host ``$(pwd)/out`` directory is world writable!







