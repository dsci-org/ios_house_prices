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

# Create xcode project and add model

1. open xcode
2. select single view app - ios - swiftUI
3. move `bhousing.mlmodel` to `core_ml_demo/` folder

# Edit contentView.swift

see `contentView.swift`

# Build and run

* select e.g., `simulator iphone 11 Pro Max`
* build (`Ctrl + r`) or click `play`

A interactive simulator phone will appear to preview and test the app