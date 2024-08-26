#import "@preview/cheq:0.1.0": checklist
#import "@preview/gentle-clues:0.9.0": *
#import "@preview/subpar:0.1.1"
#import "@preview/wrap-it:0.1.0": wrap-content
#import "@preview/metro:0.3.0": *
#declare-unit("tgs", "Tg(S)")
#declare-unit("tgso2", $"Tg(SO"_2")"$)
#declare-unit("yr", "yr")
#declare-unit("test", $"SO"_2$)

#set par(justify: true)

#show: checklist
#show link: underline

// Define a clue called ghost
#let reply(title: "Reply", ..args) = info(
  accent-color: silver,
  title: title,
  breakable: true,
  ..args,
)

#let title = [Response after first review]

#set page(
  header: align(
    right + horizon,
    title,
  ),
)

#align(
  center,
  text(17pt)[
    *#title*
  ],
)

== Main takeaways

- Change AOD into exp(-tau) (where tau refers to optical depth as typically used in the
  Beer-Lambert law, so tau=AOD)
- More emphasis on aerosol size (aerosol effective radius is output from CESM2 as
  `REFF_AERO`)
- Consideration of AOD, ERF and GMST in reference to volcanic eruptions and their
  radiation and climate impact (long-standing question), not only of AOD and ERF and
  their relationship (known)

== Reviewer \#1 Evaluations

- Recommendation: Return to author for major revisions
- Significant: There are major errors or gaps in the paper but it could still become
  significant with major changes, revisions, and/or additional data.
- Supported: Mostly yes, but some further information and/or data are needed.
- Referencing: Mostly yes, but some additions are necessary.
- Quality: The organization of the manuscript and presentation of the data and results
  need some improvement.
- Data: Yes
- Accurate Key Points: Yes

== Reviewer \#1 (Formal Review for Author (shown to authors))

This paper uses simulations with the CESM2-WACCM model to investigate radiative forcing
and surface temperature impacts of volcanic eruptions spanning magnitudes from
Pinatubo-size to super eruptions. The paper highlights a number of non-linearities and
time dependent changes in the response to different sized eruptions, and suggests that
the primary difference between results from different models is tied to their chemical
treatment of aerosol formation and growth.

The results are not very surprising, but there is significant value in the way the
analysis is done, especially with regard to comparisons to other simulations. There are
a few aspects I believe warrant further analysis before the paper is to be considered to
publication.

=== General comments

The assumption of linearity between AOD and radiative forcing has been around for a long
time, e.g. #cite(<hansen2005b>, form: "prose"). What was not often stated is that this
assumption is physically justified only for smaller eruptions, since by Beer's law, the
reduction in radiation for a given AOD tau is exp(-tau). For small tau, we can
approximate exp(-tau) as 1-tau, giving a linear relationship. If tau gets large, then
clearly this linear assumption will break down. This likely is the main reason why the
relationship between ERF and AOD is not the same for the different sized eruptions in
this paper. I would strongly encourage the authors to revise their analysis to include
consideration of the relationship between ERF and exp(-tau). This was done e.g. by
Marshall et al. (2020) which showed a more compact relationship between he two factors.
I believe this will be much more important in this study since it explores an even
larger range of AOD values. Note that I have not been very thorough in my critique of
the results and discussion since I believe they will change a lot once this change in
analysis is done.

#reply[
  Letting $"AOD"->1-exp(-"AOD")$ means that the most extreme AOD values will now be
  mapped to $~ 1$. Please find below the figures 1 to 4 with AOD adjusted. Since we are
  mostly interested in the more extreme AOD values, where $"AOD">1$, this region will be
  mapped to a very narrow range, and thus we did not find much use of it. If you find
  they should be included we are however open to including the adjusted figures as well.

  #box(
    width: 100%,
    columns(2, gutter: 1pt)[
      #figure(
        image("./figure1-aod-exp.jpg"),
        caption: [AOD represented as $1-exp(-"AOD")$],
      )
      #figure(
        image("./figure2-aod-exp.jpg"),
        caption: [AOD represented as $1-exp(-"AOD")$],
      )
      #figure(
        image("./figure3-aod-exp.jpg"),
        caption: [AOD represented as $1-exp(-"AOD")$],
      )
    ],
  )

  #figure(
    image("./figure4-aod-exp.jpg"),
    caption: [AOD represented as $1-exp(-"AOD")$],
  )
]

