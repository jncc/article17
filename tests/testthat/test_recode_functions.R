context("test_recode_functions")

test_that("yes and no are reversed", {
  expect_match(reverse_yes_no("Yes"), "No")
  expect_match(reverse_yes_no("No"), "Yes")
})

test_that("methods used correctly recoded", {
  expect_match(recode_methods_used("Insufficient or no data available"), "absentData")
  expect_match(recode_methods_used("Complete survey or a statistically robust estimate"), "completeSurvey")
  expect_match(recode_methods_used("Based mainly on expert opinion with very limited data"), "estimateExpert")
  expect_match(recode_methods_used("Based mainly on extrapolation from a limited amount of data"), "estimatePartial")
  expect_match(recode_methods_used("MANUAL CHECK REQUIRED: Insufficient or no data available OR Based mainly on expert opinion with very limited data"), 
               "MANUAL CHECK REQUIRED: Insufficient or no data available OR Based mainly on expert opinion with very limited data")
})

test_that("population units correctly recoded", {
  expect_match(recode_population_units("number of adults"), "adults")
  expect_match(recode_population_units("area covered by population in m2"), "area")
  expect_match(recode_population_units("number of breeding females"), "bfemales")
  expect_match(recode_population_units("number of calling males"), "cmales")
  expect_match(recode_population_units("number of colonies"), "colonies")
  expect_match(recode_population_units("number of flowering stems"), "fstems")
  expect_match(recode_population_units("number of map 10x10 km grid cells"), "grids10x10")
  expect_match(recode_population_units("number of map 1x1 km grid cells"), "grids1x1")
  expect_match(recode_population_units("number of map 2x2 km grid cells"), "grids2x2")
  expect_match(recode_population_units("number of map 5x5 km grid cells"), "grids5x5")
  expect_match(recode_population_units("number of individuals"), "i")
  expect_match(recode_population_units("number of wintering individuals"), "iwintering")
  expect_match(recode_population_units("length of inhabited feature in km"), "length")
  expect_match(recode_population_units("number of localities"), "localities")
  expect_match(recode_population_units("number of inhabited logs"), "logs")
  expect_match(recode_population_units("number of males"), "males")
  expect_match(recode_population_units("number of pairs"), "p")
  expect_match(recode_population_units("number of shoots"), "shoots")
  expect_match(recode_population_units("number of inhabited stones/boulders"), "stones")
  expect_match(recode_population_units("number of subadults"), "subadults")
  expect_match(recode_population_units("number of inhabited trees"), "trees")
  expect_match(recode_population_units("number of tufts"), "tufts")})

test_that("trends correctly recoded", {
  expect_match(recode_trends("Decreasing (-)"), "D")
  expect_match(recode_trends("Increasing (+)"), "I")
  expect_match(recode_trends("Stable (0)"), "S")
  expect_match(recode_trends("Uncertain (u)"), "U")
  expect_match(recode_trends("Unknown (x)"), "Unk")
  expect_match(recode_trends("MANUAL SELECTION REQUIRED: one or more countries have selected either Uncertain or Unknown"), 
               "MANUAL SELECTION REQUIRED: one or more countries have selected either Uncertain or Unknown")
})

test_that("favourable range operators correctly recoded", {
  expect_match(recode_favourable_range_operators("Approximately equal to (≈)"), "aeq")
  expect_match(recode_favourable_range_operators("Less than (<)"), "lt")
  expect_match(recode_favourable_range_operators("Much more than (>>)"), "mmt")
  expect_match(recode_favourable_range_operators("More than (>)"), "mt")
})

test_that("reason change correctly recoded", {
  expect_match(recode_reason_change("Genuine change"), "genuine")
  expect_match(recode_reason_change("Improved knowledge/more accurate data"), "knowledge")
  expect_match(recode_reason_change("Use of different method"), "method")
})

test_that("type of estimate correctly recoded", {
  expect_match(recode_type_of_estimate("Best estimate"), "estimate")
  expect_match(recode_type_of_estimate("95% confidence interval"), "interval")
  expect_match(recode_type_of_estimate("Multi-year mean"), "mean")
  expect_match(recode_type_of_estimate("Minimum"), "minimum")
})

test_that("yes_no_unknown correctly recoded", {
  expect_match(recode_yes_no_unknown("No"), "N")
  expect_match(recode_yes_no_unknown("Unknown"), "Unk")
  expect_match(recode_yes_no_unknown("Yes"), "Y")
})

test_that("yes_no_x correctly recoded", {
  expect_true(is.na(recode_yes_no_x("no")))
  expect_match(recode_yes_no_x("yes"), "x")
})

