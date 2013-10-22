#!/bin/sh
T=`tempfile`

cat > $T <<"EOF"
/^CONF=/ || /^NAME=/ || /^DAEMON=/ || /^# Provides:/ {
	gsub(/mongodb?/, "mongos")
}
/^DESC=/ {
	$0 = "DESC=mongos-router"
}
{
	print
}
EOF

awk -f $T /etc/init.d/mongodb > /etc/init.d/mongos || exit 1

chmod +x /etc/init.d/mongos

update-rc.d mongos defaults || exit 1
