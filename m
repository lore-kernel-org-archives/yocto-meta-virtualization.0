Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F72CA0EE8
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 09:58:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.19063.1758103122935843935
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 02:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hg7ou3gE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1355131d5c=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58H7S1Sw4017736
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Sep 2025 09:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=umzy7V9/+etl4cCFzH5qDXEBBe+YxCUxG2ywJDGbhRU=; b=hg7ou3gESbXD
	U7W3JyjJrEyuLtWLrDly4DvWavRuoSy6whcldwrJACuh6g4DIJCNe+06pys3WDp/
	DsV3tfw3s7fgAQMSZevLL7CTCxD8skcb9Qpq07sUzVSK9WNtptKjZeMAzG8RPBRM
	qCkWjY/+jpwe2fadeY6v2htHZTr4oHwcOoCeDOeK0ieABoKDy0eV2PMePKdHtkg2
	fb/JlvjRzkQ2efN+YWeRPRjELzLJM0yNetlQ8bQW+b37bYorSEGJX3ngUKTU3rhN
	ZZ7zL4b3MOSVLcKY+rgL9wHJrLVdn5GQXNAdOn9pB31WHdHgeLzSSvIS8PdJNSt+
	cCRQAMxmPQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwsrfnr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Sep 2025 09:58:41 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 17 Sep 2025 02:58:38 -0700
From: yurade <yogita.urade@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][kirkstone][PATCH 2/2] buildah: fix CVE-2024-9341
Date: Wed, 17 Sep 2025 15:27:58 +0530
Message-ID: <20250917095758.1036133-2-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250917095758.1036133-1-yogita.urade@windriver.com>
References: <20250917095758.1036133-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-GUID: T7hPQWuzPa7tO3bJ9w5RC0M9eOymY8p4
X-Proofpoint-ORIG-GUID: T7hPQWuzPa7tO3bJ9w5RC0M9eOymY8p4
X-Authority-Analysis: v=2.4 cv=C5zpyRP+ c=1 sm=1 tr=0 ts=68ca8651 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Ljcx4Z80PikA:10 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=8074h69RoNtoK4qn5FcA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDA5NyBTYWx0ZWRfXzKrkwkHK9QpM
 jziuDSatz/cV4bAeaZ4fWWv5tjdAKvXD547HhaIeDaKyGUsn5OuuEJejX9IS6sWAt/VGmnOI2FN
 QHxSMBN4Rlpl5Exi+77TRuUjojcOdkryy/Bc09W6swuma2xcOaO1CCfIyO3gLAns3Zolb5RiRTC
 3nOPVz5ziOebZhlcy9ShR9Lq5aA3asg3SP62IbclagfAVCCzFys0HMIduO4aASezQ2GwpjnCm/6
 8JPvSoPoX2tlJ7cHHM66KcyBTEZhzqbYvU2gh6Mg/ATBMzjNNVeqigMkK+6aHeMmQrncX5q6epc
 mddtNWPhNaPgDQpKmG+V91v0y5iGZA405WGgO+/GGYi0+jU60aO43laqzLNRXM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Sep 2025 09:58:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9397

From: Yogita Urade <yogita.urade@windriver.com>

A flaw was found in Go. When FIPS mode is enabled on a system,
container runtimes may incorrectly handle certain file paths due to
improper validation in the containers/common Go library. This flaw
allows an attacker to exploit symbolic links and trick the system
into mounting sensitive host directories inside a container. This
issue also allows attackers to access critical host files, bypassing
the intended isolation between containers and the host system.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-9341

Upstream-patch:
https://github.com/containers/common/commit/e7db06585c32e1a782c1d9aa3b71ccd708f5e23f

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 recipes-containers/buildah/buildah_git.bb     |  1 +
 .../buildah/files/CVE-2024-9341.patch         | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 recipes-containers/buildah/files/CVE-2024-9341.patch

diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
index 10597d8a..9f0d7635 100644
--- a/recipes-containers/buildah/buildah_git.bb
+++ b/recipes-containers/buildah/buildah_git.bb
@@ -28,6 +28,7 @@ GOBUILDFLAGS += "-mod vendor"
 SRC_URI = " \
     git://github.com/containers/buildah;branch=release-1.26;name=buildah;protocol=https \
     file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/github.com/containers/buildah/vendor/github.com/containers/storage \
+    file://CVE-2024-9341.patch;patchdir=src/github.com/containers/buildah \
     "
 
 DEPENDS = "libdevmapper btrfs-tools gpgme"
diff --git a/recipes-containers/buildah/files/CVE-2024-9341.patch b/recipes-containers/buildah/files/CVE-2024-9341.patch
new file mode 100644
index 00000000..53728d6c
--- /dev/null
+++ b/recipes-containers/buildah/files/CVE-2024-9341.patch
@@ -0,0 +1,46 @@
+From e7db06585c32e1a782c1d9aa3b71ccd708f5e23f Mon Sep 17 00:00:00 2001
+From: Paul Holzinger <pholzing@redhat.com>
+Date: Fri, 27 Sep 2024 14:01:56 +0200
+Subject: [PATCH] pkg/subscriptions: use securejoin for the container path
+
+If we join a path from the container image we must always use securejoin
+to prevent us from following a symlink onto the host.
+
+Fixes CVE-2024-9341
+
+Signed-off-by: Paul Holzinger <pholzing@redhat.com>
+
+CVE: CVE-2024-9341
+Upstream-status: Backport [https://github.com/containers/common/commit/e7db06585c32e1a782c1d9aa3b71ccd708f5e23f]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ .../containers/common/pkg/subscriptions/subscriptions.go    | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/vendor/github.com/containers/common/pkg/subscriptions/subscriptions.go b/vendor/github.com/containers/common/pkg/subscriptions/subscriptions.go
+index ff82b5a39..99d80afeb 100644
+--- a/vendor/github.com/containers/common/pkg/subscriptions/subscriptions.go
++++ b/vendor/github.com/containers/common/pkg/subscriptions/subscriptions.go
+@@ -11,6 +11,7 @@ import (
+
+	"github.com/containers/common/pkg/umask"
+	"github.com/containers/storage/pkg/idtools"
++	securejoin "github.com/cyphar/filepath-securejoin"
+	rspec "github.com/opencontainers/runtime-spec/specs-go"
+	"github.com/opencontainers/selinux/go-selinux/label"
+	"github.com/sirupsen/logrus"
+@@ -342,7 +343,10 @@ func addFIPSModeSubscription(mounts *[]rspec.Mount, containerRunDir, mountPoint,
+
+	srcBackendDir := "/usr/share/crypto-policies/back-ends/FIPS"
+	destDir := "/etc/crypto-policies/back-ends"
+-	srcOnHost := filepath.Join(mountPoint, srcBackendDir)
++	srcOnHost, err := securejoin.SecureJoin(mountPoint, srcBackendDir)
++	if err != nil {
++		return fmt.Errorf("resolve %s in the container: %w", srcBackendDir, err)
++	}
+	if _, err := os.Stat(srcOnHost); err != nil {
+		if errors.Is(err, os.ErrNotExist) {
+			return nil
+--
+2.40.0
-- 
2.40.0


