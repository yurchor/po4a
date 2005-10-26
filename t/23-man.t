#! /usr/bin/perl
# Man module tester.

#########################

use strict;
use warnings;

my @tests;

my @formats=qw(man);

mkdir "t/tmp" unless -e "t/tmp";

my $diff_po_flags = " -I '^# SOME' -I '^# Test' ".
  "-I '^\"POT-Creation-Date: ' -I '^\"Content-Transfer-Encoding:'";
my $diff_pod_flags= " -I 'This file was generated by po4a' ";

# Quotes (3 tests)
push @tests, {
  'run'  => "perl ../po4a-gettextize -f #format# -m data-23/quotes -p tmp/quotes.pot 2>/dev/null",
  'test' => "diff -u $diff_po_flags  data-23/quotes.pot tmp/quotes.pot",
  'doc'  => "gettextize well various quotes",
}, {
  'run'  => "cp data-23/quotes.fr.po tmp/ && perl ../po4a-updatepo -f #format# -m data-23/quotes -p tmp/quotes.fr.po >/dev/null 2>&1 ",
  'test' => "diff -u $diff_po_flags  data-23/quotes.fr.po tmp/quotes.fr.po",
  'doc'  => "updatepo for this document",
}, {
  'run'  => "perl ../po4a-translate -f #format# -m data-23/quotes -p data-23/quotes.fr.po -l tmp/quotes.fr",
  'test' => "diff -u $diff_pod_flags data-23/quotes.fr tmp/quotes.fr",
  'doc'  => "translate this document",
};

# Dots (9 tests)
push @tests, {
  'run'  => "perl ../po4a-gettextize -f #format# -m data-23/dot1 -p tmp/dot1.pot 2>/dev/null",
  'test' => "diff -u $diff_po_flags  data-23/dot1.pot tmp/dot1.pot",
  'doc'  => "gettextize well various lines beginning by a dot (1)",
}, {
  'run'  => "cp data-23/dot1.fr.po tmp/ && perl ../po4a-updatepo -f #format# -m data-23/dot1 -p tmp/dot1.fr.po >/dev/null 2>&1 ",
  'test' => "diff -u $diff_po_flags  data-23/dot1.fr.po tmp/dot1.fr.po",
  'doc'  => "updatepo for this document",
}, {
  'run'  => "perl ../po4a-translate -f #format# -m data-23/dot1 -p data-23/dot1.fr.po -l tmp/dot1.fr",
  'test' => "diff -u $diff_pod_flags data-23/dot1.fr tmp/dot1.fr",
  'doc'  => "translate this document",
}, {
  'run'  => "LC_ALL=C COLUMNS=80 perl ../po4a-gettextize -f #format# -m data-23/dot2 -p tmp/dot2.pot 2>tmp/dot2.err || true",
  'test' => "diff -u $diff_po_flags  data-23/dot2.err tmp/dot2.err",
  'doc'  => "gettextize well various lines beginning by a dot (2)",
}, {
  'run'  => "LC_ALL=C COLUMNS=80 perl ../po4a-gettextize -f #format# -m data-23/dot3 -p tmp/dot3.pot 2>tmp/dot3.err || true",
  'test' => "diff -u $diff_po_flags  data-23/dot3.err tmp/dot3.err",
  'doc'  => "gettextize well various lines beginning by a dot (3)",
}, {
  'run'  => "LC_ALL=C COLUMNS=80 perl ../po4a-gettextize -f #format# -m data-23/dot4 -p tmp/dot4.pot 2>tmp/dot4.err || true",
  'test' => "diff -u $diff_po_flags  data-23/dot4.err tmp/dot4.err",
  'doc'  => "gettextize well various lines beginning by a dot (4)",
}, {
  'run'  => "LC_ALL=C perl ../po4a-gettextize -f #format# -m data-23/dot5 -p tmp/dot5.pot 2>/dev/null",
  'test' => "diff -u $diff_po_flags  data-23/dot5.pot tmp/dot5.pot",
  'doc'  => "gettextize well various lines beginning by a dot (5)",
}, {
  'run'  => "cp data-23/dot5.it.po tmp/ && perl ../po4a-updatepo -f #format# -m data-23/dot5 -p tmp/dot5.it.po >/dev/null 2>&1 ",
  'test' => "diff -u $diff_po_flags  data-23/dot5.it.po tmp/dot5.it.po",
  'doc'  => "updatepo for this document",
}, {
  'run'  => "perl ../po4a-translate -f #format# -m data-23/dot5 -p data-23/dot5.it.po -l tmp/dot5.it",
  'test' => "diff -u $diff_pod_flags data-23/dot5.it tmp/dot5.it",
  'doc'  => "translate this document",
};

