#!/usr/bin/env bash

cat > ~/.local/bin/fonts.html << __HEADER
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sample of local fonts matching '$1'</title>
</head>
<body>
__HEADER

fc-list --format='%{family}\n' $1 | sort -u | while IFS='' read -r fontfamily
do
    cat >> ~/.local/bin/fonts.html << __BODY
    <hr/>
    <div style="font-family: '${fontfamily}', 'serif'">
        <h3>${fontfamily}</h3>
        <p>
            The quick brown fox jumped over the lazy brown dog<br/>
            0123456789,.:;?/<>'"[]{}|\-=\`~!@#$%^&*()-=\\
        </p>
    </div>
__BODY

done

cat >> ~/.local/bin/fonts.html << __FOOTER
    <hr/>
</body>
</html>
__FOOTER

echo "fonts.html created"