It is well known that as eruption magnitude increases, stratospheric aerosol size will
increase, promoting aerosol loss through gravitational settling, and affecting the
efficiency of radiative forcing (Pinto et al. 1989, Lacis et al., 1992, Timmreck et al.,
2009, Timmreck et al., 2010). It is also clear that differences in aerosol size
distribution is the primary cause of differences between models in terms of the
magnitude and evolution of AOD and radiative forcing for volcanic eruptions (Clyne et
al., 2020). I was surprised that these factors were not investigated in this study. It
would be very valuable to include analysis of the simulated aerosol size in the present
study. Failing this, at least the importance of aerosol size should be included in the
introduction and discussion sections.

#reply[
  This has been valuable input which now better explains our results and conclusions,
  specifically in relation to Fig. 4f.

  As Brenna et al. (2020) run similar simulations and go deeper into effective radius,
  we do not provide a deeper analysis here other than to mention the importance of
  effective radius. We include results from Brenna et al. (2020) and McGraw et al.
  (2024) in Fig. 4 for comparison which aligns well with our simulations, and instead
  point to their studies for a deeper analysis as this is not our main focus. Note also
  that only the effective radius of #qty(0.6, "micro meter") from McGraw et al. (2024)
  is included, as this is the only effective radius that was run by McGraw et al. (2024)
  across the full SO2 range.

  Below is also shown a plot of effective radius from four new simulations (original
  model output from the initial single-eruption simulations has unfortunately been
  deleted to limit data storage). These simulations show equatorial double-eruptions of
  26&26 and 400&400 TgSO2, with separation of two and four years.
  #figure(
    image("./reff.jpg"),
    caption: [Effective radius of double eruption events from two identical eruptions of
      26 and 400 TgSO2.],
  )
]

=== Specific comments

- [x] L11: Here and throughout, be careful whether to refer to "super-volcanoes" or
  "super-eruptions". A supervolcano is just a volcano that has produced a super eruption
  at some point in its history. Volcanoes are just mountains most of the time. An
  eruption is what puts sulfur and other stuff into the atmosphere.

  #reply[Text has been adjusted to use "supereruption".]

- [x] L15: Radiative forcing (RF) is a general term, effective radiative forcing (ERF)
  and instantaneous radiative forcing (IRF) are two types of RF. If you are specifically
  dealing with ERF, I would suggest using this more specific name and acronym
  throughout.

- [x] L25: The evolution is SO2 is rather simple to describe, it is chemically converted
  to H2SO4. The evolution of sulfate aerosol is more complicated as it involves the
  formation and growth of the aerosol size distribution. I assume it's the evolution of
  aerosol that is most important to the radiative forcing and climate impacts in the
  simulations?

- [x] L31: Unfortunately for our intro sentences, the eruptions don't directly emit
  sulfate aerosols (at least not very much), they emit gases which produce aerosols.
  Best to be accurate even if it costs a few more words.

- [x] L33: the ERF is not quite the change in energy balance at TOA - it is that when
  surface temperature is held fixed.

- [x] L55: the origin of RF=-25*AOD is #cite(<hansen2005b>, form: "prose"), best to cite
  that study here. It is also relevant that this scaling has been used in subsequent
  IPCC reports, but that is worth its own statement.

- [x] L63: Robock (2000) is a review paper, better to cite direct observational studies
  to support this estimate of the SO2 lifetime.

- [x] L63: the peak in AOD (at 500 nm) and thus the RF depends also on the aerosol size
  distribution, which evolves on a longer time scale than the conversion of SO2 to
  aerosol.

