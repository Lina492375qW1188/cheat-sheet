Sharing => remote login
```
ssh sunting@cheme-bonderman.engin.umich.edu
conda activate patchy-mi
jupyter-lab --no-browser --port=8889
ssh -N -f -L localhost:8888:localhost:8889 sunting@cheme-bonderman.engin.umich.edu
```

Past `localhost:8888` to web browser with token.
