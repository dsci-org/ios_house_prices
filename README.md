# IOS predict prices

**author**: steeve laquitaine

**Description**:  This is the codebase for a small iOS app that reports price predictions based on various house variables 
such as the number of rooms, etc.,.. The predictions are calculated by a machine learning model trained 
on the Boston housing dataset.

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
2. select single view app - ios - swiftUI (no need to select a team: None)
3. Manually move `bhousing.mlmodel` to `core_ml_demo/` folder

# Edit contentView.swift

`contentView.swift` must be programmed with Apple's `Swift` programming language.

# Build and run

* select e.g., `simulator iphone 11 Pro Max`
* build (`Ctrl + r`) or click `play`

A interactive simulator phone will appear to preview and test the app