- [x] L75: I don't remember Sigl et al. (2022) quantifying the impact of eruptions vs
  other sources of variability. Schurer et al. (2013) might be a more appropriate
  citation here.

- [x] L94: I believe the standard format would be to use the plus/minus symbol rather
  than brackets on these numbers.

- [ ] L95: These are stratospheric aerosol simulations, not volcano simulations.

- [x] L104: SO2 injection rate would be mass per unit time, but I think you mean SO2
  amount here.

  #reply[As the function they provide is for maximum forcing anomaly after saturation from a
    given SO2 injection rate, as presented in Niemeier and Timmreck (2015) Fig.1 (left).]

- [x] L107: this doesn't seem right, as -18 W/m^2 seems quite small for a 1700 TgSO2
  eruption if the scaling factor is 65 W/m^2 per TgSO2?

  #reply[
    From Niemeier and Timmreck (2015):
    $
      Delta R_"TOA" = qty("-65", "W / m^2") exp^(-(
        (qty(2246, "tgs per yr")) / x
      )^0.23)
    $
    For an annual $"SO"_2$ injection of $qty(1700, "tgso2")=qty(850, "tgs")$ the above yields
    $
      Delta R_"TOA" = qty(-65, "W / m^2") exp^(-(
        2246 / 850
      )^0.23) approx qty(-18.6, "W/m^2")
    $
    So, from assuming an annual total injection of $850"TgS"$, the equation is
    consistent with the model output from Timmreck el al. (2010) of #qty(-18, "W/m^2").

    There is of course a significant difference between continuous injection (as used in
    Niemeier and Timmreck (2015) to fit to the equation) and an eruption simulation as
    in Timmreck et al. (2010). This has hopefully been made more clear in the text now.
  ]

- [x] L135: I don't agree with this statement-a super eruption is going to produce much
  different aerosol characteristics than a cluster of smaller eruptions.

  #reply[This was indeed the intended meaning, where the reference to the 100xPinatubo
    simulation by Jones et al. (2005) was the example used to illustrate some potential
    errors or biases that can come up. It is thus used as motivation for why the
    simulations using SO2 input are an interesting and more physically complete
    comparison. The section has been re-phrased to better highlight this.]

- [x] Table 1: I find these ensemble labels very non-intuitive. Since all experiments
  use CESM2(WACCM) the C2W can be left out of the labels. Arrows are typically used to
  indicate directions, not relative magnitudes. I strongly encourage the authors to use
  labels which more intuitively communicate the relative magnitude of the eruption
  simulations and thus the differences between the ensembles.

  #reply[Ensembles are now specified as `S<TgSO2>` and an extra `N` for the Northern
    latitude eruption ensemble.]

- [x] L157: The method section needs a description of how ERF was calculated.

- [x] L178: Well, in order of magnitude sure, but there's a factor of about 2
  difference, best to be clear about this.

- [x] L182: Is the SO2 injected uniformly between these altitudes?

  #reply[Adjusted to now specify the percentage at all three vertical levels.]

- [x] L197, importantly it's the Normalized RF and temperature timeseries that are
  indistinguishable here.

- [x] L204: again, the normalized AOD

- [x] Figure 3: It looks like in this plot all ensemble members are plotted, as well as
  a standard deviation range of the ensemble. This seems redundant, either all the
  members or the mean and SD would seem to be sufficient and would improve the
  readability of the plot.

- [x] L269: Here is one example where I expect this result may change when you consider
  not AOD but exp(-AOD).

- [x] L338: I'd argue that the temperature anomalies from a simulation with fixed SSTs
  are close to meaningless in comparison with coupled ocean simulations.

  #reply[
    This was included to illustrate the difference, but can be removed if this makes the
    figure more clear.
  ]

- [x] Fig. 4: everything that is a peak value should be referred to as such on figure
  axis labels in in caption.

  #reply[
    In this figure, everything plotted are peak values. This has now been explicitly
    stated in the figure caption.
  ]

