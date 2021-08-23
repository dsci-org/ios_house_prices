# IOS predict prices

author: steeve laquitaine



# setup

```bash
conda create ios_predict python==3.6.2
conda activate ios_predict
```

# model building

```bash
python src/build_model.py 
# produces bhousing.mlmodel in project's root
```

# create xcode project

1. open xcode
2. select single view app - ios - swiftUI
3. move `bhousing.mlmodel` to 