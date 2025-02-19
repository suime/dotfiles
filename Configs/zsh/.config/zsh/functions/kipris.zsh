# 키프리스 특허 조사

function kipris_s() {
    local url='https://www.kipris.or.kr/kpat/resulta.do'
    local cookie='JSESSIONID=1JPBJDt4XbaVqOgmHtcQaDLHLbkN9ilKcfQDUfnomdMcUJPIvdObZpffJHytmVMU.amV1c19kb21haW4va3BhdDE='
    local headers='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:135.0) Gecko/20100101 Firefox/135.0
Accept: application/json, text/javascript, */*; q=0.01
Accept-Language: ko-KR,ko;q=0.8,en-US;q=0.5,en;q=0.3
Accept-Encoding: gzip, deflate, br, zstd
Referer: https://www.kipris.or.kr/khome/search/searchResult.do
Origin: https://www.kipris.or.kr
Sec-GPC: 1
Connection: keep-alive
Sec-Fetch-Dest: empty
Sec-Fetch-Mode: no-cors
Sec-Fetch-Site: same-origin
Content-Type: application/x-www-form-urlencoded; charset=UTF-8
X-Requested-With: XMLHttpRequest
Priority: u=4
Pragma: no-cache
Cache-Control: no-cache'

    local query="$1"                                           # 검색어를 인자로 받음
    local encoded_query=$(printf '%s' "$query" | jq -sRr @uri) # 검색어를 URI 형식으로 인코딩
    local page="$2"
    local file="$3"

    local response=$(curl $url -X POST \
        -H "$headers" \
        -H "Cookie: $cookie" \
        --data-raw "queryText=$encoded_query&expression=$encoded_query&historyQuery=$encoded_query&numPerPage=30&numPageLinks=10&currentPage=$page&piSearchYN=N")

    # 제어 문자를 제거
    response=$(echo "$response" | tr -d '\000-\031')

    if [[ -n "$file" ]]; then
        echo "$response" | jq "." >"$file"
    fi

    local totalcount=$(echo "$response" | jq '.countInfo.totalcount')
    local count=$(echo "$response" | jq '.countInfo.count')
    local resultList=$(echo "$response" | jq '.resultList')

    echo "total : $totalcount \t count : $count"

    # for result in $(
    #     echo "$resultList"
    # ); do
    #     local tl=$(echo "$result" | jq '.TL') # TL 값을 추출
    #     echo "TL: $tl"                        # TL 값을 출력
    # done
}