- [ ] L364: why is this being assumed when it has been shown this isn't very valid?

- [ ] L365: It seems as if x is referring to different quantities in the different
  equations. Much more attention to detail needed if this mathematical framework is to
  be explained in sufficient detail.

- [x] L378: Volcanic forcing definitely lasts for more than a year!

- [x] L398: It's quite well known that simply scaling up the forcing for Pinatubo is not
  a good representation of forcing from super eruptions, see e.g. Timmreck et al. (2009)
  and Timmreck et al. (2010). That the AOD used in Jones et al. leads to a too strong RF
  is therefore not very surprising.

  #reply[
    The aim of this section was to put more confidence into the lower bound (upper in
    Fig4) of the temperature perturbation. This has been slightly re-worded and an extra
    citation to aerosol effective radius studies has been included to hopefully make
    this more precise.
  ]

=== References

- [ ] Timmreck, C., Lorenz, S. J., Crowley, T. J., Kinne, S., Raddatz, T. J., Thomas, M.
  A., and Jungclaus, J. H.: Limited temperature response to the very large AD 1258
  volcanic eruption, Geophys. Res. Lett., 36,
  #link("https://doi.org/10.1029/2009GL040083"), 2009.
- [x] Timmreck, C., Graf, H.-F., Lorenz, S. J., Niemeier, U., Zanchettin, D., Matei, D.,
  Jungclaus, J. H., and Crowley, T. J.: Aerosol size confines climate response to
  volcanic super-eruptions, Geophys. Res. Lett., 37, L24705,
  #link("https://doi.org/10.1029/2010GL045464"), 2010. @timmreck2010
- [ ] Schurer, A. P., Hegerl, G. C., Mann, M. E., Tett, S. F. B., and Phipps, S. J.:
  Separating Forced from Chaotic Climate Variability over the Past Millennium, J.
  Clim., 26, 6954-6973, #link("https://doi.org/10.1175/JCLI-D-12-00826.1"), 2013.
- [ ] Pinto, J. P., Turco, R. P., and Toon, O. B.: Self-limiting physical and chemical
  effects in volcanic eruption clouds, J. Geophys. Res., 94, 11165,
  #link("https://doi.org/10.1029/JD094iD08p11165"), 1989.
- [ ] Lacis, A., Hansen, J., and Sato, M.: Climate forcing by stratospheric aerosols,
  Geophys. Res. Lett., 19, 1607, #link("https://doi.org/10.1029/92GL01620"), 1992.
- [ ] Clyne, M., Lamarque, J. F., Mills, M. J., Khodri, M., Ball, W., Bekki, S., Dhomse,
  S. S., Lebas, N., Mann, G., Marshall, L., Niemeier, U., Poulain, V., Robock, A.,
  Rozanov, E., Schmidt, A., Stenke, A., Sukhodolov, T., Timmreck, C., Toohey, M.,
  Tummon, F., Zanchettin, D., Zhu, Y., and Toon, O. B.: Model physics and chemistry
  causing intermodel disagreement within the VolMIP-Tambora Interactive
  Stratospheric Aerosol ensemble, Atmos. Chem. Phys., 21, 3317-3343,
  #link("https://doi.org/10.5194/ACP-21-3317-2021"), 2021.
- [x] Marshall, L. R., Smith, C. J., Forster, P. M., Aubry, T. J., Andrews, T., and
  Schmidt, A.: Large variations in volcanic aerosol forcing efficiency due to
  eruption source parameters and rapid adjustments, Geophys. Res. Lett., 47,
  #link("https://doi.org/10.1029/2020gl090241"), 2020. @marshall2020
- [ ] #cite(<hansen2005b>, form: "full")

== Reviewer \#3 Evaluations

- Recommendation: Return to author for major revisions
- Significant: The paper has some unclear or incomplete reasoning but will likely be a
  significant contribution with revision and clarification.
