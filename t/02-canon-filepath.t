use v6;
use Test;
use Path::Canonical;

skip("Those tests are working on windows", 6) if $*DISTRO.is-win;
is canon-filepath('c:\\path/to/../from/file.txt'), 'c:\\path\\from\\file.txt';
is canon-filepath('c:/\\path/to/../..\\..//file.txt'), 'c:\\file.txt';
is canon-filepath('\\\\path/to/../from/file.txt'), '\\\\path\\to\\from\\file.txt';
is canon-filepath('\\\\path/to/../../file.txt'), '\\\\path\\to\\file.txt';
is canon-filepath('path/to/../file.txt'), '\\path\\file.txt';
is canon-filepath('path/to/../../file.txt'), '\\file.txt';

done-testing;
