import pprint
from rake_nltk import Rake

# Uses stopwords for english from NLTK, and all puntuation characters by
# default
r = Rake()


#import locale
#print(locale.getpreferredencoding())


myText = ''
f = open("res.txt", "r")
for x in f:
  myText = myText + x


#myText = myText.encode().decode()

#myText = myText.replace("\\", "")

# Extraction given the text.
r.extract_keywords_from_text(myText)

# Extraction given the list of strings where each string is a sentence.
#r.extract_keywords_from_sentences(myText)

# To get keyword phrases ranked highest to lowest.
# print(r.get_ranked_phrases())

setOfMarks = set(r.get_ranked_phrases())
#print(setOfMarks)

#print(" Size of list ", r.get_ranked_phrases().len())
#print(" Size of set ", setOfMarks.len())

# To get keyword phrases ranked highest to lowest with scores.
# print(set(r.get_ranked_phrases_with_scores()), sep='\n')

pprint.pprint(set(r.get_ranked_phrases_with_scores()))


print('Total de réponses = ' + str(len(set(r.get_ranked_phrases_with_scores()))))

# print('Total de réponses = ' + str(len(set(r.get_ranked_phrases_with_scores()))))

