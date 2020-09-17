Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.13436.1600342748438203153
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 17 Sep 2020 04:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: yanfei.xu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08HBd7Ht008203
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Sep 2020 04:39:07 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Thu, 17 Sep 2020
 04:38:54 -0700
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] libvirt: Use /run in replace of /var/run in libvirt
Date: Thu, 17 Sep 2020 19:38:53 +0800
Message-ID: <20200917113853.29095-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id 08HBd7Ht008203
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Yanfei Xu <yanfei.xu@windriver.com>

To avoid systemd complains that the libvirt unit files use legacy
directory, we configure the libvirt with '--with-runstatedir=3D/run'
and do some minor changes.

------------------cut here----------------------
014: systemd[1]: /lib/systemd/system/virtlogd.socket:6: ListenStream=3D
references a path below legacy directory /var/run/, updating
/var/run/libvirt/virtlogd-sock =E2=86=92 /run/libvirt/virtlogd-sock; plea=
se
update the unit file accordingly.
014: systemd[1]: /lib/systemd/system/virtlogd-admin.socket:8:
ListenStream=3D references a path below legacy directory /var/run/,
updating /var/run/libvirt/virtlogd-admin-sock =E2=86=92
/run/libvirt/virtlogd-admin-sock; please update the unit file
accordingly.
014: systemd[1]: /lib/systemd/system/virtlockd.socket:6: ListenStream=3D
references a path below legacy directory /var/run/, updating
/var/run/libvirt/virtlockd-sock =E2=86=92 /run/libvirt/virtlockd-sock; pl=
ease
update the unit file accordingly.
014: systemd[1]: /lib/systemd/system/virtlockd-admin.socket:8:
ListenStream=3D references a path below legacy directory /var/run/,
updating /var/run/libvirt/virtlockd-admin-sock =E2=86=92
/run/libvirt/virtlockd-admin-sock; please update the unit file
accordingly.
014: systemd[1]: /lib/systemd/system/libvirtd.socket:9: ListenStream=3D
references a path below legacy directory /var/run/, updating
/var/run/libvirt/libvirt-sock =E2=86=92 /run/libvirt/libvirt-sock; please=
 update
the unit file accordingly.
014: systemd[1]: /lib/systemd/system/libvirtd-ro.socket:11:
ListenStream=3D references a path below legacy directory /var/run/,
updating /var/run/libvirt/libvirt-sock-ro =E2=86=92
/run/libvirt/libvirt-sock-ro; please update the unit file accordingly.
......

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 recipes-extended/libvirt/libvirt_6.3.0.bb | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_6.3.0.bb b/recipes-extended=
/libvirt/libvirt_6.3.0.bb
index 70c6d71..41abb06 100644
--- a/recipes-extended/libvirt/libvirt_6.3.0.bb
+++ b/recipes-extended/libvirt/libvirt_6.3.0.bb
@@ -283,23 +283,23 @@ do_install_append() {
=20
 	    # We can't use 'notify' when we don't support 'sd_notify' dbus capa=
bilities.
 	    sed -i -e 's/Type=3Dnotify/Type=3Dforking/' \
-	           -e '/Type=3Dforking/a PIDFile=3D${localstatedir}/run/libvirt=
d.pid' \
+	           -e '/Type=3Dforking/a PIDFile=3D/run/libvirtd.pid' \
 		   ${D}/${systemd_unitdir}/system/libvirtd.service
 	fi
=20
-	# The /var/run/libvirt directories created by the Makefile
-	# are wiped out in volatile, we need to create these at boot.
-	rm -rf ${D}${localstatedir}/run
+	# The /run/libvirt directories created by the Makefile are=20
+	# wiped out in volatile, we need to create these at boot.
+	rm -rf ${D}/run
 	install -d ${D}${sysconfdir}/default/volatiles
-	echo "d root root 0755 ${localstatedir}/run/libvirt none" \
+	echo "d root root 0755 /run/libvirt none" \
 	     > ${D}${sysconfdir}/default/volatiles/99_libvirt
-	echo "d root root 0755 ${localstatedir}/run/libvirt/lockd none" \
+	echo "d root root 0755 /run/libvirt/lockd none" \
 	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
-	echo "d root root 0755 ${localstatedir}/run/libvirt/lxc none" \
+	echo "d root root 0755 /run/libvirt/lxc none" \
 	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
-	echo "d root root 0755 ${localstatedir}/run/libvirt/network none" \
+	echo "d root root 0755 /run/libvirt/network none" \
 	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
-	echo "d root root 0755 ${localstatedir}/run/libvirt/qemu none" \
+	echo "d root root 0755 /run/libvirt/qemu none" \
 	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
=20
 	# Manually set permissions and ownership to match polkit recipe
@@ -379,6 +379,7 @@ do_install_append() {
 EXTRA_OECONF +=3D " \
     --with-init-script=3Dsystemd \
     --with-test-suite \
+    --with-runstatedir=3D/run \
     "
=20
 # gcc9 end up mis-compiling qemuxml2argvtest.o with Og which then
--=20
2.18.2

