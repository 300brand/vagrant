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

/usr/bin/awk -f $T /etc/init.d/mongodb > /etc/init.d/mongos || exit 1

/bin/chmod +x /etc/init.d/mongos

/usr/sbin/update-rc.d mongos defaults || exit 1
