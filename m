Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594D0D116F3
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 08:24:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10185.1764750267641720522
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Dec 2025 00:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=W8xnXnPo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=443253538a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B34tl4T2510471
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 3 Dec 2025 08:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=WTiXIBQGjeAqH6JHTEM2oLGkpW6IYcnv6mtt57F+pc8=; b=W8xnXnPo9/aG
	EQAHBh+afO3ToDx9e4oHpt5zjMueI7TpYY/XwmOblN5E2EiAVHOwbnXsoL1/ywAZ
	uLNtbZOI+LzF2fUu1pfx5r2M4FT3jPBWn2iGjZyIp96CfUkxRMN9q2dK8QKx4sul
	uyU6VU4wQzS2yu/yY8W8wcCdwiLfv/zvdW2As4juNcP02Jq+CtbfUe672ON1Xv9W
	hA36EsxzQMZ+t6pRiQNdLBZ7q8+54KSxyD7CWLeD+RUGhrfPUrZxQUbDjjbzuf1f
	kyfoZAGO12/kTFMesUozhnrh9pYO1MbRh/9JKTbH2Hz80KIlm/fzrbXCc6RuT44W
	eQ6gQmvbLA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt6ckf6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Dec 2025 08:24:26 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 3 Dec 2025 00:24:25 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 3 Dec 2025 00:24:25 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 2/2] libvirt: fix build failure with libxml2 2.15.1
Date: Wed, 3 Dec 2025 16:24:23 +0800
Message-ID: <20251203082423.2747388-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251203082423.2747388-1-hongxu.jia@windriver.com>
References: <20251203082423.2747388-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA2NSBTYWx0ZWRfX4G4zbEA1ii19
 TsZpEkmQsOFkGAOoEQ1R/YFPF0pmqKR3tcye921GixM8sX7YARObHYpmMoMVeGjcKtRWUpF2Iso
 aMnLmO8sES/O0zyH6+y5ujqdZj5/We3jWZeTjLKV0A3wqVY1eSKstmi2I+VcNANYFvFQWWUJkSt
 KiyFVtNCrokGACufuyOOBaWYaQSTX/Vm9W82wo2YCnBV2t81AQEJoS5P9namPKSLJRrfaRuqq6P
 QkI/Gs8gRtQUJzuRe/7dx+2y5Ta4F3ybKTYtXHf0W3CFvz4w+bG20fDY9oaVXgbrJ2shUEMh53A
 zILj95PQJy8IALyJook28mIMmQ70YQ5k1AMv+y2RUU0voxBr61GNN5BsC8rCoHfE77mMyYkecQ4
 OUP9AgCjsVPWIZUDIFtMg5R24dLC6w==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692ff3ba cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8
 a=GHR8O2WEAAAA:20 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=lSnHl_kGuXSZzhSkeJ4A:9 a=m9p5bXcFLgAA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: mP5XK24LFfkrFyhuU5qVL-upgxI5xtdE
X-Proofpoint-GUID: mP5XK24LFfkrFyhuU5qVL-upgxI5xtdE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030065
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Dec 2025 08:24:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9476

Don't modify deprecated APIs, it is now deprecated by libxml2.
Backport fix from upstream [1][2] to Yocto

[1] https://github.com/libvirt/libvirt/commit/f307c7dc0cdb5880fe75a4b0dab3cc76dc7b047e
[2] https://github.com/libvirt/libvirt/commit/05baaddb3fc08010bccf2ee73bc465d288205901

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...onfSaveVboxFile-Don-t-modify-depreca.patch | 46 ++++++++++++
 ...data-Don-t-modify-deprecated-xmlInde.patch | 74 +++++++++++++++++++
 recipes-extended/libvirt/libvirt_git.bb       |  2 +
 3 files changed, 122 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/0001-virVBoxSnapshotConfSaveVboxFile-Don-t-modify-depreca.patch
 create mode 100644 recipes-extended/libvirt/libvirt/0001-virXMLFormatMetadata-Don-t-modify-deprecated-xmlInde.patch

