#!/usr/bin/perl

$chemin = "./TP/12_TEST_JPCO/jpco_2_1_015006.txt";

my $content = '';

open FILE, '<', $chemin or die "file.txt Impossible d'ouvrir le fichier , $!";

while (<FILE>) {
    $content .= $_;
    $keywords .= $_;
}

# print $content;
print 'Resultat : \n';


$content =~ s/< tex-math >(.*?)< \/tex-math >//ig;
# $content =~ s/<mml:mrow>(.*?)<\/mml:mrow>//ig;
# $content =~ s/<mml:mi>(.*?)<\/mml:mi>//ig;
$content =~ s/<mml:math>(.*?)<\/math>//ig;
$content =~ s/KEYWORDS(.*?)\n//ig;

$content =~ s/\((.*?)\)//ig;
$content =~ s/\n//ig;
#$content =~ s/\(.*?)\/xx//ig;
#$content =~ s/\\//ig;

$content =~ s/[^a-zA-Z.,\s]*//g;

print $content;

# not working
$keywords =~ m{KEYWORDS(.*?)\n}i;

print "\n";
print $keywords;


########## Resultat #########
open (fh, ">", "rake-nltk/res.txt");
# Getting the string to be written
# to the file from the user
# Writing to the file
print fh $content;
  
# Closing the file
close(fh) or "Couldn't close the file";