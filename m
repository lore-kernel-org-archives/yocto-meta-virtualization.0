Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE1EC36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 19:50:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.32341.1743018625413895313
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 12:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=518085a955=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QClTMh019391
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Mar 2025 12:50:25 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hvqkcsf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Mar 2025 12:50:24 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 26 Mar 2025 12:50:24 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 26 Mar 2025 12:50:22 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [meta-virtualization][scarthgap][PATCH 1/3] docker-moby: Fix CVE-2024-36620
Date: Wed, 26 Mar 2025 19:50:07 +0000
Message-ID: <20250326195009.757247-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=XNkwSRhE c=1 sm=1 tr=0 ts=67e45a80 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VZzbbjECq-QA:10 a=Vs1iUdzkB0EA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=xVi6YFOOr_-xf1325nwA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: k97cHpA7EFxW0PXfsplMddtFOTjp8eOV
X-Proofpoint-ORIG-GUID: k97cHpA7EFxW0PXfsplMddtFOTjp8eOV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxscore=0 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503260121
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Mar 2025 19:50:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9174

moby v25.0.0 - v26.0.2 is vulnerable to NULL Pointer Dereference
via daemon/images/image_history.go.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-36620

Upstream-patch:
https://github.com/moby/moby/commit/ab570ab3d62038b3d26f96a9bb585d0b6095b9b4

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 recipes-containers/docker/docker-moby_git.bb  |  1 +
 .../docker/files/CVE-2024-36620.patch         | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 recipes-containers/docker/files/CVE-2024-36620.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 0abb0b3f..a1879ed2 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -56,6 +56,7 @@ SRC_URI = "\
 	file://0001-libnetwork-use-GO-instead-of-go.patch \
         file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
         file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
+        file://CVE-2024-36620.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2024-36620.patch b/recipes-containers/docker/files/CVE-2024-36620.patch
new file mode 100644
index 00000000..7bce4137
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2024-36620.patch
@@ -0,0 +1,40 @@
+From ab570ab3d62038b3d26f96a9bb585d0b6095b9b4 Mon Sep 17 00:00:00 2001
+From: Christopher Petito <47751006+krissetto@users.noreply.github.com>
+Date: Fri, 19 Apr 2024 10:44:30 +0000
+Subject: [PATCH] nil dereference fix on image history Created value
+
+Issue was caused by the changes here https://github.com/moby/moby/pull/45504
+First released in v25.0.0-beta.1
+
+CVE: CVE-2024-36620
+
+Upstream-Status:
+Backport [https://github.com/moby/moby/commit/ab570ab3d62038b3d26f96a9bb585d0b6095b9b4]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ daemon/images/image_history.go | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/daemon/images/image_history.go b/daemon/images/image_history.go
+index dcf7a906aa..e5adda8639 100644
+--- a/daemon/images/image_history.go
++++ b/daemon/images/image_history.go
+@@ -41,10 +41,14 @@ func (i *ImageService) ImageHistory(ctx context.Context, name string) ([]*image.
+			layer.ReleaseAndLog(i.layerStore, l)
+			layerCounter++
+		}
++		var created int64
++		if h.Created != nil {
++			created = h.Created.Unix()
++		}
+
+		history = append([]*image.HistoryResponseItem{{
+			ID:        "<missing>",
+-			Created:   h.Created.Unix(),
++			Created:   created,
+			CreatedBy: h.CreatedBy,
+			Comment:   h.Comment,
+			Size:      layerSize,
+--
+2.40.0
-- 
2.40.0


