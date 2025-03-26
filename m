Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE357C36010
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 19:50:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.32346.1743018632874888362
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 12:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=518085a955=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QAsLcC015772
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Mar 2025 12:50:32 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hvqkcsfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Mar 2025 12:50:31 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 26 Mar 2025 12:50:31 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 26 Mar 2025 12:50:29 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [meta-virtualization][scarthgap][PATCH 2/3] docker-moby: Fix CVE-2024-36621
Date: Wed, 26 Mar 2025 19:50:08 +0000
Message-ID: <20250326195009.757247-2-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250326195009.757247-1-praveen.kumar@windriver.com>
References: <20250326195009.757247-1-praveen.kumar@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=XNkwSRhE c=1 sm=1 tr=0 ts=67e45a88 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VZzbbjECq-QA:10 a=Vs1iUdzkB0EA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=2XnR9ZHomxiT4kkCWhkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: EyKkXKe2tiFcdjd3-jNTsQQQ1MltNZ2T
X-Proofpoint-ORIG-GUID: EyKkXKe2tiFcdjd3-jNTsQQQ1MltNZ2T
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
 <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Mar 2025 19:50:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9175

moby v25.0.5 is affected by a Race Condition in
builder/builder-next/adapters/snapshot/layer.go. The vulnerability could
be used to trigger concurrent builds that call the EnsureLayer function
resulting in resource leaks/exhaustion.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-36621

Upstream-patch:
https://github.com/moby/moby/commit/37545cc644344dcb576cba67eb7b6f51a463d31e

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 recipes-containers/docker/docker-moby_git.bb  |  1 +
 .../docker/files/CVE-2024-36621.patch         | 83 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 recipes-containers/docker/files/CVE-2024-36621.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index a1879ed2..d274b002 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -57,6 +57,7 @@ SRC_URI = "\
         file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
         file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
         file://CVE-2024-36620.patch;patchdir=src/import \
+        file://CVE-2024-36621.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2024-36621.patch b/recipes-containers/docker/files/CVE-2024-36621.patch
new file mode 100644
index 00000000..a6c06ef2
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2024-36621.patch
@@ -0,0 +1,83 @@
+From 37545cc644344dcb576cba67eb7b6f51a463d31e Mon Sep 17 00:00:00 2001
+From: Tonis Tiigi <tonistiigi@gmail.com>
+Date: Wed, 6 Mar 2024 23:11:32 -0800
+Subject: [PATCH] builder-next: fix missing lock in ensurelayer
+
+When this was called concurrently from the moby image
+exporter there could be a data race where a layer was
+written to the refs map when it was already there.
+
+In that case the reference count got mixed up and on
+release only one of these layers was actually released.
+
+CVE: CVE-2024-36621
+
+Upstream-Status:
+Backport [https://github.com/moby/moby/commit/37545cc644344dcb576cba67eb7b6f51a463d31e]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ .../builder-next/adapters/snapshot/layer.go   |  3 +++
+ .../adapters/snapshot/snapshot.go             | 19 +++++++++++--------
+ 2 files changed, 14 insertions(+), 8 deletions(-)
+
+diff --git a/builder/builder-next/adapters/snapshot/layer.go b/builder/builder-next/adapters/snapshot/layer.go
+index 73120ea70b..fc83058339 100644
+--- a/builder/builder-next/adapters/snapshot/layer.go
++++ b/builder/builder-next/adapters/snapshot/layer.go
+@@ -22,6 +22,9 @@ func (s *snapshotter) GetDiffIDs(ctx context.Context, key string) ([]layer.DiffI
+ }
+
+ func (s *snapshotter) EnsureLayer(ctx context.Context, key string) ([]layer.DiffID, error) {
++	s.layerCreateLocker.Lock(key)
++	defer s.layerCreateLocker.Unlock(key)
++
+	diffIDs, err := s.GetDiffIDs(ctx, key)
+	if err != nil {
+		return nil, err
+diff --git a/builder/builder-next/adapters/snapshot/snapshot.go b/builder/builder-next/adapters/snapshot/snapshot.go
+index a0d28ad984..510ffefb49 100644
+--- a/builder/builder-next/adapters/snapshot/snapshot.go
++++ b/builder/builder-next/adapters/snapshot/snapshot.go
+@@ -17,6 +17,7 @@ import (
+	"github.com/moby/buildkit/identity"
+	"github.com/moby/buildkit/snapshot"
+	"github.com/moby/buildkit/util/leaseutil"
++	"github.com/moby/locker"
+	"github.com/opencontainers/go-digest"
+	"github.com/pkg/errors"
+	bolt "go.etcd.io/bbolt"
+@@ -51,10 +52,11 @@ type checksumCalculator interface {
+ type snapshotter struct {
+	opt Opt
+
+-	refs map[string]layer.Layer
+-	db   *bolt.DB
+-	mu   sync.Mutex
+-	reg  graphIDRegistrar
++	refs              map[string]layer.Layer
++	db                *bolt.DB
++	mu                sync.Mutex
++	reg               graphIDRegistrar
++	layerCreateLocker *locker.Locker
+ }
+
+ // NewSnapshotter creates a new snapshotter
+@@ -71,10 +73,11 @@ func NewSnapshotter(opt Opt, prevLM leases.Manager, ns string) (snapshot.Snapsho
+	}
+
+	s := &snapshotter{
+-		opt:  opt,
+-		db:   db,
+-		refs: map[string]layer.Layer{},
+-		reg:  reg,
++		opt:               opt,
++		db:                db,
++		refs:              map[string]layer.Layer{},
++		reg:               reg,
++		layerCreateLocker: locker.New(),
+	}
+
+	slm := newLeaseManager(s, prevLM)
+--
+2.40.0
-- 
2.40.0