- Supported: Mostly yes, but some further information and/or data are needed.
- Referencing: Mostly yes, but some additions are necessary.
- Quality: The organization of the manuscript and presentation of the data and results
  need some improvement.
- Data: Please Select
- Accurate Key Points: No

== Reviewer \#3 (Formal Review for Author (shown to authors))

This study investigates the atmospheric radiative forcing by super eruptions.

_The new aspect of this paper is on the relationship of effective radiative forcing,
aerosol optical depth and surface temperature by eruptions larger than Pinatubo, which
is a long-standing topic in the field of volcanic eruptions and their impacts on
radiation and climate._

The paper presents new model results from the CESM2(WACCM6) model with 2 deg horizontal
resolution, prescribed sea surface temperature and sea ice, 1850 conditions, and a
Middle Atmosphere chemistry configuration taking different strength of sulfur-only
emissions into the stratosphere, from Pinatubo strength to super-size eruption, into
account.

_A non-linear behavior is modelled for Effective Radiative Forcing (ERF) and Aerosol
Optical Depth (AOD) for eruptions larger than Pinatubo. This has been shown for
Radiative Forcing (RF) estimates and model calculations before and is well accepted and
taken over by the community._

Thus, the authors need to substantially revise the paper to clarify the new angle in the
context of the existing, large body of literature. I believe this will be feasible for
the authors when addressing my below comments carefully. In that case I would be happy
to review a thoroughly revised manuscript again. See my general major and minor
comments, and a list of references to take care of below.

=== General major comments

1. The background, status quo of the research field, and what is new in this study has to
  be carefully revised. There are many studies already published on the non-linearity
  of volcanic eruption strength impacts on AOD and RF. This has been taken over by the
  volcano climate model community. This background/status quo needs to be carefully
  included and revised in the ms; original references need to be cited. Following, pls
  reformulate what is new and different in your study. See a list of key references for
  an overview below.

  #reply[
    More on the non-linearities are now described in the introduction, as well as in the
    discussion. It should be more clear now that the focus regarding the non-linear
    relationship between AOD and ERF is on the development over time in the
    post-eruption period rather than across SO2 injection magnitudes.
  ]

2. Abstract and elsewhere in the ms need carefully rewording: "Unlike the traditional
  linear models used for smaller eruptions, our results reveal..." I would argue
  against that a linear model is still used ("traditionally") for large eruptions such
  as Pinatubo (which are here called small).

3. The authors need to introduce and define the concept of Effective Radiative Forcing in
  contrast to Radiative Forcing used in other studies.

  // TODO:
  // - Describe ERF / IRF / RF (See Forster et al. 2016 and Myhre et al. 2013
  //   (Anthropogenic...))

4. There are several super-eruptions publications which are relevant for this study, but
  they are not included and referred to: Bekki et al 1996; Robock et al 2009; Timmreck
  et al 2010 and 2012; Brenna et al 2020, MacGraw & Polvani, 2024. Brenna et al 2020
  shows the non-linear effect and the disagreement between models with increasing
  strength of eruption.

5. AOD-RF relationship depends on the effective radius etc (Pinto et al 1989; Bekki et al
  1995&1996; Timmreck et al 2009 ff).

6. Different eruption strength, season and latitude and their impact on AOD, RF, climate,
  etc is published already in Schneider et al 2009, Toohey et al 2011, 2013, 2019,
  Metzner et al 2014, Marshall et al 2019ff, Quaglia et al 2023, Zhuo et al 2024.

7. Model uncertainties on the SO2-AOD-effective radius of aerosols: Bekki et al
  1995&1996, Pinto et al 1989, Timmreck et al 2009 & 2010; Toohey et al 2011/2013/2019,
  Marshall et al 2018; Brenna et al 2020, Quaglia et al 2023; MacGraw et al 2024, Zhuo
  et al 2024.

8. Timing of maximum AOD, RF, climate for tropical versus high-latitude eruptions see
  Zhuo et al 2024.

