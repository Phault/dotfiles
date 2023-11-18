for justfile in {$HOME}/tasks/*.just
	set -l command (basename $justfile .just)
	alias $command "just --justfile $justfile --working-directory ."
end
