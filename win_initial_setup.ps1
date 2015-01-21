$webclient = New-Object System.Net.WebClient
$url = "https://download.mozilla.org/?product=firefox-28.0-SSL&os=win&lang=ja"
$file = "$pwd/Firefox Setup 28.0.exe"
$webclient.DownloadFile($url,$file)
# & ‘./Firefox Setup 28.0.exe' -ms
