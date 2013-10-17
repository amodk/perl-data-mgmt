#Find below a web scraper for downloading all jpg files from any webpage. You can use it for downloading files of any format.
#Also, you can use it on webpages sequentially e.g. if you want to download all jpg from  http://www.link.com/page1 to http://www.link.com/page150 you can give LINK as http://www.link.com/page[1-150]

chomp(@ARGV);
$w="http://LINK";  #Replace LINK with actual link here
my @Arr=split(/\n/,`curl -s -L \"$w\"`); #Download Unix Curl from haxx
foreach $Line(@Arr)
{
push (@Links, "$2$3$4\n") if $Line =~ /(src=\")(http)(.*?)(jpg)/; #Replace jpg with file format
}
foreach $link(@Links)
{
chomp($link);
system("curl -L -O \"$link\"");
}