# Custom bash script to generate the common mannkendall docs
# Created Septemeber 2020; F.P.A. Vogt; frederic.vogt@meteoswiss.ch

# Generate the documentation, storing it in the build directory
sphinx-build -a -b html ./source ./build