# Null argument (3 tests)
push @tests, {
  'run'  => "LC_ALL=C perl ../po4a-gettextize -f #format# -m data-23/null -p tmp/null.pot 2>/dev/null",
  'test' => "diff -u $diff_po_flags  data-23/null.pot tmp/null.pot",
  'doc'  => "gettextize well null argument/paragraphs",
}, {
  'run'  => "cp data-23/null.fr.po tmp/ && perl ../po4a-updatepo -f #format# -m data-23/null -p tmp/null.fr.po >/dev/null 2>&1 ",
  'test' => "diff -u $diff_po_flags  data-23/null.fr.po tmp/null.fr.po",
  'doc'  => "updatepo for this document",
}, {
  'run'  => "perl ../po4a-translate -f #format# -m data-23/null -p data-23/null.fr.po -l tmp/null.fr",
  'test' => "diff -u $diff_pod_flags data-23/null.fr tmp/null.fr",
  'doc'  => "translate this document",
};

# Escaped tabs and newlines (3 tests)
push @tests, {
  'run'  => "LC_ALL=C perl ../po4a-gettextize -f #format# -m data-23/escapes1 -p tmp/escapes1.pot 2>/dev/null",
  'test' => "diff -u $diff_po_flags  data-23/escapes1.pot tmp/escapes1.pot",
  'doc'  => "gettextize well escaped newlines and tabs",
}, {
  'run'  => "cp data-23/escapes1.it.po tmp/ && perl ../po4a-updatepo -f #format# -m data-23/escapes1 -p tmp/escapes1.it.po >/dev/null 2>&1 ",
  'test' => "diff -u $diff_po_flags  data-23/escapes1.it.po tmp/escapes1.it.po",
  'doc'  => "updatepo for this document",
}, {
  'run'  => "perl ../po4a-translate -f #format# -m data-23/escapes1 -p data-23/escapes1.it.po -l tmp/escapes1.it",
  'test' => "diff -u $diff_pod_flags data-23/escapes1.it tmp/escapes1.it",
  'doc'  => "translate this document",
};

use Test::More tests => 36; # $formats * $tests * 2 

foreach my $format (@formats) {
    for (my $i=0; $i<scalar @tests; $i++) {
	chdir "t" || die "Can't chdir to my test directory";
	
	my ($val,$name);
	
	my $cmd=$tests[$i]{'run'};
	$cmd =~ s/#format#/$format/g;
	$val=system($cmd);
	
	$name=$tests[$i]{'doc'}.' runs';
	$name =~ s/#format#/$format/g;
	ok($val == 0,$name);
	diag($cmd) unless ($val == 0);
	
	SKIP: {
	    skip ("Command don't run, can't test the validity of its return",1)
	      if $val;
	    my $testcmd=$tests[$i]{'test'};	
	    $testcmd =~ s/#format#/$format/g;
	    
	    $val=system($testcmd);
	    $name=$tests[$i]{'doc'}.' returns what is expected';
	    $name =~ s/#format#/$format/g;
	    ok($val == 0,$name);
	    unless ($val == 0) {
		diag ("Failed (retval=$val) on:");
		diag ($testcmd);
		diag ("Was created with:");
		diag ("perl -I../lib $cmd");
	    }
	}
	
#    system("rm -f tmp/* 2>&1");
	
	chdir ".." || die "Can't chdir back to my root";
    }
}

0;
    