test_that("ranking correctly recoded", {
  expect_match(recode_ranking("High importance/impact"), "H")
  expect_match(recode_ranking("Medium importance/impact"), "M")
})

test_that("ranking type correctly recoded", {
  expect_match(recode_ranking_type("pressure_ranking"), "p")
  expect_match(recode_ranking_type("threat_ranking"), "t")
})

test_that("measures identified correctly recoded", {
  expect_match(recode_measures_identified("Measures identified, but none yet taken"), "ident")
  expect_match(recode_measures_identified("Measures needed but cannot be identified"), "notIdent")
  expect_match(recode_measures_identified("Measures identified and taken"), "taken")
})

test_that("measures purpose species correctly recoded", {
  expect_match(recode_measures_purpose_species("Expand the current range of the species (related to ‘Range’)"), "expand")
  expect_match(recode_measures_purpose_species("Increase the population size and/or improve population dynamics (improve reproduction success, reduce mortality, improve age/sex structure) (related to ‘Population’)"), "increase")
  expect_match(recode_measures_purpose_species("Maintain the current range, population and/or habitat for the species"), "maintain")
  expect_match(recode_measures_purpose_species("Restore the habitat of the species (related to ‘Habitat for the species’)"), "restore")
})

test_that("measures purpose habitat correctly recoded", {
  expect_match(recode_measures_purpose_habitat("Expand the current range of the habitat type (related to ‘Range’)"), "expand")
  expect_match(recode_measures_purpose_habitat("Increase the surface area of the habitat type (related to ‘Area covered by habitat’)"), "increase")
  expect_match(recode_measures_purpose_habitat("Maintain the current range, surface area or structure and functions of the habitat type"), "maintain")
  expect_match(recode_measures_purpose_habitat("Restore the structure and functions, including the status of typical species (related to ‘Specific structure and functions’)"), "restore")
})

test_that("measures location correctly recoded", {
  expect_match(recode_measures_location("Only inside Natura 2000"), "in")
  expect_match(recode_measures_location("Both inside and outside Natura 2000"), "inOut")
  expect_match(recode_measures_location("Only outside Natura 2000"), "out")
})

test_that("measures response correctly recoded", {
  expect_match(recode_measures_response("Long-term results (after 2030)"), "lonTerm")
  expect_match(recode_measures_response("Medium-term results (within the next two reporting periods, 2019-2030)"), "medTerm")
  expect_match(recode_measures_response("Short-term results (within the current reporting period, 2013-2018)"), "srtTerm")
})

test_that("prospects correctly recoded", {
  expect_match(recode_prospects("Bad"), "bad")
  expect_match(recode_prospects("Good"), "good")
  expect_match(recode_prospects("Poor"), "poor")
  expect_match(recode_prospects("Unknown"), "unk")
})

test_that("assessments correctly recoded", {
  expect_match(recode_assessments("Favourable"), "FV")
  expect_match(recode_assessments("Unfavourable-Inadequate"), "U1")
  expect_match(recode_assessments("Unfavourable-Bad"), "U2")
  expect_match(recode_assessments("Unknown"), "XX")
})

test_that("trends conclusion correctly recoded", {
  expect_match(recode_trends_conclusion("Deteriorating (-)"), "D")
  expect_match(recode_trends_conclusion("Improving (+)"), "I")
  expect_match(recode_trends_conclusion("Stable (=)"), "S")
  expect_match(recode_trends_conclusion("Unknown (x)"), "Unk")
})

test_that("future prospects uk fields correctly recoded", {
  expect_true(nchar(recode_future_prospects_uk_fields("Negative - decreasing ≤1% (one percent or less) per year on average")) == 68L)
  expect_true(nchar(recode_future_prospects_uk_fields("Very Negative - decreasing >1% (more than one percent) per year on average")) == 74L)
  expect_true(nchar(recode_future_prospects_uk_fields("Overall stable")) == 14L)
  expect_true(nchar(recode_future_prospects_uk_fields("Positive - increasing ≤1% (one percent or less) per year on average")) == 68L)
  expect_true(nchar(recode_future_prospects_uk_fields("Very Positive - increasing >1% (more than one percent) per year on average")) == 74L)
  expect_match(recode_future_prospects_uk_fields("Negative"), "^Negative - decreasing")
  expect_match(recode_future_prospects_uk_fields("Positive"), "^Positive - increasing")
})

test_that("rate of decrease uk fields correctly recoded", {
  expect_true(nchar(recode_rate_of_decrease_uk_fields("Decreasing ≤1% (one percent or less) per year on average")) == 57L)
  expect_true(nchar(recode_rate_of_decrease_uk_fields("Decreasing >1% (more than one percent) per year on average ")) == 59L)
})
