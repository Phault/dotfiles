if test -d "/home/linuxbrew/.linuxbrew"
    set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew";
    set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar";
    set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew";
    ! set -q MANPATH; and set MANPATH ''; set -gx MANPATH "/home/linuxbrew/.linuxbrew/share/man" $MANPATH;
    ! set -q INFOPATH; and set INFOPATH ''; set -gx INFOPATH "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH;
    fish_add_path -pP "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin"
end
