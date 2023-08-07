Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427D0EB64DD
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 06:42:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.28754.1691390556946280133
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 06 Aug 2023 23:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=MyRzMLmQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7583208e38=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3775dKEB030645
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 7 Aug 2023 06:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=qpIkiEAlA9K3lfzIk+
	54XW68pqhImE5tSvIHS0KAwgw=; b=MyRzMLmQdN4ESelHlJ/IIpNokf0VUO+vZ/
	HKFDkw6Rucf5jc94GPpa0LRSMqFmn+YfFo6wVilq4OrkxZSe6ABzgiFURx0MMrfY
	qPgqWEJ0VmUeGADSUdbv7QFd+oVpk7lJ1yOOKfVOeqJ9xNBG7JtDdi/hqq0xY5dT
	iRKIeJ1B4TIdq7+mvi7unTGa9oXwiDlrD/lbBOubqLU2NWnQnEvtwbe6UN/5k7Jd
	SgXpttmx43I/oONuGzKX8NG9ydQwuIauQLDj4MhYWpnn2A0myKiv2JV488i1X3hb
	eZSz4YZSt2Cl+r7YYCXIl3S1u0pmnmNmz3+qOE/lol6QZGoSbR0g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s9bmx1dqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 07 Aug 2023 06:42:35 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 6 Aug 2023 23:42:33 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Sun, 6 Aug 2023 23:42:33 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [mickledore][PATCH] libvirt: fix CVE-2023-3750/CVE-2023-2700
Date: Mon, 7 Aug 2023 14:42:32 +0800
Message-ID: <20230807064232.2816765-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: kdA4Sqiv8lVwW5eA2-Sr1xDbtFivxvSC
X-Proofpoint-GUID: kdA4Sqiv8lVwW5eA2-Sr1xDbtFivxvSC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_04,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 malwarescore=0 mlxlogscore=566
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308070061
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3775dKEB030645
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 07 Aug 2023 06:42:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8166

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libvirt/libvirt/CVE-2023-2700.patch       | 54 +++++++++++++++++
 .../libvirt/libvirt/CVE-2023-3750.patch       | 59 +++++++++++++++++++
 recipes-extended/libvirt/libvirt_9.2.0.bb     |  2 +
 3 files changed, 115 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/CVE-2023-2700.patch
 create mode 100644 recipes-extended/libvirt/libvirt/CVE-2023-3750.patch

