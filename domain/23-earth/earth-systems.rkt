#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Earth Systems — geosphere, atmosphere, hydrosphere,
;;;   solar system, stars, and cosmology
;;; LAYER: 23-earth
;;; DEPENDS ON: 01-particles (matter), 03-atoms (elements),
;;;   04-molecules (H2O, CO2, silicates), 07-waves (seismic, EM),
;;;   08-relativity (cosmological expansion), 11-thermodynamics
;;;   (heat transfer, convection)
;;; DEPENDED ON BY: climate modeling, geology, planetary science,
;;;   astrobiology, environmental science
;;;
;;; PURPOSE: The structure and dynamics of Earth from core to
;;; atmosphere, the water and rock cycles, natural hazards, oceans,
;;; the solar system, stellar evolution, and cosmology.
;;;
;;; SCOPE: Only accepted, verified facts. No novel claims.
;;; Novel claims belong in research/, built on top of this domain.
;;;
;;; SOURCES:
;;; [Tarbuck-2020] Tarbuck & Lutgens, Earth Science, 16th ed.,
;;;   Pearson, 2020
;;; [NASA-2024] NASA Planetary Fact Sheets and Earth Fact Sheet,
;;;   nssdc.gsfc.nasa.gov (accessed 2024)
;;; [USGS-2024] United States Geological Survey, earthquake.usgs.gov
;;; [Carroll-2007] Carroll & Ostlie, An Introduction to Modern
;;;   Astrophysics, 2nd ed., Pearson, 2007
;;; [Planck-2018] Planck Collaboration, Planck 2018 results VI,
;;;   A&A 641, A6 (2020)
;;; [Wegener-1915] Wegener, Die Entstehung der Kontinente und Ozeane
;;; [Milankovitch-1941] Milankovitch, Kanon der Erdbestrahlung
;;; [Hubble-1929] Hubble, PNAS 15, 168 (1929)
;;; [Penzias-1965] Penzias & Wilson, ApJ 142, 419 (1965)
;;;
;;; UNITS: Stated explicitly. km for depths and distances.
;;;   K for temperatures. AU for orbital distances.
;;;
;;; CALIBRATION: earth-systems.cal.rkt
;;; ═══════════════════════════════════════════════════════════════

