Return-Path: <vudupa@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C44DCF8858
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 13:24:06 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34070.1763645037608106484
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Nov 2025 05:23:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=DjpufkBa;
 spf=temperror, err=temporary DNS error (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: vudupa@qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKC3A4R4101208
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Nov 2025 13:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v6naQsBx+BFLcT3zPml7Zp
	BtOCC6fpAodL43lJEmfN4=; b=DjpufkBaSPi5hU/eH64MJC9P+X0hzsSh6pTs5T
	Rq5a7ngQ1ZDUJnR4eOsSSDcOgGEUT4k3fLVf00DsoQVs+E7uEEluFY6jrgr43oCH
	C7OqbW8pmYxCxE2mvzkwg24CznqdG4vuq0IpQlAYLGEyz/O1Sw+zJ5mSCcsPFckG
	504vscAzkfqPCk5Zj40Tx1unDz6YC8UpfeL9/dUUzzfJLYYUJlm2N+PkeKjtjbPo
	33I0H9uybriARC64p52OGj0wyrvMMuw7Wmcu2G7Q2lnACZL1OnVFljLva+neXr+E
	SkMlSV5/wq8hgay5Qgojw0cpETN19R82a0kOg2cREEntXq6Q==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahver1fb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Nov 2025 13:23:56 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AKDNr9S010857
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Nov 2025 13:23:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ahcb2mv23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Nov 2025 13:23:53 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AKDNrtY010848
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Nov 2025 13:23:53 GMT
Received: from hyd-e160-a01-2-03.qualcomm.com (hyd-e160-a01-2-03.qualcomm.com [10.147.154.239])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5AKDNq1i010844
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 13:23:53 +0000
Received: by hyd-e160-a01-2-03.qualcomm.com (Postfix, from userid 3978420)
	id C5DDF4E7B; Thu, 20 Nov 2025 18:53:51 +0530 (IST)
From: Vishwas Udupa <vudupa@qti.qualcomm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: anuj.mittal@oss.qualcomm.com, Vishwas Udupa <vudupa@qti.qualcomm.com>
Subject: [PATCH] lxc: backport patch to enable systemd StateDirectory for lxc
Date: Thu, 20 Nov 2025 18:53:10 +0530
Message-Id: <20251120132310.3500656-1-vudupa@qti.qualcomm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZvPg6t7G c=1 sm=1 tr=0 ts=691f166c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=lIZ_zT8JQv4ausgWbZIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Oq9o4A_s5unH9J2FeGFmHQFvD7UEjzJM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA4NiBTYWx0ZWRfX6SQDFXiBXwID
 yNwY0pVcyeIz4qBKGXu1EFsGU1PezM/F31bZRLGVvoUsfa3HMOfU4B6vSW3P/ELJzjMxHF7OHgi
 xQEKM9VcbqlZZEa/qa1TzqwjoQQNq0b+/8DlZUujXE/egqWwinNF4GUnWmRb71yFldF4oxrNEMi
 6tSjCH/kt7M6hAQAhRjjGDfX6yMOTz+6JyuIABMZrYCD3oAPNEbCBM7BEGjq8IPTEcK5ALRU7+C
 OAarybsjnK/2yfrl7EpRice5+tO/6qMaz+gfBPtE0wGiV4ARhTl5eCF+WOdkuZmgxhAKAFV9K6j
 tFXoXLe18y0n5SLrXHv5WLNvswasAxLFBpIJAjlh8not2BHED0dQhOq4BMd2YqR88llvzHPDDFt
 nIw/M1Mpbe25yudkevP3R/3bMyAfUw==
X-Proofpoint-GUID: Oq9o4A_s5unH9J2FeGFmHQFvD7UEjzJM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_05,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200086
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 5AKC3A4R4101208
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Nov 2025 13:24:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9453

Backport upstream patch to make sure lxc systemd service
defines a StateDirectory to ensure that the /var/lib/lxc
directory is automatically created and managed by systemd
during service startup.
Do not create lxc directory at build time for systemd.

Signed-off-by: Vishwas Udupa <vudupa@qti.qualcomm.com>
---
 ...nable-systemd-StateDirectory-for-lxc.patch | 55 +++++++++++++++++++
 recipes-containers/lxc/lxc_git.bb             |  3 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 recipes-containers/lxc/files/0001-enable-systemd-Stat=
eDirectory-for-lxc.patch

diff --git a/recipes-containers/lxc/files/0001-enable-systemd-StateDirect=
ory-for-lxc.patch b/recipes-containers/lxc/files/0001-enable-systemd-Stat=
eDirectory-for-lxc.patch
new file mode 100644
index 00000000..2d60798a
--- /dev/null
+++ b/recipes-containers/lxc/files/0001-enable-systemd-StateDirectory-for=
-lxc.patch
@@ -0,0 +1,55 @@
+From c7bd5a3576f7449040e2164b6740c94cc2f5940c Mon Sep 17 00:00:00 2001
+From: Vishwas Udupa <vudupa@qti.qualcomm.com>
+Date: Wed, 17 Sep 2025 03:56:09 -0700
+Subject: [PATCH] Enable systemd to create /var/lib/lxc at runtime
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport [https://github.com/lxc/lxc/commit/c7bd5a3]
+Signed-off-by: Vishwas Udupa <vudupa@qti.qualcomm.com>
+Co-developed-by: Raghuvarya S <raghuvar@qti.qualcomm.com>
+
+This change adds the StateDirectory=3D directive in the systemd
+unit file to ensure that the /var/lib/lxc directory is
+automatically created and managed by systemd during service startup.
+
+The StateDirectory=3D option instructs systemd to create a persistent
+state directory under /var/lib/. This is particularly useful in
+scenarios where the directory may be missing at first boot =E2=80=94 suc=
h as
+on OSTree-based Linux distributions, which typically ship with
+empty /var directory as part of their immutable root filesystem.
+
+By adding StateDirectory=3Dlxc, systemd will handle the creation of
+/var/lib/lxc on first boot, ensuring that the service can start
+reliably even when the directory is not present initially.
+
+---
+ config/init/systemd/lxc.service.in  | 1 +
+ config/init/systemd/lxc@.service.in | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/config/init/systemd/lxc.service.in b/config/init/systemd/lx=
c.service.in
+index 397a6c4d04..7142656178 100644
+--- a/config/init/systemd/lxc.service.in
++++ b/config/init/systemd/lxc.service.in
+@@ -13,6 +13,7 @@ ExecStop=3D@LIBEXECDIR@/lxc/lxc-containers stop
+ ExecReload=3D@LIBEXECDIR@/lxc/lxc-apparmor-load
+ # Environment=3DBOOTUP=3Dserial
+ # Environment=3DCONSOLETYPE=3Dserial
++StateDirectory=3Dlxc
+ Delegate=3Dyes
+=20
+ [Install]
+diff --git a/config/init/systemd/lxc@.service.in b/config/init/systemd/l=
xc@.service.in
+index 21ce64aefe..44e5b14dd2 100644
+--- a/config/init/systemd/lxc@.service.in
++++ b/config/init/systemd/lxc@.service.in
+@@ -13,6 +13,7 @@ ExecStart=3D@BINDIR@/lxc-start -F -n %i
+ ExecStop=3D@BINDIR@/lxc-stop -n %i
+ # Environment=3DBOOTUP=3Dserial
+ # Environment=3DCONSOLETYPE=3Dserial
++StateDirectory=3Dlxc
+ Delegate=3Dyes
+=20
+ [Install]
diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/l=
xc_git.bb
index 2f0e8e74..97896280 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -45,6 +45,7 @@ SRC_URI =3D "git://github.com/lxc/lxc.git;branch=3Dstab=
le-6.0;protocol=3Dhttps \
 	file://0001-download-don-t-try-compatbility-index.patch \
 	file://tests-our-init-is-not-busybox.patch \
 	file://0001-template-if-busybox-contains-init-use-it-in-containe.patch =
\
+	file://0001-enable-systemd-StateDirectory-for-lxc.patch \
 	file://dnsmasq.conf \
 	file://lxc-net \
 	"
@@ -140,7 +141,7 @@ do_install:append() {
=20
 	if "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false',=
 d)}"; then
 	    # nothing special for systemd at the moment
-	    true
+	    (cd ${D}${localstatedir}; [ -d lib/lxc ] && rmdir -v --parents lib/=
lxc)
 	else
 	    # with meson, these aren't built unless sysvinit is the enabled
 	    # init system.
--=20
2.25.1


