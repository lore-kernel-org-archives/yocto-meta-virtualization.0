Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4939C25B48
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 02:22:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.35577.1698200566059639164
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 19:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sLNkdf9n;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=86627674a5=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39P1t1gH005598;
	Tue, 24 Oct 2023 19:22:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=regP3
	iBZ4svBIZI6aqCfSIEhusU95fBVLBQSG3A5zSs=; b=sLNkdf9n/yO8bU9j0VY6v
	oSs7m+IRYzuB5nDwchvak/022EyienW3rOI1UGS+kfqS6yxfmhzy0gqNobipuC+/
	xsaUTow+eEeNbURJiIEVlkEZA96C9q3kKp+NHwT/bEv21IObX5GT+F1fp7ewaK0G
	gsiSZmRtuSgbTDe6TIJHhrUVdW4hohNitM6XQtfsBpq+kZAWop5QA1J9Ara9oOLr
	RvONbK3kPGWOR12DnOG6SeAYEop8n5nlFXpoJE9iTVPzAZzz6Ri59eXXKLHPjsNm
	i/EYTmpDhyizbhC/KSnD7kUTNfkeXSRClp0PUpDTPcYP1cMiszFREwQwQPcBdh3E
	g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tv9x03uh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 24 Oct 2023 19:22:44 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 24 Oct 2023 19:22:44 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Tue, 24 Oct 2023 19:22:43 -0700
From: <kai.kang@windriver.com>
To: <bruce.ashfield@gmail.com>
CC: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH v2 1/2] umoci & buildah & podman-tui: mark incompatible with mips
Date: Wed, 25 Oct 2023 10:22:39 +0800
Message-ID: <20231025022240.1341381-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: h7uvKPTQlwPi1y4dj_giPLbrInz92qCE
X-Proofpoint-GUID: h7uvKPTQlwPi1y4dj_giPLbrInz92qCE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-25_01,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=646
 spamscore=0 phishscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310170000 definitions=main-2310250018
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Oct 2023 02:22:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8395

From: Kai Kang <kai.kang@windriver.com>

Since the runtime dependency skopeo has been marked incompatible with
mips, mark for umoci accordingly.

buildah and podman-tui rdepends on podman which has been marked
incompatible with mips, so mark for them too.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-containers/buildah/buildah_git.bb       | 2 ++
 recipes-containers/podman-tui/podman-tui_git.bb | 2 ++
 recipes-containers/umoci/umoci_git.bb           | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
index 5155cbb1..ef1feead 100644
--- a/recipes-containers/buildah/buildah_git.bb
+++ b/recipes-containers/buildah/buildah_git.bb
@@ -20,6 +20,8 @@ inherit pkgconfig
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "seccomp ipv6"
 
+COMPATIBLE_HOST = "^(?!mips).*"
+
 GO_IMPORT = "github.com/containers/buildah"
 GO_INSTALL = "${GO_IMPORT}"
 GO_WORKDIR = "${GO_INSTALL}"
diff --git a/recipes-containers/podman-tui/podman-tui_git.bb b/recipes-containers/podman-tui/podman-tui_git.bb
index 1a40d0ec..0b1924f9 100644
--- a/recipes-containers/podman-tui/podman-tui_git.bb
+++ b/recipes-containers/podman-tui/podman-tui_git.bb
@@ -41,6 +41,8 @@ PODMAN_PKG = "github.com/containers/podman-tui"
 inherit go goarch
 inherit pkgconfig
 
+COMPATIBLE_HOST = "^(?!mips).*"
+
 do_configure[noexec] = "1"
 
 BUILD_TAGS ?= "exclude_graphdriver_btrfs exclude_graphdriver_devicemapper"
diff --git a/recipes-containers/umoci/umoci_git.bb b/recipes-containers/umoci/umoci_git.bb
index feaf6dff..62b42b8e 100644
--- a/recipes-containers/umoci/umoci_git.bb
+++ b/recipes-containers/umoci/umoci_git.bb
@@ -17,6 +17,8 @@ GO_IMPORT = "github.com/opencontainers/umoci"
 inherit goarch
 inherit go
 
+COMPATIBLE_HOST = "^(?!mips).*"
+
 # This disables seccomp and apparmor, which are on by default in the
 # go package. 
 EXTRA_OEMAKE="BUILDTAGS=''"
-- 
2.34.1