diff --git a/recipes-extended/libvirt/libvirt/CVE-2023-2700.patch b/recip=
es-extended/libvirt/libvirt/CVE-2023-2700.patch
new file mode 100644
index 00000000..4711b1be
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/CVE-2023-2700.patch
@@ -0,0 +1,54 @@
+From 1fc978bc032f53b61d00271d620d7fe1a134efe3 Mon Sep 17 00:00:00 2001
+From: Tim Shearer <TShearer@adva.com>
+Date: Mon, 1 May 2023 13:15:48 +0000
+Subject: [PATCH] virpci: Resolve leak in virPCIVirtualFunctionList clean=
up
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Repeatedly querying an SR-IOV PCI device's capabilities exposes a
+memory leak caused by a failure to free the virPCIVirtualFunction
+array within the parent struct's g_autoptr cleanup.
+
+Valgrind output after getting a single interface's XML description
+1000 times:
+
+=3D=3D325982=3D=3D 256,000 bytes in 1,000 blocks are definitely lost in =
loss record 2,634 of 2,635
+=3D=3D325982=3D=3D    at 0x4C3C096: realloc (vg_replace_malloc.c:1437)
+=3D=3D325982=3D=3D    by 0x59D952D: g_realloc (in /usr/lib64/libglib-2.0=
.so.0.5600.4)
+=3D=3D325982=3D=3D    by 0x4EE1F52: virReallocN (viralloc.c:52)
+=3D=3D325982=3D=3D    by 0x4EE1FB7: virExpandN (viralloc.c:78)
+=3D=3D325982=3D=3D    by 0x4EE219A: virInsertElementInternal (viralloc.c=
:183)
+=3D=3D325982=3D=3D    by 0x4EE23B2: virAppendElement (viralloc.c:288)
+=3D=3D325982=3D=3D    by 0x4F65D85: virPCIGetVirtualFunctionsFull (virpc=
i.c:2389)
+=3D=3D325982=3D=3D    by 0x4F65753: virPCIGetVirtualFunctions (virpci.c:=
2256)
+=3D=3D325982=3D=3D    by 0x505CB75: virNodeDeviceGetPCISRIOVCaps (node_d=
evice_conf.c:2969)
+=3D=3D325982=3D=3D    by 0x505D181: virNodeDeviceGetPCIDynamicCaps (node=
_device_conf.c:3099)
+=3D=3D325982=3D=3D    by 0x505BC4E: virNodeDeviceUpdateCaps (node_device=
_conf.c:2677)
+=3D=3D325982=3D=3D    by 0x260FCBB2: nodeDeviceGetXMLDesc (node_device_d=
river.c:355)
+
+Signed-off-by: Tim Shearer <tshearer@adva.com>
+Reviewed-by: J=C3=A1n Tomko <jtomko@redhat.com>
+
+CVE: CVE-2023-2700
+Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/6=
425a311b8ad19d6f9c0b315bf1d722551ea3585#874a1e768ade6ceb4538931cbc06248e7=
3223306]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/util/virpci.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/util/virpci.c b/src/util/virpci.c
+index 7800966..a44f70f 100644
+--- a/src/util/virpci.c
++++ b/src/util/virpci.c
+@@ -2253,6 +2253,7 @@ virPCIVirtualFunctionListFree(virPCIVirtualFunctio=
nList *list)
+         g_free(list->functions[i].ifname);
+     }
+=20
++    g_free(list->functions);
+     g_free(list);
+ }
+=20
+--=20
+2.25.1
+
diff --git a/recipes-extended/libvirt/libvirt/CVE-2023-3750.patch b/recip=
es-extended/libvirt/libvirt/CVE-2023-3750.patch
new file mode 100644
index 00000000..13ead87b
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/CVE-2023-3750.patch
@@ -0,0 +1,59 @@
+From 3fe8b15323a4666564c519f32fd4ab072c472051 Mon Sep 17 00:00:00 2001
+From: Peter Krempa <pkrempa@redhat.com>
+Date: Thu, 13 Jul 2023 16:16:37 +0200
+Subject: [PATCH] storage: Fix returning of locked objects from
+ 'virStoragePoolObjListSearch'
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE-2023-3750
+
+'virStoragePoolObjListSearch' explicitly documents that it's returning
+a pointer to a locked and ref'd pool that maches the lookup function.
+
+This was not the case as in commit 0c4b391e2a9 (released in
+libvirt-8.3.0) the code was accidentally converted to use 'VIR_LOCK_GUAR=
D'
+which auto-unlocked it when leaving the scope, even when the code was
+originally "leaking" the lock.
+
+Revert the corresponding conversion and add a comment that this function
+is intentionally leaking a locked object.
+
+Fixes: 0c4b391e2a9
+Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=3D2221851
+Signed-off-by: Peter Krempa <pkrempa@redhat.com>
+Reviewed-by: J=C3=A1n Tomko <jtomko@redhat.com>
+
+CVE: CVE-2023-3750
+Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/9=
a47442366fcf8a7b6d7422016d7bbb6764a1098]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/conf/virstorageobj.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/conf/virstorageobj.c b/src/conf/virstorageobj.c
+index 7010e97..59fa5da 100644
+--- a/src/conf/virstorageobj.c
++++ b/src/conf/virstorageobj.c
+@@ -454,11 +454,16 @@ virStoragePoolObjListSearchCb(const void *payload,
+     virStoragePoolObj *obj =3D (virStoragePoolObj *) payload;
+     struct _virStoragePoolObjListSearchData *data =3D
+         (struct _virStoragePoolObjListSearchData *)opaque;
+-    VIR_LOCK_GUARD lock =3D virObjectLockGuard(obj);
+=20
++    virObjectLock(obj);
++
++    /* If we find the matching pool object we must return while the obj=
ect is
++     * locked as the caller wants to return a locked object. */
+     if (data->searcher(obj, data->opaque))
+         return 1;
+=20
++    virObjectUnlock(obj);
++
+     return 0;
+ }
+=20
+--=20
+2.25.1
+
diff --git a/recipes-extended/libvirt/libvirt_9.2.0.bb b/recipes-extended=
/libvirt/libvirt_9.2.0.bb
index 5e704704..9f97aa11 100644
--- a/recipes-extended/libvirt/libvirt_9.2.0.bb
+++ b/recipes-extended/libvirt/libvirt_9.2.0.bb
@@ -30,6 +30,8 @@ SRC_URI =3D "http://libvirt.org/sources/libvirt-${PV}.t=
ar.xz;name=3Dlibvirt \
            file://gnutls-helper.py \
            file://0001-prevent-gendispatch.pl-generating-build-path-in-c=
ode.patch \
            file://0001-messon.build-remove-build-path-information-to-avo=
id-.patch \
+           file://CVE-2023-3750.patch \
+           file://CVE-2023-2700.patch \
           "
=20
 SRC_URI[libvirt.sha256sum] =3D "a07f501e99093ac1374888312be32182e799de17=
407ed7547d0e469fae8188c5"
--=20
2.25.1


