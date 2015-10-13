use v6;
use Test;
use Path::Canonical;

is canon_path('/var/tmp/./foo/../bar/..'), '/var/tmp/';
is canon_path('/var/tmp/./foo/../bar/../'), '/var/tmp/';
is canon_path('/var/tmp/./foo/../bar'), '/var/tmp/bar';
is canon_path('/../bar/..'), '/';
is canon_path('/../bar/../'), '/';
is canon_path('/../bar'), '/bar';
is canon_path('../bar/..'), '/';
is canon_path('../bar/../'), '/';
is canon_path('../bar'), '/bar';
is canon_path('./bar/..'), '/';
is canon_path('./bar/../'), '/';
is canon_path('./bar'), '/bar';
is canon_path('/var/tmp/./foo/../bar/'), '/var/tmp/bar/';
is canon_path('/var/tmp'), '/var/tmp';
is canon_path('/var//../../../foo/bar/baz'), '/foo/bar/baz';
is canon_path('/./././././././././.bashrc'), '/.bashrc';

done-testing;
