#Wrote a subroutine(actually reinvented the wheel) to calculate date after(or before) certain no. of days. Without using Date::Time module:

sub CalcDate() {
my %hash_month = qw/Jan 01 Feb 02 Mar 03 Apr 04 May 05 Jun 06 Jul 07 Aug 08 Sep 09 Oct 10 Nov 11 Dec 12/;
@DateArr=split(" ",scalar localtime(time+$_[0]*86400));
$DateArr[2]="0".$DateArr[2] if (length($DateArr[2])==1);
$DateArr[-1].$hash_month{$DateArr[1]}.$DateArr[2];
}

print &CalcDate($argument);   # Enter numeric argument to find date $argument days after today in yyyymmdd format