#!/bin/bash

# Google Chrome Extensions

mkdir -p ~/Downloads/extensions/chrome && cd ~/Downloads/extensions/chrome

download() {
  curl "https://clients2.google.com/service/update2/crx?response=redirect&x=id%3D$2%26uc&prodversion=32" -H 'Host: clients2.google.com' -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3' --compressed -H 'Connection: keep-alive' -L -o "$1.crx"
}

# https://chrome.google.com/webstore/detail/adblock/gighmmpiobklfepjocnamgkkbiglidom
download 'AdBlock' 'gighmmpiobklfepjocnamgkkbiglidom'

# https://chrome.google.com/webstore/detail/bookmark-manager/gmlllbghnfkpflemihljekbapjopfjik
download 'Bookmark Manager' 'gmlllbghnfkpflemihljekbapjopfjik'

# https://chrome.google.com/webstore/detail/cloud-save/ehjiibljljecbmgpgdlkejiaadppplkp
download 'Cloud Save' 'ehjiibljljecbmgpgdlkejiaadppplkp'

# https://chrome.google.com/webstore/detail/google-mail-checker/mihcahmgecmbnbcchbopgniflfhgnkff
download 'Google Mail Checker' 'mihcahmgecmbnbcchbopgniflfhgnkff'

# https://chrome.google.com/webstore/detail/nimbus-screenshot/bpconcjcammlapcogcnnelfmaeghhagj
download 'Nimbus Screenshot' 'bpconcjcammlapcogcnnelfmaeghhagj'

# https://chrome.google.com/webstore/detail/search-by-image-by-google/dajedkncpodkggklbegccjpmnglmnflm
download 'Search by Image (by Google)' 'dajedkncpodkggklbegccjpmnglmnflm'

# https://chrome.google.com/webstore/detail/session-buddy/edacconmaakjimmfgnblocblbcdcpbko
download 'Session Buddy' 'edacconmaakjimmfgnblocblbcdcpbko'

# https://chrome.google.com/webstore/detail/session-manager/mghenlmbmjcpehccoangkdpagbcbkdpc
download 'Session Manager' 'mghenlmbmjcpehccoangkdpagbcbkdpc'

# https://chrome.google.com/webstore/detail/the-great-suspender/klbibkeccnjlkjkiokjodocebajanakg
download 'The Great Suspender' 'klbibkeccnjlkjkiokjodocebajanakg'

#google-chrome-beta &>/dev/null &

echo 'Open "chrome://extensions" and drag&drop extensions there'

