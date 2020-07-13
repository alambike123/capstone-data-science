
con2 <- file("en_US.news.txt", open="r")
lines.news <- readLines(con2); close(con2)
sample.news <-sample(lines.news, round(0.15*length(lines.news)), replace = F)
write.csv(sample.news,"sample.news.csv", row.names = FALSE)

###########

library(quanteda)
require(readtext)
library(sqldf)
library(dplyr)

# CORPUS

mytf3 <- readLines("sample.news.csv",  encoding = "UTF-8", skipNul = TRUE)
myCorpus <- corpus(mytf3)
myCorpus


toks <- tokens(myCorpus,
               remove_url = TRUE,
               remove_separators = TRUE,
               remove_punct = TRUE,
               what = "word",
               split_hyphens = TRUE,
               remove_numbers = TRUE)

##
toks.2.ngram <- tokens_ngrams(toks, n = 2)
twoGramTable <- createnGramLookupTable(toks.2.ngram)
write.table(
  twoGramTable,
  "twoGram.csv",
  sep = ",",
  row.names = FALSE,
  quote = FALSE
)
##

toks.3.ngram <- tokens_ngrams(toks, n = 3)
threeGramTable <- createnGramLookupTable(toks.3.ngram)
write.table(
  threeGramTable,
  "threeGram.csv",
  sep = ",",
  row.names = FALSE,
  quote = FALSE
)
#
toks.4.ngram <- tokens_ngrams(toks, n = 4)
fourGramTable <- createnGramLookupTable(toks.4.ngram)
write.table(
  fourGramTable,
  "fourGram.csv",
  sep = ",",
  row.names = FALSE,
  quote = FALSE
)
#
toks.5.ngram <- tokens_ngrams(toks, n = 5)
fiveGramTable <- createnGramLookupTable(toks.5.ngram)
write.table(
  fiveGramTable,
  "fiveGram.csv",
  sep = ",",
  row.names = FALSE,
  quote = FALSE
)