(domain-earth-systems

  ((Tarbuck-2020 (earth-science-16th-ed) (authoritative)
    ((earth-science-16th-ed . authoritative)))
   (NASA-2024 (planetary-fact-sheets) (authoritative)
    ((planetary-fact-sheets . authoritative))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; EARTH INTERNAL STRUCTURE
    ;;; Layered by composition and mechanical properties
    ;;; SOURCE: [Tarbuck-2020] Ch. 12
    ;;; ═══════════════════════════════════════════════════════════

    (crust
      (outermost-solid-layer)
      (thin-rigid-shell)
      ((outermost-solid-layer . two-types)
       (two-types . oceanic-crust-5-to-10-km-thick)
       (oceanic-crust-5-to-10-km-thick . density-3.0-g/cm3-basaltic)
       (density-3.0-g/cm3-basaltic . continental-crust-20-to-70-km-thick)
       (continental-crust-20-to-70-km-thick . density-2.7-g/cm3-granitic)
       (density-2.7-g/cm3-granitic . separated-from-mantle-by-Mohorovicic-discontinuity)
       (separated-from-mantle-by-Mohorovicic-discontinuity . thin-rigid-shell)))

    (mantle
      (below-crust-to-2900-km-depth)
      (largest-layer-by-volume)
      ((below-crust-to-2900-km-depth . composed-of-silicate-rock)
       (composed-of-silicate-rock . rich-in-iron-and-magnesium)
       (rich-in-iron-and-magnesium . upper-mantle-to-670-km)
       (upper-mantle-to-670-km . lower-mantle-670-to-2900-km)
       (lower-mantle-670-to-2900-km . convection-drives-plate-tectonics)
       (convection-drives-plate-tectonics . temperature-1000-to-3700-C)
       (temperature-1000-to-3700-C . largest-layer-by-volume)))

    (outer-core
      (liquid-iron-nickel-layer)
      (depth-2900-to-5150-km)
      ((liquid-iron-nickel-layer . molten-state)
       (molten-state . convective-currents-in-liquid-metal)
       (convective-currents-in-liquid-metal . generates-Earths-magnetic-field)
       (generates-Earths-magnetic-field . geodynamo-mechanism)
       (geodynamo-mechanism . temperature-4400-to-6100-C)
       (temperature-4400-to-6100-C . depth-2900-to-5150-km)))

    (inner-core
      (solid-iron-nickel-sphere)
      (radius-approximately-1220-km)
      ((solid-iron-nickel-sphere . solid-despite-extreme-temperature)
       (solid-despite-extreme-temperature . immense-pressure-keeps-solid)
       (immense-pressure-keeps-solid . temperature-approximately-5400-C)
       (temperature-approximately-5400-C . density-approximately-13-g/cm3)
       (density-approximately-13-g/cm3 . radius-approximately-1220-km)))

    (lithosphere
      (crust-plus-uppermost-mantle)
      (rigid-brittle-layer-approximately-100-km-thick)
      ((crust-plus-uppermost-mantle . mechanically-rigid)
       (mechanically-rigid . broken-into-tectonic-plates)
       (broken-into-tectonic-plates . floats-on-asthenosphere)
       (floats-on-asthenosphere . thickness-varies-70-to-150-km)
       (thickness-varies-70-to-150-km . rigid-brittle-layer-approximately-100-km-thick)))

    (asthenosphere
      (partially-molten-upper-mantle)
      (depth-approximately-100-to-660-km)
      ((partially-molten-upper-mantle . ductile-and-flows)
       (ductile-and-flows . allows-lithospheric-plates-to-move)
       (allows-lithospheric-plates-to-move . low-viscosity-zone)
       (low-viscosity-zone . convection-occurs-here)
       (convection-occurs-here . depth-approximately-100-to-660-km)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PLATE TECTONICS
    ;;; SOURCE: [Tarbuck-2020] Ch. 7-10, [Wegener-1915]
    ;;; ═══════════════════════════════════════════════════════════

    (continental-drift
      (Wegener-1915-hypothesis)
      (continents-move-over-geologic-time)
      ((Wegener-1915-hypothesis . Alfred-Wegener-proposed-1915)
       (Alfred-Wegener-proposed-1915 . Pangaea-supercontinent-200-Ma)
       (Pangaea-supercontinent-200-Ma . evidence-from-continental-fit)
       (evidence-from-continental-fit . matching-fossils-across-oceans)
       (matching-fossils-across-oceans . matching-rock-sequences)
       (matching-rock-sequences . paleoclimatic-evidence)
       (paleoclimatic-evidence . mechanism-unknown-until-seafloor-spreading)
       (mechanism-unknown-until-seafloor-spreading . continents-move-over-geologic-time)))

    (seafloor-spreading
      (new-oceanic-crust-at-mid-ocean-ridges)
      (Hess-1962-mechanism)
      ((new-oceanic-crust-at-mid-ocean-ridges . magma-rises-at-ridges)
       (magma-rises-at-ridges . solidifies-to-form-new-crust)
       (solidifies-to-form-new-crust . symmetrical-magnetic-striping)
       (symmetrical-magnetic-striping . youngest-crust-at-ridge)
       (youngest-crust-at-ridge . oldest-oceanic-crust-approximately-200-Ma)
       (oldest-oceanic-crust-approximately-200-Ma . Hess-1962-mechanism)))

    (divergent-boundary
      (plates-move-apart)
      (new-crust-created)
      ((plates-move-apart . tensional-stress)
       (tensional-stress . magma-rises-to-fill-gap)
       (magma-rises-to-fill-gap . mid-ocean-ridges-form)
       (mid-ocean-ridges-form . example-Mid-Atlantic-Ridge)
       (example-Mid-Atlantic-Ridge . continental-rift-valleys-on-land)
       (continental-rift-valleys-on-land . example-East-African-Rift)
       (example-East-African-Rift . new-crust-created)))

    (convergent-boundary
      (plates-move-toward-each-other)
      (crust-destroyed-or-deformed)
      ((plates-move-toward-each-other . compressional-stress)
       (compressional-stress . three-subtypes)
       (three-subtypes . oceanic-oceanic-produces-island-arc)
       (oceanic-oceanic-produces-island-arc . oceanic-continental-produces-volcanic-arc)
       (oceanic-continental-produces-volcanic-arc . continental-continental-produces-mountain-belt)
       (continental-continental-produces-mountain-belt . example-Himalayas-India-Eurasia)
       (example-Himalayas-India-Eurasia . crust-destroyed-or-deformed)))

    (subduction
      (denser-plate-descends-beneath-less-dense)
      (oceanic-lithosphere-recycled-into-mantle)
      ((denser-plate-descends-beneath-less-dense . creates-deep-ocean-trench)
       (creates-deep-ocean-trench . Mariana-Trench-deepest-10994-m)
       (Mariana-Trench-deepest-10994-m . generates-volcanic-activity)
       (generates-volcanic-activity . Wadati-Benioff-zone-of-earthquakes)
       (Wadati-Benioff-zone-of-earthquakes . slab-descends-at-angle)
       (slab-descends-at-angle . oceanic-lithosphere-recycled-into-mantle)))

    (transform-boundary
      (plates-slide-laterally-past-each-other)
      (crust-neither-created-nor-destroyed)
      ((plates-slide-laterally-past-each-other . shear-stress)
       (shear-stress . produces-shallow-earthquakes)
       (produces-shallow-earthquakes . example-San-Andreas-Fault)
       (example-San-Andreas-Fault . Pacific-plate-moves-NW-relative-to-North-American)
       (Pacific-plate-moves-NW-relative-to-North-American . crust-neither-created-nor-destroyed)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ATMOSPHERE
    ;;; SOURCE: [Tarbuck-2020] Ch. 16-17, [NASA-2024]
    ;;; ═══════════════════════════════════════════════════════════

    (atmosphere-composition
      (Earths-gaseous-envelope)
      (78-percent-N2-21-percent-O2)
      ((Earths-gaseous-envelope . dry-air-composition)
       (dry-air-composition . nitrogen-N2-78.08-percent)
       (nitrogen-N2-78.08-percent . oxygen-O2-20.95-percent)
       (oxygen-O2-20.95-percent . argon-Ar-0.93-percent)
       (argon-Ar-0.93-percent . carbon-dioxide-CO2-approximately-0.042-percent)
       (carbon-dioxide-CO2-approximately-0.042-percent . variable-water-vapor-0-to-4-percent)
       (variable-water-vapor-0-to-4-percent . trace-gases-neon-helium-methane-krypton)
       (trace-gases-neon-helium-methane-krypton . 78-percent-N2-21-percent-O2)))

    (troposphere
      (lowest-atmospheric-layer)
      (surface-to-approximately-12-km)
      ((lowest-atmospheric-layer . contains-75-percent-of-atmospheric-mass)
       (contains-75-percent-of-atmospheric-mass . virtually-all-water-vapor-and-weather)
       (virtually-all-water-vapor-and-weather . temperature-decreases-with-altitude)
       (temperature-decreases-with-altitude . lapse-rate-approximately-6.5-C-per-km)
       (lapse-rate-approximately-6.5-C-per-km . bounded-above-by-tropopause)
       (bounded-above-by-tropopause . surface-to-approximately-12-km)))

    (stratosphere
      (above-tropopause)
      (approximately-12-to-50-km-altitude)
      ((above-tropopause . temperature-increases-with-altitude)
       (temperature-increases-with-altitude . due-to-ozone-absorbing-UV)
       (due-to-ozone-absorbing-UV . stable-stratified-air)
       (stable-stratified-air . commercial-aircraft-cruise-here)
       (commercial-aircraft-cruise-here . bounded-above-by-stratopause)
       (bounded-above-by-stratopause . approximately-12-to-50-km-altitude)))

    (ozone-layer
      (concentrated-O3-in-stratosphere)
      (peak-at-20-to-25-km-altitude)
      ((concentrated-O3-in-stratosphere . absorbs-UV-B-and-UV-C-radiation)
       (absorbs-UV-B-and-UV-C-radiation . shields-surface-life-from-harmful-UV)
       (shields-surface-life-from-harmful-UV . Chapman-cycle-O2-plus-UV-yields-2O)
       (Chapman-cycle-O2-plus-UV-yields-2O . O-plus-O2-yields-O3)
       (O-plus-O2-yields-O3 . depleted-by-CFCs-Montreal-Protocol-1987)
       (depleted-by-CFCs-Montreal-Protocol-1987 . peak-at-20-to-25-km-altitude)))

    (mesosphere
      (above-stratopause)
      (approximately-50-to-85-km-altitude)
      ((above-stratopause . temperature-decreases-with-altitude)
       (temperature-decreases-with-altitude . coldest-layer-mesopause-approximately-minus-90-C)
       (coldest-layer-mesopause-approximately-minus-90-C . meteors-burn-up-here)
       (meteors-burn-up-here . noctilucent-clouds-near-top)
       (noctilucent-clouds-near-top . approximately-50-to-85-km-altitude)))

    (thermosphere
      (above-mesopause)
      (approximately-85-to-600-km-altitude)
      ((above-mesopause . temperature-increases-dramatically)
       (temperature-increases-dramatically . up-to-2000-C-in-upper-thermosphere)
       (up-to-2000-C-in-upper-thermosphere . very-low-density-few-molecules)
       (very-low-density-few-molecules . aurora-occurs-here)
       (aurora-occurs-here . ionosphere-embedded-within-60-to-1000-km)
       (ionosphere-embedded-within-60-to-1000-km . approximately-85-to-600-km-altitude)))

    (greenhouse-effect
      (selective-absorption-by-atmospheric-gases)
      (raises-surface-temperature-by-approximately-33-C)
      ((selective-absorption-by-atmospheric-gases . transparent-to-incoming-shortwave-solar)
       (transparent-to-incoming-shortwave-solar . surface-absorbs-and-re-emits-as-longwave-IR)
       (surface-absorbs-and-re-emits-as-longwave-IR . greenhouse-gases-absorb-longwave-IR)
       (greenhouse-gases-absorb-longwave-IR . CO2-H2O-CH4-N2O-are-primary-greenhouse-gases)
       (CO2-H2O-CH4-N2O-are-primary-greenhouse-gases . re-emit-in-all-directions-including-downward)
       (re-emit-in-all-directions-including-downward . without-effect-Earth-average-minus-18-C)
       (without-effect-Earth-average-minus-18-C . with-effect-Earth-average-plus-15-C)
       (with-effect-Earth-average-plus-15-C . raises-surface-temperature-by-approximately-33-C)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CLIMATE
    ;;; SOURCE: [Tarbuck-2020] Ch. 20-21, [Milankovitch-1941]
    ;;; ═══════════════════════════════════════════════════════════

    (Milankovitch-cycles
      (orbital-variations-affecting-climate)
      (three-periodic-components)
      ((orbital-variations-affecting-climate . eccentricity-cycle-approximately-100000-years)
       (eccentricity-cycle-approximately-100000-years . orbit-shape-varies-from-near-circular-to-elliptical)
       (orbit-shape-varies-from-near-circular-to-elliptical . obliquity-cycle-approximately-41000-years)
       (obliquity-cycle-approximately-41000-years . axial-tilt-varies-22.1-to-24.5-degrees)
       (axial-tilt-varies-22.1-to-24.5-degrees . precession-cycle-approximately-26000-years)
       (precession-cycle-approximately-26000-years . wobble-of-rotation-axis)
       (wobble-of-rotation-axis . modulates-seasonal-solar-radiation-distribution)
       (modulates-seasonal-solar-radiation-distribution . three-periodic-components)))

    (thermohaline-circulation
      (density-driven-global-ocean-conveyor)
      (overturning-timescale-approximately-1000-years)
      ((density-driven-global-ocean-conveyor . driven-by-temperature-and-salinity-differences)
       (driven-by-temperature-and-salinity-differences . cold-salty-water-sinks-in-North-Atlantic)
       (cold-salty-water-sinks-in-North-Atlantic . North-Atlantic-Deep-Water-formation)
       (North-Atlantic-Deep-Water-formation . deep-water-flows-southward)
       (deep-water-flows-southward . upwells-in-Southern-and-Pacific-Oceans)
       (upwells-in-Southern-and-Pacific-Oceans . surface-return-flow-completes-circuit)
       (surface-return-flow-completes-circuit . transports-heat-poleward)
       (transports-heat-poleward . overturning-timescale-approximately-1000-years)))

    (El-Nino-Southern-Oscillation
      (coupled-ocean-atmosphere-phenomenon)
      (ENSO-cycle-2-to-7-years)
      ((coupled-ocean-atmosphere-phenomenon . normal-trade-winds-push-warm-water-westward)
       (normal-trade-winds-push-warm-water-westward . El-Nino-trade-winds-weaken)
       (El-Nino-trade-winds-weaken . warm-water-spreads-eastward-across-Pacific)
       (warm-water-spreads-eastward-across-Pacific . suppresses-upwelling-off-South-America)
       (suppresses-upwelling-off-South-America . La-Nina-is-opposite-intensified-trades)
       (La-Nina-is-opposite-intensified-trades . enhanced-upwelling-cooler-east-Pacific)
       (enhanced-upwelling-cooler-east-Pacific . global-weather-pattern-disruption)
       (global-weather-pattern-disruption . ENSO-cycle-2-to-7-years)))

    (atmospheric-circulation-cells
      (global-convection-pattern)
      (three-cells-per-hemisphere)
      ((global-convection-pattern . Hadley-cell-0-to-30-degrees-latitude)
       (Hadley-cell-0-to-30-degrees-latitude . warm-air-rises-at-equator-ITCZ)
       (warm-air-rises-at-equator-ITCZ . flows-poleward-aloft-descends-at-30-degrees)
       (flows-poleward-aloft-descends-at-30-degrees . Ferrel-cell-30-to-60-degrees-latitude)
       (Ferrel-cell-30-to-60-degrees-latitude . indirect-thermally-driven-cell)
       (indirect-thermally-driven-cell . Polar-cell-60-to-90-degrees-latitude)
       (Polar-cell-60-to-90-degrees-latitude . cold-air-sinks-at-poles-rises-at-60-degrees)
       (cold-air-sinks-at-poles-rises-at-60-degrees . Coriolis-deflects-surface-winds)
       (Coriolis-deflects-surface-winds . three-cells-per-hemisphere)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; WATER CYCLE
    ;;; SOURCE: [Tarbuck-2020] Ch. 4, [USGS-2024]
    ;;; ═══════════════════════════════════════════════════════════

    (water-cycle
      (continuous-movement-of-water-through-Earth-system)
      (evaporation-condensation-precipitation-runoff-groundwater)
      ((continuous-movement-of-water-through-Earth-system . solar-energy-drives-evaporation)
       (solar-energy-drives-evaporation . evaporation-liquid-to-vapor-from-surface)
       (evaporation-liquid-to-vapor-from-surface . transpiration-from-plants)
       (transpiration-from-plants . water-vapor-rises-and-cools)
       (water-vapor-rises-and-cools . condensation-vapor-to-liquid-forms-clouds)
       (condensation-vapor-to-liquid-forms-clouds . precipitation-rain-snow-sleet-hail)
       (precipitation-rain-snow-sleet-hail . surface-runoff-to-streams-rivers-lakes)
       (surface-runoff-to-streams-rivers-lakes . infiltration-into-groundwater)
       (infiltration-into-groundwater . groundwater-flows-through-aquifers)
       (groundwater-flows-through-aquifers . discharges-to-surface-or-ocean)
       (discharges-to-surface-or-ocean . evaporation-condensation-precipitation-runoff-groundwater)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ROCK CYCLE
    ;;; SOURCE: [Tarbuck-2020] Ch. 1, 3-5
    ;;; ═══════════════════════════════════════════════════════════

    (rock-cycle
      (continuous-transformation-among-rock-types)
      (igneous-sedimentary-metamorphic)
      ((continuous-transformation-among-rock-types . no-fixed-starting-point)
       (no-fixed-starting-point . any-rock-type-can-become-any-other)
       (any-rock-type-can-become-any-other . driven-by-plate-tectonics-and-solar-energy)
       (driven-by-plate-tectonics-and-solar-energy . igneous-sedimentary-metamorphic)))

    (igneous-rock
      (crystallized-from-molten-material)
      (intrusive-or-extrusive)
      ((crystallized-from-molten-material . magma-below-surface-lava-at-surface)
       (magma-below-surface-lava-at-surface . intrusive-plutonic-slow-cooling-large-crystals)
       (intrusive-plutonic-slow-cooling-large-crystals . example-granite)
       (example-granite . extrusive-volcanic-rapid-cooling-small-crystals)
       (extrusive-volcanic-rapid-cooling-small-crystals . example-basalt)
       (example-basalt . classified-by-silica-content-felsic-to-mafic)
       (classified-by-silica-content-felsic-to-mafic . intrusive-or-extrusive)))

    (sedimentary-rock
      (formed-from-accumulated-sediments)
      (clastic-chemical-or-organic)
      ((formed-from-accumulated-sediments . weathering-erosion-transport-deposition)
       (weathering-erosion-transport-deposition . lithification-by-compaction-and-cementation)
       (lithification-by-compaction-and-cementation . clastic-from-rock-fragments-sandstone-shale)
       (clastic-from-rock-fragments-sandstone-shale . chemical-from-precipitation-limestone-evaporites)
       (chemical-from-precipitation-limestone-evaporites . organic-from-biological-material-coal-chalk)
       (organic-from-biological-material-coal-chalk . contains-fossils-and-records-Earths-history)
       (contains-fossils-and-records-Earths-history . clastic-chemical-or-organic)))

    (metamorphic-rock
      (transformed-by-heat-and-pressure)
      (foliated-or-non-foliated)
      ((transformed-by-heat-and-pressure . existing-rock-recrystallizes-without-melting)
       (existing-rock-recrystallizes-without-melting . occurs-at-convergent-boundaries-and-contact-zones)
       (occurs-at-convergent-boundaries-and-contact-zones . foliated-has-layered-texture-slate-schist-gneiss)
       (foliated-has-layered-texture-slate-schist-gneiss . non-foliated-lacks-layering-marble-quartzite)
       (non-foliated-lacks-layering-marble-quartzite . grades-of-metamorphism-low-to-high)
       (grades-of-metamorphism-low-to-high . foliated-or-non-foliated)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; MINERALS
    ;;; SOURCE: [Tarbuck-2020] Ch. 2
    ;;; ═══════════════════════════════════════════════════════════

    (mineral-definition
      (naturally-occurring-inorganic-crystalline-solid)
      (definite-chemical-composition)
      ((naturally-occurring-inorganic-crystalline-solid . five-criteria)
       (five-criteria . naturally-occurring-not-synthetic)
       (naturally-occurring-not-synthetic . inorganic-not-from-living-organisms)
       (inorganic-not-from-living-organisms . solid-at-surface-temperature)
       (solid-at-surface-temperature . ordered-crystalline-structure)
       (ordered-crystalline-structure . definite-chemical-composition)))

    (silicate-minerals
      (most-abundant-mineral-group)
      (silicon-oxygen-tetrahedron-building-block)
      ((most-abundant-mineral-group . 92-percent-of-Earths-crust-by-volume)
       (92-percent-of-Earths-crust-by-volume . based-on-SiO4-tetrahedron)
       (based-on-SiO4-tetrahedron . Si-bonded-to-4-oxygen-atoms)
       (Si-bonded-to-4-oxygen-atoms . tetrahedra-share-oxygens-to-form-chains-sheets-frameworks)
       (tetrahedra-share-oxygens-to-form-chains-sheets-frameworks . feldspar-quartz-mica-olivine-pyroxene-amphibole)
       (feldspar-quartz-mica-olivine-pyroxene-amphibole . silicon-oxygen-tetrahedron-building-block)))

    (oxide-minerals
      (metal-bonded-to-oxygen)
      (important-ore-minerals)
      ((metal-bonded-to-oxygen . second-most-abundant-mineral-group)
       (second-most-abundant-mineral-group . hematite-Fe2O3)
       (hematite-Fe2O3 . magnetite-Fe3O4)
       (magnetite-Fe3O4 . corundum-Al2O3)
       (corundum-Al2O3 . rutile-TiO2)
       (rutile-TiO2 . important-ore-minerals)))

    (Mohs-hardness-scale
      (relative-mineral-hardness-1-to-10)
      (scratch-test-comparison)
      ((relative-mineral-hardness-1-to-10 . Friedrich-Mohs-1812)
       (Friedrich-Mohs-1812 . 1-talc-softest)
       (1-talc-softest . 2-gypsum)
       (2-gypsum . 3-calcite)
       (3-calcite . 4-fluorite)
       (4-fluorite . 5-apatite)
       (5-apatite . 6-orthoclase-feldspar)
       (6-orthoclase-feldspar . 7-quartz)
       (7-quartz . 8-topaz)
       (8-topaz . 9-corundum)
       (9-corundum . 10-diamond-hardest)
       (10-diamond-hardest . scratch-test-comparison)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; NATURAL HAZARDS — EARTHQUAKES
    ;;; SOURCE: [Tarbuck-2020] Ch. 11, [USGS-2024]
    ;;; ═══════════════════════════════════════════════════════════

    (earthquake
      (sudden-release-of-energy-along-fault)
      (seismic-waves-radiate-from-focus)
      ((sudden-release-of-energy-along-fault . elastic-rebound-theory)
       (elastic-rebound-theory . stress-accumulates-along-locked-fault)
       (stress-accumulates-along-locked-fault . rock-deforms-elastically-then-ruptures)
       (rock-deforms-elastically-then-ruptures . focus-is-point-of-initial-rupture-at-depth)
       (focus-is-point-of-initial-rupture-at-depth . epicenter-is-point-on-surface-above-focus)
       (epicenter-is-point-on-surface-above-focus . P-waves-compressional-fastest)
       (P-waves-compressional-fastest . S-waves-shear-slower-no-liquids)
       (S-waves-shear-slower-no-liquids . surface-waves-slowest-most-destructive)
       (surface-waves-slowest-most-destructive . seismic-waves-radiate-from-focus)))

    (Richter-magnitude
      (Richter-1935-local-magnitude-ML)
      (logarithmic-amplitude-scale)
      ((Richter-1935-local-magnitude-ML . based-on-maximum-seismogram-amplitude)
       (based-on-maximum-seismogram-amplitude . logarithmic-each-unit-is-10x-amplitude)
       (logarithmic-each-unit-is-10x-amplitude . each-unit-is-approximately-31.6x-energy)
       (each-unit-is-approximately-31.6x-energy . works-best-for-local-moderate-earthquakes)
       (works-best-for-local-moderate-earthquakes . saturates-above-magnitude-7)
       (saturates-above-magnitude-7 . logarithmic-amplitude-scale)))

    (moment-magnitude
      (Mw-modern-standard)
      (based-on-seismic-moment)
      ((Mw-modern-standard . Kanamori-1977-and-Hanks-Kanamori-1979)
       (Kanamori-1977-and-Hanks-Kanamori-1979 . seismic-moment-M0-equals-rigidity-times-area-times-slip)
       (seismic-moment-M0-equals-rigidity-times-area-times-slip . Mw-equals-two-thirds-log10-M0-minus-10.7)
       (Mw-equals-two-thirds-log10-M0-minus-10.7 . does-not-saturate-at-high-magnitudes)
       (does-not-saturate-at-high-magnitudes . preferred-for-large-earthquakes)
       (preferred-for-large-earthquakes . largest-recorded-1960-Chile-Mw-9.5)
       (largest-recorded-1960-Chile-Mw-9.5 . based-on-seismic-moment)))

    (tsunami
      (ocean-wave-generated-by-seafloor-displacement)
      (devastating-coastal-hazard)
      ((ocean-wave-generated-by-seafloor-displacement . caused-by-submarine-earthquake-landslide-or-eruption)
       (caused-by-submarine-earthquake-landslide-or-eruption . wavelength-100-to-200-km-in-open-ocean)
       (wavelength-100-to-200-km-in-open-ocean . speed-up-to-800-km/h-in-deep-water)
       (speed-up-to-800-km/h-in-deep-water . barely-noticeable-in-open-ocean-low-amplitude)
       (barely-noticeable-in-open-ocean-low-amplitude . shoaling-amplifies-wave-height-near-coast)
       (shoaling-amplifies-wave-height-near-coast . devastating-coastal-hazard)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; NATURAL HAZARDS — VOLCANOES
    ;;; SOURCE: [Tarbuck-2020] Ch. 5-6
    ;;; ═══════════════════════════════════════════════════════════

    (shield-volcano
      (broad-gently-sloping-cone)
      (built-by-fluid-basaltic-lava)
      ((broad-gently-sloping-cone . low-viscosity-mafic-magma)
       (low-viscosity-mafic-magma . effusive-eruptions-lava-flows)
       (effusive-eruptions-lava-flows . largest-volcanoes-by-volume)
       (largest-volcanoes-by-volume . example-Mauna-Loa-Hawaii)
       (example-Mauna-Loa-Hawaii . built-by-fluid-basaltic-lava)))

    (stratovolcano
      (steep-sided-composite-cone)
      (alternating-lava-and-pyroclastics)
      ((steep-sided-composite-cone . intermediate-to-felsic-magma)
       (intermediate-to-felsic-magma . higher-viscosity-more-explosive)
       (higher-viscosity-more-explosive . alternating-layers-of-lava-and-tephra)
       (alternating-layers-of-lava-and-tephra . most-dangerous-type)
       (most-dangerous-type . example-Mt-Fuji-Mt-St-Helens-Vesuvius)
       (example-Mt-Fuji-Mt-St-Helens-Vesuvius . alternating-lava-and-pyroclastics)))

    (caldera
      (large-depression-from-summit-collapse)
      (formed-after-massive-eruption)
      ((large-depression-from-summit-collapse . magma-chamber-empties-during-eruption)
       (magma-chamber-empties-during-eruption . summit-collapses-into-void)
       (summit-collapses-into-void . diameter-typically-1-to-50-km)
       (diameter-typically-1-to-50-km . example-Yellowstone-caldera-supervolcano)
       (example-Yellowstone-caldera-supervolcano . example-Crater-Lake-Oregon)
       (example-Crater-Lake-Oregon . formed-after-massive-eruption)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; OCEAN
    ;;; SOURCE: [Tarbuck-2020] Ch. 13-15
    ;;; ═══════════════════════════════════════════════════════════

    (ocean-salinity
      (average-ocean-water)
      (35-parts-per-thousand)
      ((average-ocean-water . dissolved-salts-and-ions)
       (dissolved-salts-and-ions . sodium-and-chloride-dominant-85-percent)
       (sodium-and-chloride-dominant-85-percent . salinity-35-ppt-or-3.5-percent)
       (salinity-35-ppt-or-3.5-percent . sources-river-input-volcanic-gases-hydrothermal)
       (sources-river-input-volcanic-gases-hydrothermal . sinks-evaporite-deposits-biological-uptake)
       (sinks-evaporite-deposits-biological-uptake . 35-parts-per-thousand)))

    (marine-ecosystems
      (ocean-biological-communities)
      (photic-and-aphotic-zones)
      ((ocean-biological-communities . photic-zone-surface-to-approximately-200-m)
       (photic-zone-surface-to-approximately-200-m . sunlight-supports-photosynthesis)
       (sunlight-supports-photosynthesis . phytoplankton-produce-approximately-50-percent-global-O2)
       (phytoplankton-produce-approximately-50-percent-global-O2 . aphotic-zone-below-200-m)
       (aphotic-zone-below-200-m . organisms-depend-on-sinking-organic-matter)
       (organisms-depend-on-sinking-organic-matter . photic-and-aphotic-zones)))

    (coral-reefs
      (calcium-carbonate-structures-built-by-coral-polyps)
      (most-biodiverse-marine-ecosystem)
      ((calcium-carbonate-structures-built-by-coral-polyps . symbiotic-with-zooxanthellae-algae)
       (symbiotic-with-zooxanthellae-algae . require-warm-shallow-clear-water)
       (require-warm-shallow-clear-water . optimal-temperature-23-to-29-C)
       (optimal-temperature-23-to-29-C . three-types-fringing-barrier-atoll)
       (three-types-fringing-barrier-atoll . support-25-percent-of-marine-species)
       (support-25-percent-of-marine-species . vulnerable-to-bleaching-from-warming)
       (vulnerable-to-bleaching-from-warming . most-biodiverse-marine-ecosystem)))

    (deep-sea-hydrothermal-vents
      (hot-fluid-emissions-at-mid-ocean-ridges)
      (chemosynthetic-ecosystems)
      ((hot-fluid-emissions-at-mid-ocean-ridges . seawater-heated-by-magma-to-350-to-400-C)
       (seawater-heated-by-magma-to-350-to-400-C . black-smokers-precipitate-metal-sulfides)
       (black-smokers-precipitate-metal-sulfides . chemosynthetic-bacteria-use-H2S-as-energy-source)
       (chemosynthetic-bacteria-use-H2S-as-energy-source . base-of-food-chain-independent-of-sunlight)
       (base-of-food-chain-independent-of-sunlight . tube-worms-crabs-shrimp-clams)
       (tube-worms-crabs-shrimp-clams . discovered-1977-Galapagos-Rift)
       (discovered-1977-Galapagos-Rift . chemosynthetic-ecosystems)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SOLAR SYSTEM
    ;;; SOURCE: [NASA-2024], [Tarbuck-2020] Ch. 23
    ;;; ═══════════════════════════════════════════════════════════

    (solar-system-structure
      (Sun-and-gravitationally-bound-objects)
      (8-planets-and-small-bodies)
      ((Sun-and-gravitationally-bound-objects . Sun-contains-99.86-percent-of-system-mass)
       (Sun-contains-99.86-percent-of-system-mass . 4-terrestrial-planets-Mercury-Venus-Earth-Mars)
       (4-terrestrial-planets-Mercury-Venus-Earth-Mars . rocky-small-dense-inner-solar-system)
       (rocky-small-dense-inner-solar-system . asteroid-belt-between-Mars-and-Jupiter)
       (asteroid-belt-between-Mars-and-Jupiter . 4-jovian-planets-Jupiter-Saturn-Uranus-Neptune)
       (4-jovian-planets-Jupiter-Saturn-Uranus-Neptune . gaseous-or-icy-large-low-density)
       (gaseous-or-icy-large-low-density . 8-planets-and-small-bodies)))

    (asteroid-belt
      (region-between-Mars-and-Jupiter)
      (2.1-to-3.3-AU-from-Sun)
      ((region-between-Mars-and-Jupiter . millions-of-rocky-metallic-bodies)
       (millions-of-rocky-metallic-bodies . total-mass-less-than-4-percent-of-Moon)
       (total-mass-less-than-4-percent-of-Moon . largest-is-Ceres-diameter-940-km-dwarf-planet)
       (largest-is-Ceres-diameter-940-km-dwarf-planet . Jupiters-gravity-prevented-planet-formation)
       (Jupiters-gravity-prevented-planet-formation . 2.1-to-3.3-AU-from-Sun)))

    (Kuiper-belt
      (disk-of-icy-bodies-beyond-Neptune)
      (30-to-50-AU-from-Sun)
      ((disk-of-icy-bodies-beyond-Neptune . extends-beyond-Neptunes-orbit)
       (extends-beyond-Neptunes-orbit . contains-Pluto-Eris-Makemake-Haumea)
       (contains-Pluto-Eris-Makemake-Haumea . source-of-short-period-comets)
       (source-of-short-period-comets . composed-of-frozen-volatiles-and-rock)
       (composed-of-frozen-volatiles-and-rock . 30-to-50-AU-from-Sun)))

    (Oort-cloud
      (hypothetical-spherical-shell-of-icy-bodies)
      (extends-to-approximately-50000-to-100000-AU)
      ((hypothetical-spherical-shell-of-icy-bodies . proposed-by-Jan-Oort-1950)
       (proposed-by-Jan-Oort-1950 . source-of-long-period-comets)
       (source-of-long-period-comets . loosely-bound-by-Suns-gravity)
       (loosely-bound-by-Suns-gravity . perturbed-by-passing-stars-and-galactic-tide)
       (perturbed-by-passing-stars-and-galactic-tide . extends-to-approximately-50000-to-100000-AU)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; STARS — STELLAR EVOLUTION
    ;;; SOURCE: [Carroll-2007] Ch. 10, 13, 15
    ;;; ═══════════════════════════════════════════════════════════

    (main-sequence-star
      (hydrogen-fusing-core)
      (hydrostatic-equilibrium)
      ((hydrogen-fusing-core . 4H-fuses-to-He-via-pp-chain-or-CNO-cycle)
       (4H-fuses-to-He-via-pp-chain-or-CNO-cycle . radiation-pressure-balances-gravity)
       (radiation-pressure-balances-gravity . spends-90-percent-of-life-on-main-sequence)
       (spends-90-percent-of-life-on-main-sequence . Sun-is-G2V-main-sequence-star)
       (Sun-is-G2V-main-sequence-star . mass-determines-luminosity-and-lifetime)
       (mass-determines-luminosity-and-lifetime . higher-mass-hotter-brighter-shorter-lived)
       (higher-mass-hotter-brighter-shorter-lived . hydrostatic-equilibrium)))

    (red-giant
      (evolved-star-with-exhausted-core-hydrogen)
      (expanded-cooled-luminous-envelope)
      ((evolved-star-with-exhausted-core-hydrogen . hydrogen-shell-burning-around-inert-He-core)
       (hydrogen-shell-burning-around-inert-He-core . outer-layers-expand-dramatically)
       (outer-layers-expand-dramatically . surface-cools-to-3000-to-5000-K-red)
       (surface-cools-to-3000-to-5000-K-red . luminosity-increases-100-to-1000x)
       (luminosity-increases-100-to-1000x . Sun-will-become-red-giant-in-approximately-5-Gyr)
       (Sun-will-become-red-giant-in-approximately-5-Gyr . expanded-cooled-luminous-envelope)))

    (white-dwarf
      (stellar-remnant-of-low-to-intermediate-mass-star)
      (electron-degeneracy-pressure-supports)
      ((stellar-remnant-of-low-to-intermediate-mass-star . below-approximately-8-solar-masses)
       (below-approximately-8-solar-masses . sheds-outer-layers-as-planetary-nebula)
       (sheds-outer-layers-as-planetary-nebula . remaining-core-mostly-carbon-oxygen)
       (remaining-core-mostly-carbon-oxygen . Earth-sized-but-solar-mass)
       (Earth-sized-but-solar-mass . Chandrasekhar-limit-1.4-solar-masses-maximum)
       (Chandrasekhar-limit-1.4-solar-masses-maximum . slowly-cools-over-billions-of-years)
       (slowly-cools-over-billions-of-years . electron-degeneracy-pressure-supports)))

    (neutron-star
      (remnant-of-massive-star-supernova)
      (neutron-degeneracy-pressure-supports)
      ((remnant-of-massive-star-supernova . progenitor-8-to-25-solar-masses)
       (progenitor-8-to-25-solar-masses . core-collapses-beyond-electron-degeneracy)
       (core-collapses-beyond-electron-degeneracy . protons-plus-electrons-become-neutrons)
       (protons-plus-electrons-become-neutrons . diameter-approximately-20-km)
       (diameter-approximately-20-km . density-approximately-10-to-14th-g/cm3)
       (density-approximately-10-to-14th-g/cm3 . rapid-rotation-pulsars)
       (rapid-rotation-pulsars . neutron-degeneracy-pressure-supports)))

    (black-hole
      (gravitational-singularity-within-event-horizon)
      (escape-velocity-exceeds-speed-of-light)
      ((gravitational-singularity-within-event-horizon . progenitor-above-approximately-25-solar-masses)
       (progenitor-above-approximately-25-solar-masses . core-collapse-exceeds-neutron-degeneracy)
       (core-collapse-exceeds-neutron-degeneracy . Schwarzschild-radius-Rs-equals-2GM/c2)
       (Schwarzschild-radius-Rs-equals-2GM/c2 . event-horizon-no-information-escapes)
       (event-horizon-no-information-escapes . singularity-at-center-infinite-density)
       (singularity-at-center-infinite-density . stellar-and-supermassive-types)
       (stellar-and-supermassive-types . escape-velocity-exceeds-speed-of-light)))

    (Hertzsprung-Russell-diagram
      (luminosity-vs-surface-temperature-plot)
      (reveals-stellar-classification-and-evolution)
      ((luminosity-vs-surface-temperature-plot . x-axis-temperature-decreasing-left-to-right)
       (x-axis-temperature-decreasing-left-to-right . y-axis-luminosity-increasing-upward)
       (y-axis-luminosity-increasing-upward . main-sequence-diagonal-band-upper-left-to-lower-right)
       (main-sequence-diagonal-band-upper-left-to-lower-right . red-giants-upper-right)
       (red-giants-upper-right . white-dwarfs-lower-left)
       (white-dwarfs-lower-left . supergiants-across-top)
       (supergiants-across-top . spectral-types-OBAFGKM-hot-to-cool)
       (spectral-types-OBAFGKM-hot-to-cool . reveals-stellar-classification-and-evolution)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; COSMOLOGY
    ;;; SOURCE: [Carroll-2007] Ch. 29, [Planck-2018],
    ;;; [Hubble-1929], [Penzias-1965]
    ;;; ═══════════════════════════════════════════════════════════

    (Big-Bang
      (origin-of-observable-universe)
      (approximately-13.8-billion-years-ago)
      ((origin-of-observable-universe . initial-singularity-of-extreme-density-and-temperature)
       (initial-singularity-of-extreme-density-and-temperature . rapid-expansion-and-cooling)
       (rapid-expansion-and-cooling . nucleosynthesis-first-3-minutes-H-He-Li)
       (nucleosynthesis-first-3-minutes-H-He-Li . recombination-at-380000-years-CMB-released)
       (recombination-at-380000-years-CMB-released . structure-formation-by-gravitational-collapse)
       (structure-formation-by-gravitational-collapse . approximately-13.8-billion-years-ago)))

    (cosmic-microwave-background
      (relic-radiation-from-recombination-epoch)
      (blackbody-spectrum-at-2.725-K)
      ((relic-radiation-from-recombination-epoch . predicted-by-Gamow-Alpher-Herman-1948)
       (predicted-by-Gamow-Alpher-Herman-1948 . discovered-by-Penzias-Wilson-1965)
       (discovered-by-Penzias-Wilson-1965 . uniform-in-all-directions-to-1-part-in-100000)
       (uniform-in-all-directions-to-1-part-in-100000 . tiny-anisotropies-seed-large-scale-structure)
       (tiny-anisotropies-seed-large-scale-structure . Planck-2018-precision-measurement)
       (Planck-2018-precision-measurement . blackbody-spectrum-at-2.725-K)))

    (Hubble-expansion
      (galaxies-receding-proportional-to-distance)
      (H0-approximately-67.4-km/s/Mpc)
      ((galaxies-receding-proportional-to-distance . Hubble-1929-velocity-distance-relation)
       (Hubble-1929-velocity-distance-relation . v-equals-H0-times-d)
       (v-equals-H0-times-d . cosmological-redshift-of-light)
       (cosmological-redshift-of-light . space-itself-expanding-not-objects-moving-through-space)
       (space-itself-expanding-not-objects-moving-through-space . Planck-2018-H0-equals-67.4-plus-minus-0.5-km/s/Mpc)
       (Planck-2018-H0-equals-67.4-plus-minus-0.5-km/s/Mpc . H0-approximately-67.4-km/s/Mpc)))

    (dark-matter
      (non-luminous-gravitationally-interacting-matter)
      (approximately-27-percent-of-universe-energy-density)
      ((non-luminous-gravitationally-interacting-matter . does-not-emit-or-absorb-EM-radiation)
       (does-not-emit-or-absorb-EM-radiation . detected-by-gravitational-effects)
       (detected-by-gravitational-effects . galaxy-rotation-curves-Rubin-1970s)
       (galaxy-rotation-curves-Rubin-1970s . gravitational-lensing-of-background-galaxies)
       (gravitational-lensing-of-background-galaxies . CMB-anisotropy-pattern-requires-it)
       (CMB-anisotropy-pattern-requires-it . nature-unknown-WIMPs-axions-candidates)
       (nature-unknown-WIMPs-axions-candidates . approximately-27-percent-of-universe-energy-density)))

    (dark-energy
      (unknown-force-driving-accelerated-expansion)
      (approximately-68-percent-of-universe-energy-density)
      ((unknown-force-driving-accelerated-expansion . discovered-1998-Type-Ia-supernovae-Riess-Perlmutter)
       (discovered-1998-Type-Ia-supernovae-Riess-Perlmutter . expansion-of-universe-is-accelerating)
       (expansion-of-universe-is-accelerating . consistent-with-cosmological-constant-Lambda)
       (consistent-with-cosmological-constant-Lambda . Planck-2018-Omega-Lambda-equals-0.6847)
       (Planck-2018-Omega-Lambda-equals-0.6847 . dominates-energy-budget-of-universe)
       (dominates-energy-budget-of-universe . nature-fundamentally-unknown)
       (nature-fundamentally-unknown . approximately-68-percent-of-universe-energy-density)))

  )

  ((Tarbuck-2020 . earth-systems-registered)))
