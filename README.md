# immunopipe-CheonIS-2021


Reanalysis of the scRNA-seq and scTCR-seq data from [Cheon, I. S., 2021](https://www.science.org/doi/full/10.1126/sciimmunol.abk1741) using [immunopipe](https://github.com/pwwang/immunopipe).

> [Cheon, I. S., Li, C., Son, Y. M., Goplen, N. P., Wu, Y., Cassmann, T., Wang, Z., Wei, X., Tang, J., Li, Y., Marlow, H., Hughes, S., Hammel, L., Cox, T. M., Goddery, E., Ayasoufi, K., Weiskopf, D., Boonyaratanakornkit, J., Dong, H., . . . Sun, J. (2021). Immune signatures underlying post-acute COVID-19 lung sequelae. Science Immunology.](https://www.science.org/doi/full/10.1126/sciimmunol.abk1741)
>

## Data preparation

The data was downloaded from [GSE176201](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE176201), where 6 samples from 5 patients were sequenced with scRNA-seq and scTCR-seq.

See `prepare-data.sh` for details.

## Configuration

> [!NOTE]
> This is not a replication of the original paper.
>

The configuration is a minimal one, which includes very basic steps such as clustering, and differential expression analysis, together with a dotplot of signature genes shown in Figure 4 of the original paper. The configuration can be found in `Immunopipe.config.toml`.

## Results/Reports

You can find the results in the `Immunopipe-output` directory.

The report can be found at [https://imp-cheonis-2021.pwwang.com/REPORTS](https://imp-cheonis-2021.pwwang.com/REPORTS).
