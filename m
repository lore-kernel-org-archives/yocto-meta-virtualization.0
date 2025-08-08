Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C1AC87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 15:40:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.25465.1754667595896702410
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Aug 2025 08:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0315a3a500=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 578AkqqT3889181
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 8 Aug 2025 15:39:55 GMT
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48bpyeu81f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Aug 2025 15:39:54 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Fri, 8 Aug 2025 08:39:53 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Fri, 8 Aug 2025 08:39:51 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [meta-virtualization][scarthgap][PATCH 1/3] podman: fix CVE-2024-9341
Date: Fri, 8 Aug 2025 21:09:38 +0530
Message-ID: <20250808153940.331823-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA4MDEyNyBTYWx0ZWRfX5cPdfsEduu+5
 znsB4GycSneOV6Z2nWyAvxsLBup+DYNRz4HCInmLzwDp7sQx+L/rcYqN2kXBgjEVHYFjIw1Oltk
 BMdnDZkAm7DxQLn7lzmW32V07BjZ+lXqENZVEBUPWUrJp0JGrtcytBTKUox5WqbP5tmbZvQNOhH
 3pqZcSN+h0DC+6qAa/9zWsNLXg5TkoXoIkKfjv3X47uF4qdnSWHEPDKtndFXnAjXwL8w5hbBMGO
 +AcJ8r1M3sI/74h0fvos3HBkjkfqV6jiCbNjsuYjpqt+FcFRqafgh4xLkgrDgotst29/r+yYFsn
 whj7ozC8zF+p40NOJKDlZQmouiKdNuvA1ywt/k+N/bPfeFFyz98iBuK2UIYUD4=
X-Proofpoint-GUID: _JlIDzrZHGjZ7RtaRu5Yn1gypG-9kThx
X-Proofpoint-ORIG-GUID: _JlIDzrZHGjZ7RtaRu5Yn1gypG-9kThx
X-Authority-Analysis: v=2.4 cv=GdwXnRXL c=1 sm=1 tr=0 ts=68961a4a cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=VZzbbjECq-QA:10 a=2OwXVqhp2XgA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=QgjwcF4FsodYxw0Va0AA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Aug 2025 15:40:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9345

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

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../podman/podman/CVE-2024-9341.patch         | 45 +++++++++++++++++++
 recipes-containers/podman/podman_git.bb       |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 recipes-containers/podman/podman/CVE-2024-9341.patch

diff --git a/recipes-containers/podman/podman/CVE-2024-9341.patch b/recipes-containers/podman/podman/CVE-2024-9341.patch
new file mode 100644
index 00000000..b5bdd9eb
--- /dev/null
+++ b/recipes-containers/podman/podman/CVE-2024-9341.patch
@@ -0,0 +1,45 @@
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
+CVE: CVE-2024-9341
+
+Upstream-Status: Backport [https://github.com/containers/common/commit/e7db06585c32e1a782c1d9aa3b71ccd708f5e23f]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ .../containers/common/pkg/subscriptions/subscriptions.go    | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/vendor/github.com/containers/common/pkg/subscriptions/subscriptions.go b/vendor/github.com/containers/common/pkg/subscriptions/subscriptions.go
+index 6845914aa2..04cf6deaa8 100644
+--- a/vendor/github.com/containers/common/pkg/subscriptions/subscriptions.go
++++ b/vendor/github.com/containers/common/pkg/subscriptions/subscriptions.go
+@@ -10,6 +10,7 @@ import (
+
+	"github.com/containers/common/pkg/umask"
+	"github.com/containers/storage/pkg/idtools"
++	securejoin "github.com/cyphar/filepath-securejoin"
+	rspec "github.com/opencontainers/runtime-spec/specs-go"
+	"github.com/opencontainers/selinux/go-selinux/label"
+	"github.com/sirupsen/logrus"
+@@ -345,7 +346,10 @@ func addFIPSModeSubscription(mounts *[]rspec.Mount, containerRunDir, mountPoint,
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
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 2018c74d..d3fa38ed 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -24,6 +24,7 @@ SRC_URI = " \
     file://run-ptest \
     file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/import/vendor/github.com/containers/storage \
     file://CVE-2025-6032.patch;patchdir=src/import \
+    file://CVE-2024-9341.patch;patchdir=src/import \
 "
 
 LICENSE = "Apache-2.0"
-- 
2.40.0


