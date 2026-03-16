Return-Path: <youenn.lejeune@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F676F4645A
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 12:08:13 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48687.1773662884757848131
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 05:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=BVkC3h3+;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: youenn.lejeune@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 9C3553D81835
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Mar 2026 08:08:03 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id jGyy3Xx3DfKj; Mon, 16 Mar 2026 08:08:02 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 8643D3D8180B;
	Mon, 16 Mar 2026 08:08:02 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 8643D3D8180B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1773662882; bh=kkphE2NpmmVn0hnn035hDwUz79pfje+KcVLACkBdcqE=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=BVkC3h3++TRDsZkfOdoLzH1GW9khFkzjPiXeU84MKCmWcWXdbzzTIEE14cd0aFlN6
	 3RnHRsQKjrHjxpta9jd1FqO1ch5ex8aT2mpb1+Kd4LPajXjUi7B8Jgi/Jc4Z6k/vWG
	 B4CpGazS0+YrZxjLrN4zhbJuie6SBNHSbFIWP9mlzH7VL0xms3BdEW9nSimEi6Vfng
	 C7UzYSYudoHDQA+Bsdp3OPduTDKvwRcnrQw8XMv8YAwcDymG9fHWBAv9EvMJnma9o1
	 CUdsx1M9RcX49ZIfqiwDO8Cq0P6L47X1sG/3dPR53hFDUAAniedFhfJHfGnM7+dfGk
	 XjhPJ1oXhmkRQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Vd-5yMdCOKLD; Mon, 16 Mar 2026 08:08:02 -0400 (EDT)
Received: from gerard.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id D2B753D81806;
	Mon, 16 Mar 2026 08:08:01 -0400 (EDT)
From: Youenn Le Jeune <youenn.lejeune@savoirfairelinux.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Youenn Le Jeune <youenn.lejeune@savoirfairelinux.com>,
	Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>,
	Erwann Roussy <erwann.roussy@savoirfairelinux.com>
Subject: [meta-virtualization][PATCH] ceph, libvirt, openvswitch: marked some CVEs as patched
Date: Mon, 16 Mar 2026 13:05:02 +0100
Message-Id: <20260316120501.1216022-1-youenn.lejeune@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Mar 2026 12:08:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9662

For ceph, libvirt and openvswitch, 9 CVEs were marked as "unpatched"
whereas they have been patched long ago compared to the versions of
the recipes, because the NVD database does not contain patched version
for those CVEs.

Reviewed-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfai=
relinux.com>
Reviewed-by: Erwann Roussy <erwann.roussy@savoirfairelinux.com>
Signed-off-by: Youenn Le Jeune <youenn.lejeune@savoirfairelinux.com>
---
 recipes-extended/ceph/ceph_git.bb                 | 3 +++
 recipes-extended/libvirt/libvirt_git.bb           | 7 +++++++
 recipes-networking/openvswitch/openvswitch_git.bb | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/recipes-extended/ceph/ceph_git.bb b/recipes-extended/ceph/ce=
ph_git.bb
index 2cf1c88a..728a420b 100644
--- a/recipes-extended/ceph/ceph_git.bb
+++ b/recipes-extended/ceph/ceph_git.bb
@@ -192,3 +192,6 @@ INSANE_SKIP:${PN}-dbg +=3D "buildpaths"
 CCACHE_DISABLE =3D "1"
=20
 CVE_PRODUCT =3D "ceph ceph_storage ceph_storage_mon ceph_storage_osd"
+
+CVE_STATUS[CVE-2017-7519] =3D "fixed-version: Fixed in 12.1.2, NVD track=
s this as version-less vulnerability"
+CVE_STATUS[CVE-2020-1700] =3D "fixed-version: Fixed in 15.1.1, NVD track=
s this as version-less vulnerability"
diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/l=
ibvirt/libvirt_git.bb
index 63f882ee..8462c10c 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -179,6 +179,13 @@ PACKAGECONFIG[libpcap] =3D "-Dlibpcap=3Denabled, -Dl=
ibpcap=3Ddisabled,libpcap,libpcap"
 PACKAGECONFIG[numad] =3D "-Dnumad=3Denabled, -Dnumad=3Ddisabled,"
 PACKAGECONFIG[nftables] =3D ""
=20
+CVE_STATUS[CVE-2014-8135] =3D "fixed-version: Fixed in 1.2.11, NVD track=
s this as version-less vulnerability"
+CVE_STATUS[CVE-2014-8136] =3D "fixed-version: Fixed in 1.2.11, NVD track=
s this as version-less vulnerability"
+CVE_STATUS[CVE-2015-5313] =3D "fixed-version: Fixed in 1.3.1, NVD tracks=
 this as version-less vulnerability"
+CVE_STATUS[CVE-2018-5748] =3D "fixed-version: Fixed in 4.0.0, NVD tracks=
 this as version-less vulnerability"
+CVE_STATUS[CVE-2018-6764] =3D "fixed-version: Fixed in 4.1.0, NVD tracks=
 this as version-less vulnerability"
+CVE_STATUS[CVE-2023-3750] =3D "fixed-version: Fixed in 9.6.0, NVD tracks=
 this as version-less vulnerability"
+
 # Enable the Python tool support
 require libvirt-python.inc
=20
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-=
networking/openvswitch/openvswitch_git.bb
index 4d6520e0..61c5e39c 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -35,6 +35,8 @@ PACKAGECONFIG[dpdk] =3D "--with-dpdk=3Dshared,,dpdk,dpd=
k"
 PACKAGECONFIG[libcap-ng] =3D "--enable-libcapng,--disable-libcapng,libca=
p-ng,"
 PACKAGECONFIG[ssl] =3D ",--disable-ssl,openssl,"
=20
+CVE_STATUS[CVE-2023-5366] =3D "fixed-version: Fixed in 3.2.2, NVD tracks=
 this as version-less vulnerability"
+
 # Don't compile kernel modules by default since it heavily depends on
 # kernel version. Use the in-kernel module for now.
 # distro layers can enable with EXTRA_OECONF_pn_openvswitch +=3D ""
--=20
2.34.1


