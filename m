Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.11541.1601345292636719496
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Sep 2020 19:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: windriver.com, ip: 198.145.29.25, mailfrom: mingli.yu@windriver.com)
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 6E63E38C132B
	for <meta-virtualization@yoctoproject.org>; Mon, 28 Sep 2020 19:08:12 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08T289qk029197
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 28 Sep 2020 19:08:09 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Mon, 28 Sep 2020 19:07:50 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
Subject: [PATCH v3] lxc: remove deprecated options in lxc*.service
Date: Tue, 29 Sep 2020 10:06:56 +0800
Message-ID: <20200929020656.39793-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <1638DCB9C95B4ECB.17423@lists.yoctoproject.org>
References: <1638DCB9C95B4ECB.17423@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Mingli Yu <mingli.yu@windriver.com>

Remove deprecated options in lxc*.service to silence below warning:
 # systemctl status lxc
 [snip]
 /usr/lib/systemd/system/lxc.service:17: Standard output type syslog is o=
bsolete, automatically updating to journal. Please update your unit file,=
 and consider removing the setting altogether.
 /usr/lib/systemd/system/lxc.service:18: Standard output type syslog is o=
bsolete, automatically updating to journal. Please update your unit file,=
 and consider removing the setting altogether.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...setting-regarding-the-Standard-Outpu.patch | 35 +++++++++++++++++++
 ...ed-options-in-lxc.service-fixes-3527.patch | 31 ++++++++++++++++
 recipes-containers/lxc/lxc_4.0.4.bb           |  2 ++
 3 files changed, 68 insertions(+)
 create mode 100644 recipes-containers/lxc/files/0001-Remove-obsolete-set=
ting-regarding-the-Standard-Outpu.patch
 create mode 100644 recipes-containers/lxc/files/0001-remove-deprecated-o=
ptions-in-lxc.service-fixes-3527.patch

diff --git a/recipes-containers/lxc/files/0001-Remove-obsolete-setting-re=
garding-the-Standard-Outpu.patch b/recipes-containers/lxc/files/0001-Remo=
ve-obsolete-setting-regarding-the-Standard-Outpu.patch
new file mode 100644
index 0000000..ab97422
--- /dev/null
+++ b/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding=
-the-Standard-Outpu.patch
@@ -0,0 +1,35 @@
+From a7a92a06a47322dee45664db5c7bfa68b2b95edb Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 23 Sep 2020 07:03:02 +0000
+Subject: [PATCH] Remove obsolete setting regarding the Standard Output
+
+The Standard output type "syslog" is obsolete, causing a warning since s=
ystemd
+version 246 [1].
+
+Please consider using "journal" or "journal+console"
+
+[1] https://github.com/systemd/systemd/blob/master/NEWS#L202
+
+Upstream-Status: Submitted [https://github.com/lxc/lxc/pull/3541]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ config/init/systemd/lxc@.service.in         | 2 --
+ 1 files changed, 2 deletions(-)
+
+diff --git a/config/init/systemd/lxc@.service.in b/config/init/systemd/l=
xc@.service.in
+index a2aa2211f..21ce64aef 100644
+--- a/config/init/systemd/lxc@.service.in
++++ b/config/init/systemd/lxc@.service.in
+@@ -14,8 +14,6 @@ ExecStop=3D@BINDIR@/lxc-stop -n %i
+ # Environment=3DBOOTUP=3Dserial
+ # Environment=3DCONSOLETYPE=3Dserial
+ Delegate=3Dyes
+-StandardOutput=3Dsyslog
+-StandardError=3Dsyslog
+=20
+ [Install]
+ WantedBy=3Dmulti-user.target
+--=20
+2.26.2
+
diff --git a/recipes-containers/lxc/files/0001-remove-deprecated-options-=
in-lxc.service-fixes-3527.patch b/recipes-containers/lxc/files/0001-remov=
e-deprecated-options-in-lxc.service-fixes-3527.patch
new file mode 100644
index 0000000..2957680
--- /dev/null
+++ b/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.=
service-fixes-3527.patch
@@ -0,0 +1,31 @@
+From 0c4cd88d4a19d27ba9b5d2c8fa4d482d78211c35 Mon Sep 17 00:00:00 2001
+From: graysky <graysky@archlinux.us>
+Date: Fri, 21 Aug 2020 06:33:49 -0400
+Subject: [PATCH] remove deprecated options in lxc.service fixes #3527
+
+Remove deprecated options in lxc.service fixes #3527
+
+Upstream-Status: Backport
+
+Signed-off-by: graysky <graysky@archlinux.us>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ config/init/systemd/lxc.service.in | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/config/init/systemd/lxc.service.in b/config/init/systemd/lx=
c.service.in
+index e3745dc2d..397a6c4d0 100644
+--- a/config/init/systemd/lxc.service.in
++++ b/config/init/systemd/lxc.service.in
+@@ -14,8 +14,6 @@ ExecReload=3D@LIBEXECDIR@/lxc/lxc-apparmor-load
+ # Environment=3DBOOTUP=3Dserial
+ # Environment=3DCONSOLETYPE=3Dserial
+ Delegate=3Dyes
+-StandardOutput=3Dsyslog
+-StandardError=3Dsyslog
+=20
+ [Install]
+ WantedBy=3Dmulti-user.target
+--=20
+2.26.2
+
diff --git a/recipes-containers/lxc/lxc_4.0.4.bb b/recipes-containers/lxc=
/lxc_4.0.4.bb
index f526ab9..4ef5fc0 100644
--- a/recipes-containers/lxc/lxc_4.0.4.bb
+++ b/recipes-containers/lxc/lxc_4.0.4.bb
@@ -47,6 +47,8 @@ SRC_URI =3D "http://linuxcontainers.org/downloads/${BPN=
}-${PV}.tar.gz \
 	file://templates-use-curl-instead-of-wget.patch \
 	file://tests-our-init-is-not-busybox.patch \
 	file://tests-add-no-validate-when-using-download-template.patch \
+	file://0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch \
+	file://0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch =
\
 	file://dnsmasq.conf \
 	file://lxc-net \
 	"
--=20
2.26.2

