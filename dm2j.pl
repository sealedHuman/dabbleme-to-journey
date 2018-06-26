#!/usr/bin/perl

my $path="dm2j_in.txt";
open (my $fh, "<", $path);
print "{\n";
print "\"metadata\" : {\n";
print "  \"version\" : \"1.0\"\n";
print "},\n";
print "\"entries\" : [\n";

sub PrintEntry {
  print "{\n";
  print "  \"creationDeviceType\" : \"MacBook Pro\",\n";
  print "  \"starred\" : false,\n";
  print "  \"creationDate\" : \"$_[0]" . "T23:50:45Z\",\n";;
  print "  \"creationOSVersion\" : \"10.13.5\",\n";
  print "  \"text\" : \"$_[1]\",\n";
  print "  \"timeZone\" : \"America\\\/Chicago\",\n";
  print "  \"creationOSName\" : \"macOS\",\n";
  print "  \"uuid\" : \"$_[2]\",\n";
  print "  \"creationDevice\" : \"MacBook Pro\",\n";
  print "  \"creationDeviceModel\" : \"MacBookPro11,3\",\n";
  print "  \"duration\" : 0\n";
  if ($_[3] == 1) {
    print "},\n";
  } else {
    print "}\n";
  }
}

my $date = "";
my $text = "";
my $uuid = 0;
while(my $line = <$fh>)
{
  if ($line =~ /(\d{4}-\d{2}-\d{2})/){
    if ($uuid > 0) {
      PrintEntry($date, $text, $uuid, 1);
    }
    $uuid++;
    $date = $1;
    $text = "";
  } else {
    $line =~ s/^\s+//;
    if ($line ne "") {
      $line =~ s/"/\\"/g;
      $line =~ tr/\n/ /;
      $text .= $line;
    }
  }
}

if ($uuid > 0) {
  PrintEntry($date, $text, $uuid, 0);
}

print "]}\n";
