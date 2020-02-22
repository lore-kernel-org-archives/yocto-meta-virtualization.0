Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by mx.groups.io with SMTP id smtpd.web09.4598.1582361704294215955
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 22 Feb 2020 00:55:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: users.sf.net, ip: 212.27.42.6, mailfrom: rzr@users.sf.net)
Received: from lap.lan.rzr.cloudns.org (unknown [IPv6:2a01:e35:2fd7:d710:4287:9a95:69e7:a265])
	by smtp6-g21.free.fr (Postfix) with ESMTPS id 8678D780326;
	Sat, 22 Feb 2020 09:54:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lap.lan.rzr.cloudns.org)
	by lap.lan.rzr.cloudns.org with esmtp (Exim 4.92)
	(envelope-from <rzr@users.sf.net>)
	id 1j5QYs-00028W-28; Sat, 22 Feb 2020 09:54:58 +0100
From: "Phil Coval" <rzr@users.sf.net>
To: meta-virtualization@lists.yoctoproject.org
Cc: philippe.coval.pro+meta-virtualization-lists.yoctoproject.org@gmail.com,
	bruce.ashfield@gmail.com,
	Philippe Coval <rzr@users.sf.net>
Subject: docker: fix init script for busybox
Date: Sat, 22 Feb 2020 09:54:56 +0100
Message-Id: <20200222085456.8144-1-rzr@users.sf.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Observed issue using BusyBox v1.30.1 not supporting bashism

/etc/init.d/docker.init: line 43: syntax error: unexpected redirection

Change-Id: I9f73564cfb56352fbf7d80723ea938b66eceb5c7
Forwarded: https://lists.yoctoproject.org/g/meta-virtualization
Signed-off-by: Philippe Coval <rzr@users.sf.net>
---
 recipes-containers/docker/files/docker.init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/docker/files/docker.init b/recipes-contai=
ners/docker/files/docker.init
index b37ddc9..24f8fea 100644
--- a/recipes-containers/docker/files/docker.init
+++ b/recipes-containers/docker/files/docker.init
@@ -40,7 +40,7 @@ start() {
     if ! [ -f $pidfile ]; then
         printf "Starting $prog:\t"
         echo -e "\n$(date)\n" >> $logfile
-        "$unshare" -m -- $exec $other_args &>> $logfile &
+        "$unshare" -m -- $exec $other_args >> $logfile 2>&1 &
         pid=3D$!
         touch $lockfile
         # wait up to 10 seconds for the pidfile to exist.  see
--=20
2.20.1

