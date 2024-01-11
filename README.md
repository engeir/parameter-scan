# Parameter scan

<sup>Latest version: v0.4.9</sup> <!-- x-release-please-version -->

To run the continuous compiler, use the command

```bash
latexmk -cd -pvc -pdf templateV6.1.tex
```

You clean up files with

```bash
latexmk -c
```

`tectonic` also works in place of `latexmk`:

```bash
tectonic -Z shell-escape --keep-intermediates templateV6.1.tex
```

<!-- dprint-ignore-start -->
[_View the generated PDF at the latest release!_](https://github.com/engeir/parameter-scan/releases/download/v0.4.9/templateV6.1.pdf) <!-- x-release-please-version -->
<!-- dprint-ignore-end -->

> For my own convenience, a comparison table comprising symbols used across the papers
> [G16], [M14] and [J05]. They all use $T$ for the temperature and $N$ for the net
> downward radiative heat flux at TOA.
>
> | Name                         | [G16]              | [M14]                       | [J05]       |
> | ---------------------------- | ------------------ | --------------------------- | ----------- |
> | Forcing                      | $F$                | $\mathcal{F}$               | $Q$         |
> | Climate feedback parameter   | $\alpha$           | $\beta$                     | $\lambda$   |
> | Climate sensitivity          | $1/\alpha$         | $1/\beta$                   | $1/\lambda$ |
> | Climate resistance           | $\rho$             | $\tilde{\beta}$             | $-$         |
> | TCRP                         | $1/\rho$           | $1/\tilde{\beta}$           | $-$         |
> | TCS                          | $F_{2\times}/\rho$ | $F_{2\times}/\tilde{\beta}$ | $-$         |
> | Ocean heat uptake efficiency | $\kappa$           | $\gamma$                    | $-$         |

[G16]: https://doi.org/10.1007/s00382-016-3055-1
[M14]: https://doi.org/10.1175/JCLI-D-14-00214.1
[J05]: https://doi.org/10.1007/s00382-005-0066-8
