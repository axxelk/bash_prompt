# root@f36:/etc/profile.d $ cat bash_prompt.sh
promptuserlist="yourloginnamehere othernamehere"
xlogname=$(logname)
userisin=$(echo $promptuserlist|grep -w -q $xlogname && echo "true" || echo "false")

promptfunction ()
{
    if [ "$USER" = "root" ]; then
        export PS1="\e[1;31m\]\u\e[1;30m\]@\h:\w \\$ \[\e[0m\]";
    elif [ "$USER" = "lnx" ]; then
        export PS1="\e[1;33m\]\u\e[1;30m\]@\h:\w \\$ \[\e[0m\]";
    else
        export PS1="\e[1;32m\]\u\e[1;30m\]@\h:\w \\$ \[\e[0m\]";
    fi
}

if [ $userisin = "true" ]; then
    export PROMPT_COMMAND="promptfunction";
# else
#     unset PROMPT_COMMAND;
fi
