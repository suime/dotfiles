function ai_hub() {
    case $1 in
    list)
        aihubshell -mode l
        ;;
    find)
        result=$(aihubshell -mode l | grep $2)
        if [[ -z "$result" ]]; then
            echo "결과가 없습니다."
            return
        fi

        while IFS= read -r line; do
            number=$(echo "$line" | grep -o '^[0-9]*')
            description=$(echo "$line" | grep -o '[^0-9,]*' | xargs)
            if [[ -n "$number" ]]; then
                echo "$line 링크: https://www.aihub.or.kr/aihubdata/data/view.do?dataSetSn=$number"
            fi
        done <<<"$result"
        ;;
    download)
        if [[ -n "$3" ]]; then
            aihubshell -mode d -datasetkey $2 -filekey $3 -aihubid $aihub_id -aihubpw $aihub_passwd
        else
            aihubshell -mode d -datasetkey $2 -aihubid $aihub_id -aihubpw $aihub_passwd
        fi
        ;;
    *)
        echo "사용법: ai_hub {list|download [dataset]}"
        ;;
    esac
}
