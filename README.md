# Parameter scan

<sup>Latest version: v0.10.1</sup> <!-- x-release-please-version -->

[![Build history](https://buildstats.info/github/chart/engeir/parameter-scan?branch=main)](https://github.com/engeir/parameter-scan/actions)

> [!NOTE]
>
> I compile this using an installation of [tinytex] via [mise]. No additional packages
> need to be installed with `tlmgr` after this.

To run the continuous compiler, use the command

```bash
latexmk -cd -pvc -pdf agujournaltemplate.tex
```

You clean up files with

```bash
latexmk -c
```

[`tectonic`] also works in place of `latexmk`, which is independent of any texlive or
similar distribution as it embeds all in a single binary.

```bash
tectonic -Z shell-escape --keep-intermediates agujournaltemplate.tex
```

<!-- dprint-ignore-start -->
> [!TIP]
>
> [_View the generated PDF at the latest release!_](https://github.com/engeir/parameter-scan/releases/download/v0.10.1/agujournaltemplate.pdf) <!-- x-release-please-version -->
<!-- dprint-ignore-end -->

> For my own convenience, a comparison table comprising symbols used across the papers
> [G16], [M14] and [J05]. They all use $T$for the temperature and $N$for the net
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
[mise]: https://mise.jdx.dev/
[tinytex]: https://yihui.org/tinytex/
[`tectonic`]: https://github.com/tectonic-typesetting/tectonic
