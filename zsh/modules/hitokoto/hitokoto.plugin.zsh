if ! (( $+commands[curl] )); then
    echo "hitokoto plugin needs curl to work" >&2
    return
fi

if ! (( $+commands[jq] )); then
    echo "hitokoto plugin needs jq to work" >&2
    return
fi

curl --connect-timeout 0.2 -m 0.2 -sL https://v1.hitokoto.cn/\?encode\=json |\
    jq '.hitokoto,.from'|sed  's/^"\(.*\)"$/\1/' |\
    awk 'BEGIN{FS="\n";RS=""}{print $1" --"$2}' |\
    xargs echo $fg[green]