9. How can you address surface temperature response if the ocean-sea ice is prescribed?
  I suggest taking this field out or using lower tropospheric temperature instead as
  well as discussing the corresponding uncertainties properly.

10. The model uncertainties need to be discussed (see Zanchettin et al 2016; Marshall et
  al 2018; Brenna et al 2020). CESM(WACCM) tend to simulate smaller aerosols sizes and
  thus a longer lifetime of and large AOD, RF and climate than the other existing
  aerosols climate models (Fig. 3a Zanchettin et al 2016).

11. Figs 2-4: Need to include the other existing Pinatubo-strength and supereruption
  studies and data (see references).

  #reply[
    Fig2 for peak values is shown in Fig4d, and for Fig3 we have kept only the data we
    have been able to get full time series of, so Fig2 and Fig3 are therefore the same.
    Several new studies have been included to Fig.4 in response to your comment.
  ]

=== Minor comments

1. "Super-eruption" but not super-volcano eruption (see f.e. Wilson et al 2021).

2. Define super eruption and other strength of eruptions. Pinatubo is not a "small"
  eruption. (cf. Metzner et al 2014; Schmidt & Black 2022).

3. Model experiments details such as fixed SST and sea ice, 1850 conditions need to go
  into Section 2.2 as they are important for the interpretation of the results.

4. MAM3 add on changes for stratospheric aerosols need to cite Mills et al (2016) Mills,
  M. J., et al. (2016), Global volcanic aerosol properties derived from emissions,
  1990-2014, using CESM1(WACCM), J. Geophys. Res. Atmos., 121,
  #link("https://doi.org/10.1002/2015JD024290").

5. Fig. 1 and ff Figs.: Which temperature field is plotted here; does it make sense if
  the ocean/sea-ice is prescribed?

=== References

==== Non-linear behavior

- [ ] Pinto et al. 1989, Hyde and Crowley 2000; Ammann et al. 2003; Gao et al. 2008;
  Metzner et al 2014. For large eruptions (see Methodology Section and References in
  Metzner et al 2014)
- [ ] Metzner, D., Kutterolf, S., Toohey, M. et al. Radiative forcing and climate impact
  resulting from SO2 injections based on a 200,000-year record of Plinian eruptions
  along the Central American Volcanic Arc. Int J Earth Sci (Geol Rundsch) 103,
  2063-2079 (2014). #link("https://doi.org/10.1007/s00531-012-0814-z")

==== Effective radius

- [ ] Pinto, J. R., R. P. Turco, and O. B. Toon (1989), Self-limiting physical and
  chemical effects in volcanic eruption clouds, J. Geophys. Res., 94, 11,165-11,174.
- [ ] Bekki et al 1995 Oxidation of volcanic SO2: A sink for stratospheric OH and H2O -
  Geophysical Research Letters
- [ ] Bekki et al 1996 The role of microphysical and chemical processes in prolonging
  the climate forcing of the Toba Eruption - Geophysical Research Letters
- [ ] Timmreck et al 2009 - Limited temperature response to the very large AD 1258
  volcanic eruption - Geophysical Research Letters
- [ ] Quaglia, I., Timmreck, C., Niemeier, U., Visioni, D., Pitari, G., Brodowsky, C.,
  Brühl, C., Dhomse, S. S., Franke, H., Laakso, A., Mann, G. W., Rozanov, E., and
  Sukhodolov, T.: Interactive stratospheric aerosol models' response to different
  amounts and altitudes of SO2 injection during the 1991 Pinatubo eruption, Atmos.
  Chem. Phys., 23, 921-948, #link("https://doi.org/10.5194/acp-23-921-2023"), 2023.

==== Effective Radiative Forcing

- [ ] Forster, P. M., T. Richardson, A. C. Maycock, C. J. Smith, B. H. Samset, G. Myhre,
  T. Andrews, R. Pincus, and M. Schulz (2016), Recommendations for diagnosing
  effective radiative forcing from climate models for CMIP6, J. Geophys. Res.
  Atmos., 121, 12,460-12,475, #link("https://doi.org/10.1002/2016JD025320").
