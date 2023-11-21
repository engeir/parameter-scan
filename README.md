# Parameter scan

<sup>Latest version: v0.3.4</sup> <!-- x-release-please-version -->

To run the continuous compiler, use the command

```bash
latexmk -cd -pvc -pdf templateV5.tex
```

You clean up files with

```bash
latexmk -c
```

`tectonic` also works in place of `latexmk`:

```bash
tectonic templateV5.tex
```

## Notes

### Large eruptions compared to small

- $\mathrm{SO_2}$ oxidises more slowly due to lack of OH, which delays the peak AOD
  level
- Aerosols grow to larger radii, which makes them less efficient at scattering
  radiation, so you have less cooling for the same amount of injected $\mathrm{SO_2}$
- Larger aerosols stay for a shorter time due to being heavier (and other causes?
  Verify.)
- RF plot show similar shape when they are scaled; smaller eruptions are more efficient
  throughout, but especially in the early phase, why?

- [x] Create an estimate of climate sensitivity from volcanoes. G16 talks about what
      they got in J05, so maybe comparing is worthwhile. _Did find the TCRP according to
      M14, which gives some ground for comparison, but the climate feedback parameter is
      missing._

### Climate sensitivity estimate

- Would smaller alpha give smaller or larger temp in Jones et al.?
- Climate resistance estimates. Maybe the difference in climate resistance we get
  compared to what J05 used can be a pointer on that the small RF to AOD ratio they got
  was too small even for such a large eruption.

> The peak forcing was about $-60\mathrm{Wm^{-2}}$, only $20$ times greater than
> Pinatubo, and the climate feedback parameter $\alpha \simeq 4\mathrm{Wm^{-2}K^{-1}}$,
> more than twice the value (half the climate sensitivity parameter [which is the
> reciprocal]) that we found for Pinatubo in HadCM3.
>
> G16

$1/\rho$ is the "transient climate response parameter" (where
$\mathrm{TCS}=F_{2\times}\times \mathrm{TCRP}$ is the transient climate sensitivity),
where $\rho $ is a climate resistance obtained from $F(t)=\rho T(t)$, where the forcing
increase at a roughly constant rate.

The climate feedback parameter $\alpha$ and the ocean heat uptake efficiency $\kappa$
are both positive, and $\rho =\alpha +\kappa$. In this picture, $T$ is a surface skin
temperature, with negligible thermal inertia, determined by the Earth energy balance
$F=N+\alpha T$, where $N$ is the net downward radiative heat flux at the top of the
atmosphere, and $N=\kappa T$ if we neglect heat storage other than in the ocean. We call
$F=\rho T$ the "zero-layer model".

"For volcanic forcing which is large in magnitude for only a year or two, the {tcrp} and
the zero-layer model are therefore not applicable." They (G16) use an abruptPin
simulation to estimate the climate feedback parameter $\alpha$ for volcanic forcing in
comparison to forcing from for example $4\times \mathrm{CO_2}$. Possible to use method
outlined by M14? That is,

G16 use $F=N+\alpha T$ while J05 use $Q=N+\lambda \Delta T$ to describe the same thing.
Also, M14 is using $\tilde{\beta}=\rho$, $\beta =\alpha =\lambda $, $\gamma =\kappa$ and
$\mathcal{F}=F$.

> Caption
>
> For my own convenience, a comparison table comprising symbols used across the papers
> G16, M14 and J05. They all use $T$ for the temperature and $N$ for the net downward
> radiative heat flux at TOA

| Name                         | G16                | M14                         | J05         |
| ---------------------------- | ------------------ | --------------------------- | ----------- |
| Forcing                      | $F$                | $\mathcal{F}$               | $Q$         |
| Climate feedback parameter   | $\alpha$           | $\beta$                     | $\lambda$   |
| Climate sensitivity          | $1/\alpha$         | $1/\beta$                   | $1/\lambda$ |
| Climate resistance           | $\rho$             | $\tilde{\beta}$             | $-$         |
| TCRP                         | $1/\rho$           | $1/\tilde{\beta}$           | $-$         |
| TCS                          | $F_{2\times}/\rho$ | $F_{2\times}/\tilde{\beta}$ | $-$         |
| Ocean heat uptake efficiency | $\kappa$           | $\gamma$                    | $-$         |
