#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|
#
# -----------------------------------------------------
# Modular zshrc loader approach
# -----------------------------------------------------

# I've designed this in a way so that sections or 
# concepts of the shell config can be hot swapped in 
# and out to better manage work/home use and machine 
# differences mac/arch.

# You can define a custom configuration by adding
# files in ~/.config/zshrc
# or by creating a folder ~/.config/zshrc/custom
# with copies of files from ~/.config/zshrc
# great for building out new config or trying things.
# -----------------------------------------------------

# -----------------------------------------------------
# Load modular configarion
# -----------------------------------------------------

for f in ~/.config/:zshrc/*; do
    if [ ! -d $f ]; then
        c=`echo $f | sed -e "s=.config/zshrc=.config/zshrc/custom="`
        [[ -f $c ]] && source $c || source $f
    fi
done

# -----------------------------------------------------
# Load single customization file (if exists)
# -----------------------------------------------------

if [ -f ~/.zshrc_custom ]; then
    source ~/.zshrc_custom
fi
