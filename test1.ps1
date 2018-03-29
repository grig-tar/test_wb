$edge = @("http://edge1.iptrunks.ru", "http://edge2.iptrunks.ru")

$fullVideoList = @()
$edge | % {
    $videoList = Invoke-RestMethod $_/rest-api/stream/find_all
    $fullVideoList += $videoList | ? status -eq "PLAYING"
}

$fullVideoList | select name | sort name | group name | sort count -Descending | select count, name -First 10