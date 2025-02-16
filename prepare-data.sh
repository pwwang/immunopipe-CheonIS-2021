#!/usr/bin/env bash

# The URL to the tar file
DATAURL="https://ftp.ncbi.nlm.nih.gov/geo/series/GSE176nnn/GSE176201/suppl/GSE176201_RAW.tar"
DATAFILE="prepared-data/GSE176201.tar"

echo "- Make the directory for prepared data ..."
mkdir -p prepared-data

echo "- Download the data if needed ..."
if [ ! -e $DATAFILE ]; then
    wget -O $DATAFILE $DATAURL
fi

echo "- Extract the data ..."
tar -xvf $DATAFILE --directory=./prepared-data

echo "- Separate desired samples ..."
# for sample in 20201208 20210119 20210122_1 20210122_2 20210201 20210203; do
for sample in 20210122_1 20210122_2; do
    echo "  - s$sample ..."
    mkdir -p prepared-data/s"$sample"
    suffix=$(echo "$sample" | cut -d'_' -f2)
    stem=$(echo "$sample" | cut -d'_' -f1)
    # mv prepared-data/GSM*_"${sample}"_GEX_*.gz prepared-data/"$sample"/
    mv prepared-data/GSM*_GEX*"${stem}"_*_"${suffix}"*.filtered_feature_bc_matrix.h5 prepared-data/"s$sample"/filtered_feature_bc_matrix.h5
    mv prepared-data/GSM*_TCR_"${stem}"_*_"${suffix}".filtered_contig_annotations.csv.gz prepared-data/"s$sample"/filtered_contig_annotations.csv.gz
done
for sample in 20201208 20210119 20210201 20210203; do
    echo "  - s$sample ..."
    mkdir -p prepared-data/s"$sample"
    # mv prepared-data/GSM*_"${sample}"_GEX_*.gz prepared-data/"$sample"/
    mv prepared-data/GSM*_GEX*"${sample}"_*.filtered_feature_bc_matrix.h5 prepared-data/"s$sample"/filtered_feature_bc_matrix.h5
    mv prepared-data/GSM*_TCR_"${sample}"_*.filtered_contig_annotations.csv.gz prepared-data/"s$sample"/filtered_contig_annotations.csv.gz
done

echo "- Remove unnecessary files ..."
rm -rf prepared-data/*.gz prepared-data/*.h5

echo "- Done!"