diff --git a/recipes-extended/libvirt/libvirt/0001-virVBoxSnapshotConfSaveVboxFile-Don-t-modify-depreca.patch b/recipes-extended/libvirt/libvirt/0001-virVBoxSnapshotConfSaveVboxFile-Don-t-modify-depreca.patch
new file mode 100644
index 00000000..4225e77c
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0001-virVBoxSnapshotConfSaveVboxFile-Don-t-modify-depreca.patch
@@ -0,0 +1,46 @@
+From f5124080153439b8fdca99f9ae20b48216a4dc89 Mon Sep 17 00:00:00 2001
+From: Peter Krempa <pkrempa@redhat.com>
+Date: Mon, 10 Nov 2025 16:54:32 +0100
+Subject: [PATCH] virVBoxSnapshotConfSaveVboxFile: Don't modify deprecated
+ 'xmlIndentTreeOutput'
+
+'xmlIndentTreeOutput' is now deprecated by libxml2.
+
+The default value set by libxml2 is '1', and the vbox driver resides
+only inside the standalone daemon where the value will not be changed by
+us thus there's no observable change in behaviour.
+
+Signed-off-by: Peter Krempa <pkrempa@redhat.com>
+
+Upstream-Status: Backport [https://github.com/libvirt/libvirt/commit/f307c7dc0cdb5880fe75a4b0dab3cc76dc7b047e]
+Signed-off-by: Hongxu Jia <hongxu.jia@eng.windriver.com>
+---
+ src/vbox/vbox_snapshot_conf.c | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/src/vbox/vbox_snapshot_conf.c b/src/vbox/vbox_snapshot_conf.c
+index b424648368..ff81cd0062 100644
+--- a/src/vbox/vbox_snapshot_conf.c
++++ b/src/vbox/vbox_snapshot_conf.c
+@@ -943,9 +943,6 @@ virVBoxSnapshotConfSaveVboxFile(virVBoxSnapshotConfMachine *machine,
+     g_auto(GStrv) secondRegex = NULL;
+     int secondRegexResult = 0;
+     const int parseFlags = XML_PARSE_NONET | XML_PARSE_NOBLANKS;
+-    int oldIndentTreeOutput = xmlIndentTreeOutput;
+-
+-    xmlIndentTreeOutput = 1;
+ 
+     if (machine == NULL) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s",
+@@ -1127,8 +1124,6 @@ virVBoxSnapshotConfSaveVboxFile(virVBoxSnapshotConfMachine *machine,
+     ret = 0;
+ 
+  cleanup:
+-    xmlIndentTreeOutput = oldIndentTreeOutput;
+-
+     VIR_FREE(currentSnapshot);
+     VIR_FREE(timeStamp);
+ 
+-- 
+2.49.0
+
diff --git a/recipes-extended/libvirt/libvirt/0001-virXMLFormatMetadata-Don-t-modify-deprecated-xmlInde.patch b/recipes-extended/libvirt/libvirt/0001-virXMLFormatMetadata-Don-t-modify-deprecated-xmlInde.patch
new file mode 100644
index 00000000..068f7f9b
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0001-virXMLFormatMetadata-Don-t-modify-deprecated-xmlInde.patch
@@ -0,0 +1,74 @@
+From 04e7702131222b96eed09e9ba688f8e669d1756f Mon Sep 17 00:00:00 2001
+From: Peter Krempa <pkrempa@redhat.com>
+Date: Mon, 10 Nov 2025 16:52:45 +0100
+Subject: [PATCH] virXMLFormatMetadata: Don't modify deprecated
+ 'xmlIndentTreeOutput'
+
+'libxml2' deprecated the 'xmlIndentTreeOutput' thread-local variable as
+well as the 'xmlThrDefIndentTreeOutput' function for setting the global
+default, which we use in our code for formatting the metadata sub-XML.
+
+'libxml2' also for now doesn't provide a way to set target indentation
+level in 'xmlSaveCtxt' which would allow us to use the modern output
+APIs, we can't replace our use of 'xmlDumpNode'. (See
+https://gitlab.gnome.org/GNOME/libxml2/-/issues/989 )
+
+Since the indentation is enabled by default in libxml2 and our most
+commonly used code which calls xmlDumpNode lives in a standalone
+process, where we don't override the setting, just removing the override
+will result in identical behaviour.
+
+For the use cases which do live in a process we don't fully control and
+thus the default could have been overriden, the result would be that the
+<metadata> element would be un-indented, but that is still valid XML.
+
+Thus to fix the deprecated use just stop setting 'xmlIndentTreeOutput'.
+
+Closes: https://gitlab.com/libvirt/libvirt/-/issues/816
+Signed-off-by: Peter Krempa <pkrempa@redhat.com>
+
+Upstream-Status: Backport [https://github.com/libvirt/libvirt/commit/05baaddb3fc08010bccf2ee73bc465d288205901]
+Signed-off-by: Hongxu Jia <hongxu.jia@eng.windriver.com>
+---
+ src/util/virxml.c | 10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/src/util/virxml.c b/src/util/virxml.c
+index 44f11accf3..77c7b5a8f4 100644
+--- a/src/util/virxml.c
++++ b/src/util/virxml.c
+@@ -1920,23 +1920,14 @@ virXMLFormatMetadata(virBuffer *buf,
+ {
+     g_autoptr(xmlBuffer) xmlbuf = NULL;
+     const char *xmlbufContent = NULL;
+-    int oldIndentTreeOutput = xmlIndentTreeOutput;
+ 
+     if (!metadata)
+         return 0;
+ 
+-    /* Indentation on output requires that we previously set
+-     * xmlKeepBlanksDefault to 0 when parsing; also, libxml does 2
+-     * spaces per level of indentation of intermediate elements,
+-     * but no leading indentation before the starting element.
+-     * Thankfully, libxml maps what looks like globals into
+-     * thread-local uses, so we are thread-safe.  */
+-    xmlIndentTreeOutput = 1;
+     xmlbuf = virXMLBufferCreate();
+ 
+     if (xmlNodeDump(xmlbuf, metadata->doc, metadata,
+                     virBufferGetIndent(buf) / 2, 1) < 0) {
+-        xmlIndentTreeOutput = oldIndentTreeOutput;
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s",
+                        _("Unable to format metadata element"));
+         return -1;
+@@ -1948,7 +1939,6 @@ virXMLFormatMetadata(virBuffer *buf,
+     virSkipSpaces(&xmlbufContent);
+ 
+     virBufferAsprintf(buf, "%s\n", xmlbufContent);
+-    xmlIndentTreeOutput = oldIndentTreeOutput;
+ 
+     return 0;
+ }
+-- 
+2.49.0
+
diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
index 681ceade..abde7b9e 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -41,6 +41,8 @@ SRC_URI = "gitsm://github.com/libvirt/libvirt.git;name=libvirt;protocol=https;br
            file://0001-meson.build-clear-abs_top_builddir-to-avoid-QA-warni.patch \
            file://0001-tests-meson-clear-absolute-directory-paths.patch \
            file://0001-qemu_nbdkit.c-use-llu-to-print-time_t.patch \
+           file://0001-virVBoxSnapshotConfSaveVboxFile-Don-t-modify-depreca.patch \
+           file://0001-virXMLFormatMetadata-Don-t-modify-deprecated-xmlInde.patch \
           "
 
 inherit meson gettext update-rc.d pkgconfig systemd useradd perlnative
-- 
2.34.1


