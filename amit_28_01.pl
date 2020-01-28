#!usr/bin/perl-w
#Searching for motifs
print ("Please type the filename of the protein sequence data: ");
$proteinfilename = <STDIN>;

#Remove the newline from the protein filename
chomp $proteinfilename;

#open the file, or exit
unless (open(PROTEINFILE,$proteinfilename)){print "Cannot open file \"$proteinfilename\"\n\n";
exit;}

#Read the protein sequence data from the file, and store in the array variable @protein
@protein = <PROTEINFILE>;

#close ssteh file- we ahave read all the data into @protein now.
close PROTEINFILE;

#Put the protein sequence data into a single string, as its easier to search for a motif in a string than in an array of
#lines (what if the motif occurs over a line break?

$protein = join('',@protein);

#remove whitespace
$protein =~s/\s//g;

#in a loop, ask the user for a motif, search for the motif and report if it was found.

do{
print "Enter the motif to search for: ";
$motif = <STDIN>;

#Remove the newline at the end of $motif
chomp $motif;

#look for the motif

if($protein =~/$motif/){
print "I found it!\n\n";
}
else
{
print "I couldn't find it.\n\n";
}

#exit on an empty user input
}until($motif =~/^\s*$/);

#exit the program
EXIT;
