####This script was written to download YAPC::EU images uploaded by @yapceu using pure Perl.
#### Executed on Perl (Version 5.20, still not on 6) by @BeardData 

use strict;
use LWP::Simple;
my $k=0;

for($k=1;$k<=19;$k++)
{
my $jpg_link="";
my $jpg_name="";
my $yapc_pics_url=($k==1?("http://hydra.azilian.net/pics/yapceu2014"):("http://hydra.azilian.net/pics/yapceu2014/index$k.html")); 
  #Got the URLs, with command line curl -s -L we can directly use index[2-19].html, but I'm using pure perl without curl!
my @Page = split(/\n/,get($yapc_pics_url)); 
foreach my $Line(@Page)
{
if($Line =~ /(\w{3}_\d{4}\.jpg)/i) #Should have used a HTML parser, but this was just one simple requirement so regex would do
{
$jpg_name=$+; #matched string is file name
$jpg_link="http://hydra.azilian.net/pics/yapceu2014/huge/huge_$jpg_name";  #prefix with path
getstore($jpg_link,$jpg_name);  #unless you wish to go binmode and write in file handle
}
}  
}
