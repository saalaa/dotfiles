#!/usr/bin/perl

use Sys::Hostname;
my $host = hostname;

my $TARGET;

open(BACKUPRC, glob('~/.backuprc'))
    or die "Error: Configuration not found";

while (<BACKUPRC>) {
    chomp;

    if (/^#/ || /^$/) {
        next ;
    }

    if (/TARGET\s*=\s*(.*)/) {
        $TARGET = $1;
        $TARGET =~ s/\${HOST}/$host/;

        print $TARGET;
        print "\n";

        next;
    }

    $_ =~ s/~/$ENV{HOME}/g;

    `logger -t backup $_`;
    `rsync -auz --delete --progress $_ $TARGET\n`;
}
