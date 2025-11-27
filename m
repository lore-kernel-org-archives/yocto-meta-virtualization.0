Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C73DD11183
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 12:37:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17534.1764247062874858163
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Nov 2025 04:37:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kgx9JflF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=342670ed8a=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARBiwwj223888
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Nov 2025 04:37:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=+pCptD5lb6c5AyuPQkYJ
	qwgtxZh8+sv7dn+C6RGbpZ8=; b=kgx9JflFRNoOgMSSbRXjv+OOqq0DpOGT52Lf
	93xV2Vo+AU+mUKYAADvy/2C2gy26BDKbSNrBVquzf4ofP5K4IDQTTpFcuzfbGMeR
	Xd+yH5/aFPjgpNJ97t0WU7VX6d4skRLneXIdOngn6ycsgKEMommrBGQ9aVE3J224
	YqFxDcGZFhJkVNK6IO4SD9nu4VHwZ4IdL4s+bDRi34Mj6blDH4TkC2P6BfdLvsXV
	6XYsckj06kDJtMyqZO5AW5hvHAbYks9inX69Md1FSdi+AEKHwHOZYtM6GyPkWvZH
	/ACZ+hyyPN9c4Con9y2gKgGZLvCR6RWTQRAwkqlQ0pBxleyRIA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4akdjjdedx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Nov 2025 04:37:42 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 27 Nov 2025 04:37:41 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 27 Nov 2025 04:37:39 -0800
From: <praveen.kumar@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][scarthgap][PATCH 1/1] libvirt: fix CVE-2025-13193
Date: Thu, 27 Nov 2025 18:07:34 +0530
Message-ID: <20251127123734.2467391-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA5MyBTYWx0ZWRfX93GvIDNDTeTW
 VRKx37LMJrrUSDQh9kCLiWpVgk2VIktQZ2/TszcrKRoh6ROLEZy6lBxS2W1jxrrfAAU5qULe2qa
 SxwF+T6BItxs6n7cLSOfui29mOlBuNROEY3O86Ly5/rFDgX9hlsa6ESHlMMxrdX66L8w6dBRrtm
 LayT185LYNjMYXb5gqFI5Fk6ZQXwwdZMbunQ3hQA9rxlp/sN3l3alVGvekdr4dwm7kB2tgvW3yu
 XuhaZUWIGKwLC9aVjqAvI46iHNyZzGipIYAwdsxiMXEIrcUQwkXYYfUGPRRaL280o2LqHRaY4Qc
 lki3U+Kz4KWd2OIxZumi8l+L8LM14jYqx5b2xbuic3Lw9AmcsqjJ14shCVE+0XhTkxX/kN1JcQA
 QSObSMM8dvhisrszJccxuvijpiavjQ==
X-Proofpoint-ORIG-GUID: i6l7RChE8Xpdp3zDXouv7BP_OOh9DKdt
X-Authority-Analysis: v=2.4 cv=Wq8m8Nfv c=1 sm=1 tr=0 ts=69284616 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=VZzbbjECq-QA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=p0WdMEafAAAA:8 a=xNf9USuDAAAA:8 a=SqMvC5kiAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=CX3fClYYmU8Dw6c1SfMA:9
 a=_o8VnCo6Hb5Oqlm6Mk7M:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: i6l7RChE8Xpdp3zDXouv7BP_OOh9DKdt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270093
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Nov 2025 12:37:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9462

From: Praveen Kumar <praveen.kumar@windriver.com>

A flaw was found in libvirt. External inactive snapshots for
shut-down VMs are incorrectly created as world-readable, making it
possible for unprivileged users to inspect the guest OS contents.
This results in an information disclosure vulnerability.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-13193

Upstream-patch:
https://gitlab.com/libvirt/libvirt/-/commit/a379327d8abcde8ac8d3e16fe5e4ba6f790d767a

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../libvirt/libvirt/CVE-2025-13193.patch      | 40 +++++++++++++++++++
 recipes-extended/libvirt/libvirt_10.0.0.bb    |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/CVE-2025-13193.patch

diff --git a/recipes-extended/libvirt/libvirt/CVE-2025-13193.patch b/recipes-extended/libvirt/libvirt/CVE-2025-13193.patch
new file mode 100644
index 00000000..1ce5de38
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/CVE-2025-13193.patch
@@ -0,0 +1,40 @@
+From a379327d8abcde8ac8d3e16fe5e4ba6f790d767a Mon Sep 17 00:00:00 2001
+From: Peter Krempa <pkrempa@redhat.com>
+Date: Wed, 12 Nov 2025 17:52:05 +0100
+Subject: [PATCH] qemu: snapshot: Set umask for 'qemu-img' when creating
+ external inactive snapshots
+
+External inactive snapshots are created by invoking 'qemu-img' which
+creates the file. Currently qemu-img creates image with mode 644 based
+on default umask as libvirt doesn't set any.
+
+Having a world-readable image is obviously wrong so set the umask to
+077 to have the file readable only by the owner.
+
+Resolves: https://bugs.debian.org/1120119
+
+CVE: CVE-2025-13193
+
+Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/a379327d8abcde8ac8d3e16fe5e4ba6f790d767a]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ src/qemu/qemu_snapshot.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/qemu/qemu_snapshot.c b/src/qemu/qemu_snapshot.c
+index 73ff533..9819448 100644
+--- a/src/qemu/qemu_snapshot.c
++++ b/src/qemu/qemu_snapshot.c
+@@ -233,6 +233,9 @@ qemuSnapshotCreateQcow2Files(virQEMUDriver *driver,
+                                          NULL)))
+             return -1;
+
++        /* ensure that new files are only readable by the user */
++        virCommandSetUmask(cmd, 0077);
++
+         /* adds cmd line arg: backing_fmt=format,backing_file=/path/to/backing/file */
+         virBufferAsprintf(&buf, "backing_fmt=%s,backing_file=",
+                           virStorageFileFormatTypeToString(defdisk->src->format));
+--
+2.40.0
diff --git a/recipes-extended/libvirt/libvirt_10.0.0.bb b/recipes-extended/libvirt/libvirt_10.0.0.bb
index 22193ff3..c6e6069c 100644
--- a/recipes-extended/libvirt/libvirt_10.0.0.bb
+++ b/recipes-extended/libvirt/libvirt_10.0.0.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://CVE-2024-1441.patch \
            file://CVE-2024-2494.patch \
            file://CVE-2024-4418.patch \
+           file://CVE-2025-13193.patch \
           "
 
 SRC_URI[libvirt.sha256sum] = "8ba2e72ec8bdd2418554a1474c42c35704c30174b7611eaf9a16544b71bcf00a"
-- 
2.40.0


