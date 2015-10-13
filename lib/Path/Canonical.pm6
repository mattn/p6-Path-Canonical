use v6;

sub canon_filepath(Str $path) is export {
    my $p = $path;
    return canon_path($p) if $*DISTRO.is-win;
    $p = $p.subst('\\', '/', :g);
    $p = $p.subst(/^ (<[a .. z A .. Z]> ':' | '//' [^ '/'] + '/' + [^ '/'] +)/, '', :g);
    $path = (~$/||'') ~ canon_path($path);
    return $path.subst('/', '\\', :g);
}

sub canon_path(Str $path) is export {
    my $p = $path;
    my @ret = ();
    $p = $p ~ '/' if $p.ends-with('.') or $p.ends-with('/');
    for ($p ~ '-').split(/'/' +/) -> $tok {
         next if $tok eq '.';
         if $tok eq '..' {
             @ret.pop() if @ret.elems;
             next;
         }
         @ret.push($tok) if $tok;
    }
    return '/' ~ @ret.join('/').substr(0, *-1);
}

=begin pod

=head1 NAME

Path::Canonical - blah blah blah

=head1 SYNOPSIS

  use Path::Canonical;

=head1 DESCRIPTION

Path::Canonical is ...

=head1 COPYRIGHT AND LICENSE

Copyright 2015 Yasuhiro Matsumoto <mattn.jp@gmail.com>

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