- [x] Marshall et al 2021 - Unknown Eruption Source Parameters Cause Large Uncertainty
  in Historical Volcanic Radiative Forcing Reconstructions - Journal of Geophysical
  Research: Atmospheres @marshall2021

==== Super eruptions

- [ ] Bekki et al 1996 The role of microphysical and chemical processes in prolonging
  the climate forcing of the Toba Eruption - Geophysical Research Letters
- [ ] Brenna, H., Kutterolf, S., Mills, M. J., and Krüger, K.: The potential impacts of
  a sulfur- and halogen-rich supereruption such as Los Chocoyos on the atmosphere
  and climate, Atmos. Chem. Phys., 20, 6521-6539,
  #link("https://doi.org/10.5194/acp-20-6521-2020"), 2020.
- [ ] Brenna et al 2021 Decadal Disruption of the QBO by Tropical Volcanic
  Supereruptions - Geophysical Research Letters
- [x] English et al 2013 - Microphysical simulations of large volcanic eruptions:
  Pinatubo and Toba - Journal of Geophysical Research: Atmospheres @english2013
- [ ] McGraw, Z., K. DallaSanta, L. M. Polvani, K. Tsigaridis, C. Orbe, and S. E. Bauer,
  2024: Severe Global Cooling After Volcanic Super-Eruptions? The Answer Hinges on
  Unknown Aerosol Size. J. Climate, 37, 1449-1464,
  #link("https://doi.org/10.1175/JCLI-D-23-0116.1").
- [ ] Osipov, S., G. Stenchikov, K. Tsigaridis, A.N. LeGrande, S.E. Bauer, M. Fnais, and
  J. Lelieveld, 2021: The Toba supervolcano eruption caused severe tropical
  stratospheric ozone depletion. Communications Earth Environ., 2, no. 1, 71,
  #link("https://doi.org/10.1038/s43247-021-00141-7").
- [ ] Robock, A., C.M. Ammann, L. Oman, D. Shindell, S. Levis, and G. Stenchikov, 2009:
  Did the Toba volcanic eruption of ∼74k BP produce widespread glaciation? J.
  Geophys. Res., 114, D10107, #link("https://doi.org/10.1029/2008JD011652").
- [x] Timmreck et al 2010, Aerosol size confines climate response to volcanic
  super‐eruptions -Geophysical Research Letters @timmreck2010
- [ ] Timmreck et al, Climate response to the Tobasuper-eruption: Regional changes,
  Quaternary International, Volume 258,
  #link("https://doi.org/10.1016/j.quaint.2011.10.008."), 2012
- [ ] Wilson, C.J.N., Cooper, G.F.,Chamberlain, K.J. et al. No single model for
  supersized eruptions and their magmabodies. Nat Rev Earth Environ 2, 610-627
  (2021). #link("https://doi.org/10.1038/s43017-021-00191-7")

==== Different aerosol climate models and their uncertainties (for Tambora)

- [x] Zanchettin, D., Khodri, M., Timmreck, C., Toohey, M., Schmidt, A., Gerber, E. P.,
  Hegerl, G., Robock, A., Pausata, F. S. R., Ball, W. T., Bauer, S. E., Bekki, S.,
  Dhomse, S. S., LeGrande, A. N., Mann, G. W., Marshall, L., Mills, M., Marchand,
  M., Niemeier, U., Poulain, V., Rozanov, E., Rubino, A., Stenke, A., Tsigaridis,
  K., and Tummon, F.: The Model Intercomparison Project on the climatic response to
  Volcanic forcing (VolMIP): experimental design and forcing input data for CMIP6,
  Geosci. Model Dev., 9, 2701-2719,
  #link("https://doi.org/10.5194/gmd-9-2701-2016"), 2016. @zanchettin2016
