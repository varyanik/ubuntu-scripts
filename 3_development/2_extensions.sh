#!/bin/bash

# Google Chrome Extensions

mkdir -p ~/downloaded-chrome-extensions && cd ~/downloaded-chrome-extensions

download() {
  curl "https://clients2.google.com/service/update2/crx?response=redirect&x=id%3D$2%26uc&prodversion=32" -H 'Host: clients2.google.com' -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3' --compressed -H 'Connection: keep-alive' -L -o "$1.crx"
}

# https://chrome.google.com/webstore/detail/advanced-rest-client/hgmloofddffdnphfgcellkdfbfbjeloo
download 'Advanced REST client' 'hgmloofddffdnphfgcellkdfbfbjeloo'

# https://chrome.google.com/webstore/detail/angularjs-batarang/ighdmehidhipcmcojjgiloacoafjmpfk
download 'AngularJS Batarang' 'ighdmehidhipcmcojjgiloacoafjmpfk'

# https://chrome.google.com/webstore/detail/app-inspector-for-sencha/pbeapidedgdpniokbedbfbaacglkceae
download 'App Inspector for Sencha' 'pbeapidedgdpniokbedbfbaacglkceae'

# https://chrome.google.com/webstore/detail/appspector/homgcnaoacgigpkkljjjekpignblkeae
download 'Appspector' 'homgcnaoacgigpkkljjjekpignblkeae'

# https://chrome.google.com/webstore/detail/backbone-debugger/bhljhndlimiafopmmhjlgfpnnchjjbhd
download 'Backbone Debugger' 'bhljhndlimiafopmmhjlgfpnnchjjbhd'

# https://chrome.google.com/webstore/detail/builtwith-technology-prof/dapjbgnjinbpoindlpdmhochffioedbn
download 'BuiltWith Technology Profiler' 'dapjbgnjinbpoindlpdmhochffioedbn'

# https://chrome.google.com/webstore/detail/colorzilla/bhlhnicpbhignbdhedgjhgdocnmhomnp
download 'ColorZilla' 'bhlhnicpbhignbdhedgjhgdocnmhomnp'

# https://chrome.google.com/webstore/detail/devtools-terminal/leakmhneaibbdapdoienlkifomjceknl
download 'Devtools Terminal' 'leakmhneaibbdapdoienlkifomjceknl'

# https://chrome.google.com/webstore/detail/editthiscookie/fngmhnnpilhplaeedifhccceomclgfbg
download 'EditThisCookie' 'fngmhnnpilhplaeedifhccceomclgfbg'

# https://chrome.google.com/webstore/detail/grunt-devtools/fbiodiodggnlakggeeckkjccjhhjndnb
download 'Grunt Devtools' 'fbiodiodggnlakggeeckkjccjhhjndnb'

# https://chrome.google.com/webstore/detail/jquery-audit/dhhnpbajdcgdmbbcoakfhmfgmemlncjg
download 'jQuery Audit' 'dhhnpbajdcgdmbbcoakfhmfgmemlncjg'

# https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc
download 'JSONView' 'chklaanhfefbnpoihckbnefhakgolnmc'

# https://chrome.google.com/webstore/detail/open-seo-statsformerly-pa/hbdkkfheckcdppiaiabobmennhijkknn
download 'Open SEO Stats' 'hbdkkfheckcdppiaiabobmennhijkknn'

# https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi
download 'React Developer Tools' 'fmkadmapgofadopljbjfkapdkoienihi'

# https://chrome.google.com/webstore/detail/web-developer-checklist/iahamcpedabephpcgkeikbclmaljebjp
download 'Web Developer Checklist' 'iahamcpedabephpcgkeikbclmaljebjp'

#google-chrome-beta &>/dev/null &

echo 'Open "chrome://extensions" and drag&drop extensions there'

