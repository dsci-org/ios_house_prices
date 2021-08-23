# author: steeve laquitaine

import pandas as pd
from sklearn.linear_model import LinearRegression
from sklearn.datasets import load_boston
import coremltools as cml

# Load data
boston = load_boston()
boston_df = pd.DataFrame(boston["data"])
boston_df.columns = boston["feature_names"]
boston_df["PRICE"]= boston["target"]

y = boston_df["PRICE"]
X = boston_df.loc[:,["RM", "AGE", "PTRATIO"]]

# Train a model
lm = LinearRegression()
lm.fit(X, y)


# Convert sklearn model to CoreML
model = cml.converters.sklearn. \
convert(lm,
        ["RM", "AGE", "PTRATIO"],
        "PRICE")

# Assign model metadata
model.author = "Medium Author"
model.license = "MIT"
model.short_description = \
"Predicts house price in Boston"

# Assign feature descriptions
model.input_description["RM"] = \
"Number of bedrooms"
model.input_description["AGE"] = \
"Proportion of units built pre 1940"
model.input_description["PTRATIO"] = \
"Pupil-teacher ratio by town"
# Assign the output description
model.output_description["PRICE"] = \
"Median Value in 1k (USD)"

# Save model
model.save('bhousing.mlmodel')