- [ ] Marshall, L., A. Schmidt, M. Toohey, K.S. Carslaw, G.W. Mann, M. Sigl, M. Khodri,
  C. Timmreck, D. Zanchettin, W. Ball, S. Bekki, J.S.A. Brooke, S. Dhomse, C.
  Johnson, J.-F. Lamarque, A. LeGrande, M.J. Mills, U. Niemeier, J.O. Pope, V.
  Poulain, A. Robock, E. Rozanov, A. Stenke, T. Sukhodolov, S. Tilmes, K.
  Tsigaridis, and F. Tummon, 2018: Multi-model comparison of the volcanic sulfate
  deposition from the 1815 eruption of Mt. Tambora. Atmos. Chem. Phys., 18,
  2307-2328, #link("https://doi.org/10.5194/acp-18-2307-2018").

==== Different size/strength of eruptions on AOD, RF, climate

- [ ] Metzner, D., Kutterolf, S., Toohey, M. et al. Radiative forcing and climate impact
  resulting from SO2 injections based on a 200,000-year record of Plinian eruptions
  along the Central American Volcanic Arc. Int J Earth Sci (Geol Rundsch) 103,
  2063-2079 (2014). #link("https://doi.org/10.1007/s00531-012-0814-z")
- [ ] Miles et al 2004 The significance of volcanic eruption strength and frequency for
  climate - - Quarterly Journal of the Royal Meteorological Society
- [ ] Schmidt & Black, 2022, Reckoning with the Rocky Relationship Between Eruption Size
  and Climate Response: Toward a Volcano-Climate Index | Annual Reviews

==== Different eruption strength and season on AOD, RF, and atmospheric circulation

- [x] Toohey, M. et al: The influence of eruption season on the global aerosol evolution
  and radiative impact of tropical volcanic eruptions, Atmos. Chem. Phys., 11,
  12351-12367, #link("https://doi.org/10.5194/acp-11-12351-2011"), 2011. @toohey2011
- [ ] Toohey et al 2013 - Volcanic sulfate deposition to Greenland and Antarctica: A
  modeling sensitivity study - Journal of Geophysical Research: Atmospheres

==== Different eruption latitude and altitude on AOD, RF, and atmospheric circulation

- [x] Marshall et al 2019 Exploring How Eruption Source Parameters Affect Volcanic
  Radiative Forcing Using Statistical Emulation - Journal of Geophysical Research:
  Atmospheres @marshall2019
- [x] Toohey, M. et al. Disproportionately strong climate forcing from extratropical
  explosive volcanic eruptions. Nature Geosci 12, 100-107 (2019).
  #link("https://doi.org/10.1038/s41561-018-0286-2") @toohey2019

==== Different latitudes of eruptions - impacts on climate

- [ ] Schneider, D. P., C. M. Ammann, B. L. Otto-Bliesner, and D. S. Kaufman (2009),
  Climate response to large, high-latitude and low-latitude volcanic eruptions in
  the Community Climate System Model, J. Geophys. Res., 114, D15101,
  #link("https://doi.org/10.1029/2008JD011222").
- [ ] Zhuo, Z. et al: Initial atmospheric conditions control transport of volcanic
  volatiles, forcing and impacts, Atmos. Chem. Phys., 24, 6233-6249,
  #link("https://doi.org/10.5194/acp-24-6233-2024"), 2024.

==== CESM2(WACCM6) Pinatubo strength model runs in the tropics and NH extratropics

- [ ] Fuglestvedt et al. Volcanic forcing of high-latitude Northern Hemisphere
  eruptions. npj Clim Atmos Sci 7, 10 (2024).
  #link("https://doi.org/10.1038/s41612-023-00539-4")
- [ ] Zhuo, Z. et al.: Initial atmospheric conditions control transport of volcanic
  volatiles, forcing and impacts, Atmos. Chem. Phys., 24, 6233-6249,
  #link("https://doi.org/10.5194/acp-24-6233-2024"), 2024.

#bibliography("./agujournaltemplate.bib", style: "apa")
