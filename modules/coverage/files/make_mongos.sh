#!/bin/sh
T=`tempfile`
NAME="$1"

if [ -z $NAME ]; then
	NAME=mongos
fi

cat > $T <<EOF
/^CONF=/ || /^NAME=/ || /^# Provides:/ {
	gsub(/mongodb?/, "$NAME")
}
/^DESC=/ {
	\$0 = "DESC=$NAME"
}
{
	print
}
EOF

/usr/bin/awk -f $T /etc/init.d/mongodb > /etc/init.d/$NAME || exit 1

/bin/chmod +x /etc/init.d/$NAME

/usr/sbin/update-rc.d $NAME defaults || exit 1
