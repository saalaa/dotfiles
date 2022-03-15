#!/usr/bin/perl

use Sys::Hostname;
my $host = hostname;

my $RSYNC = "rsync";
my $RSYNC_ARGS = "-auz --delete --progress";

sub syslog {
    `logger -t backup "$$ $_[0]"`;
}

# Read from the configuration file
my $ARGS;
my $TARGET;

open(BACKUPRC, glob('~/.backuprc'))
    or die "Error: Configuration not found";

while (<BACKUPRC>) {
    chomp;

    if (/^#/ || /^$/) {
        next;
    }

    if (/ARGS\s*=\s*(.*)/) {
        $ARGS = $1;

        next;
    }

    if (/TARGET\s*=\s*(.*)/) {
        $TARGET = $1;
        $TARGET =~ s/\${HOSTNAME}/$host/;

        syslog("Error: $TARGET does not exist") unless -d $TARGET;

        next;
    }

    $_ =~ s/~/$ENV{HOME}/g;

    if (-d $TARGET) {
        syslog("Backing up $_ to $TARGET");

        `$RSYNC $RSYNC_ARGS $ARGS $_ $TARGET\n`;
    } else {
        syslog("Skipping $_");
    }
}
