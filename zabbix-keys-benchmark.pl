#!/usr/bin/perl

use strict;
use warnings;
use Time::HiRes qw (time);

my $host  = $ARGV[0];
my $count = 10;
my $file  = 'keys2.txt';
my @keys  = ();
my %data  = ();

# read keys from file
open( F, "<", $file ) or die "Cannot open $file\n";
while (<F>) {
    chomp;
    push @keys, $_;
}
close(F);

# perform benchmark given number of times
for ( my $i = 0 ; $i <= $count ; $i++ ) {
    foreach my $key (@keys) {
        my $stime = time() * 1000000;
        my $res   = `zabbix_get -s $host -k $key`;
        my $etime = time() * 1000000;
        $data{$key} += $etime - $stime;
    }
}

# display data
foreach ( keys %data ) {
    my $d = $data{$_} / 1000000;
    print "$d $_\n";
}
