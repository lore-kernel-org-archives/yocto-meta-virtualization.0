Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73668CCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 10:06:55 +0000 (UTC)
Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18076.1792145212598473615
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 Oct 2026 03:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=F+tfX9+j;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4937; q=dns/txt;
  s=iport01; t=1792145212; x=1793354812;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FT+o6PBFcLmcqWiHmi82pVhjX6pHqiHAFtQyIrKaFJ4=;
  b=F+tfX9+jym6BbZCsM9+hEO6hIj2LZ5yjVz6VDJI0Kb7/CPZnJj3UuauY
   ByW7iniUwRQrBYyAD3Gx/Yp405910nwx6N+iyGKZA+39nLqIPQLmIQPzE
   oazJ+MBr3z/gFrTElxCJsEILgxm2ojF9ZGrfvWUjkIyVJ8LFXX6Rl1yBr
   VdBuYavCc+mbGO1hJM85M0KPU3t3Sgsec2H1bYEd7KjcBLHpeIvpUJIyW
   UCpxINGfsSj9DjAIipFoxHCYv5hnMcDiw6HrdC55Tviix8I+ZyGIZliK6
   pl1UDb4Ac8SL/3cws2CxCbKfKUkO2qPuZcoiWJfCeDoeBQ/GMgztblzD/
   Q==;
X-CSE-ConnectionGUID: nsYPziNlRt60C5ZlhIB87Q==
X-CSE-MsgGUID: NrOVFO9sRWC+DqNmmZoP/g==
X-IPAS-Result: =?us-ascii?q?A0BFAgCr9tFq/85K/pBaglmCV3VhQkmUKYIhnh+BJANXD?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/jl0CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBLQsBcgMBAlojGQiDAgGCdAMRvT6BeTOBAYNpAkNQ2zIBC?=
 =?us-ascii?q?xQBgTiFQIgjXRgBhHwnGxuBcoEVg2mBBYFcAQGBSIZdBIIigQyBWh6VKUiBH?=
 =?us-ascii?q?gNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgSCCFiMZNnqBCV6BK?=
 =?us-ascii?q?ylhEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXD?=
 =?us-ascii?q?HMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhQegmVKMRMBKwWBZx9DkwwHCpAVg?=
 =?us-ascii?q?h6BOJ9aCiiDdowilToaM4VbpRQLmH2LN4JTlhI9hGmBaDw5gQ4LB3AVgyIJS?=
 =?us-ascii?q?hkPjjmDa4F/ZYFsggDHcjw1CzIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:nnaf7qqRx3ECLKJCZ9NKl9vV281eBmJOZBIvgKrLsJaIsI4StFCzt
 garIBmCP6vfYWr3fo9zbIvn9x8DuJXSzIdgQFNspHsyFXkRp+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8U035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0uBsMFlc9
 NocEixTNjvetea24ZjrFdA506zPLOGzVG8eknht13TdSP0hW52GG/iM7t5D1zB2jcdLdRrcT
 5NFNXw1MUiGPEEJYA9JYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUoHaFZsMxhjHz
 o7A10LjJS80E42E8wWusV61oOrKryTDH41HQdVU8dYv2jV/3Fc7DRAKXB6loOOll0e6WsBWN
 00T/AIqrLMu7wq6SdLhWAWip3yJtQJaXMBfe9DW8ymEx7CR50OSAXIJC2YcLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:OFAKSqEtSk4WvVI2pLqE2MeALOsnbusQ8zAXPidKOH5om6Oj+f
 xG8M536faWskdzZJhfo7G90cC7KBu2n6KdirN/AV7NZmXbUROTTL1K3M/F3yDqHTH4+6p20K
 dtdLU7NfjLZGIK6PoTJGKDYrEdKB7tytHNudvj
X-Talos-CUID: =?us-ascii?q?9a23=3A+rCVkGoAFhzPGddO6PdDnvvmUcY+Q0XPzVHUGVP?=
 =?us-ascii?q?mUU00ermVaHXAp5oxxg=3D=3D?=
X-Talos-MUID: 9a23:mLig8gg3gp5QyVcj1kZWU8MpEt1P3YqJWVs3rr5Fl9CiMClCPA/ag2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="58861067"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 10:06:50 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id CF7C618000382
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Oct 2026 10:06:49 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 5D9F4CC1295; Fri, 16 Oct 2026 15:36:48 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH 1/5] containerd: Fix CVE-2026-50195
Date: Fri, 16 Oct 2026 15:36:37 +0530
Message-Id: <20261016100641.1628059-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Oct 2026 10:06:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10114

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream release/2.2 backport for CVE-2026-50195.
The upstream fix commit is referenced in [1], and the public CVE record
is referenced in [2].

[1] https://github.com/containerd/containerd/commit/cff57884176a1e6ba0857a417753d799958e0f46
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-50195

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../containerd/CVE-2026-50195.patch           | 73 +++++++++++++++++++
 .../containerd/containerd_git.bb              |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 recipes-containers/containerd/containerd/CVE-2026-50195.patch

diff --git a/recipes-containers/containerd/containerd/CVE-2026-50195.patch b/recipes-containers/containerd/containerd/CVE-2026-50195.patch
new file mode 100644
index 00000000..2aad846f
--- /dev/null
+++ b/recipes-containers/containerd/containerd/CVE-2026-50195.patch
@@ -0,0 +1,73 @@
+From d996462fc527969992a87e0170992a8397222c82 Mon Sep 17 00:00:00 2001
+From: Samuel Karp <samuelkarp@google.com>
+Date: Tue, 26 May 2026 16:06:58 -0700
+Subject: [PATCH 1/4] cri: do not re-tag restored checkpoints
+
+Google-Bug-Id: 508657842
+
+CVE: CVE-2026-50195
+Upstream-Status: Backport [https://github.com/containerd/containerd/commit/cff57884176a1e6ba0857a417753d799958e0f46]
+
+Signed-off-by: Samuel Karp <samuelkarp@google.com>
+(cherry picked from commit 0c0918fa8fb4d997f889a3d811603995a3a2b68a)
+Signed-off-by: Samuel Karp <samuelkarp@google.com>
+(cherry picked from commit cff57884176a1e6ba0857a417753d799958e0f46)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ .../checkpoint/checkpoint-restore-cri-test.sh   |  4 ++--
+ .../cri/server/container_checkpoint_linux.go    | 17 -----------------
+ 2 files changed, 2 insertions(+), 19 deletions(-)
+
+diff --git a/contrib/checkpoint/checkpoint-restore-cri-test.sh b/contrib/checkpoint/checkpoint-restore-cri-test.sh
+index ff1f6e6c0..44e42426b 100755
+--- a/contrib/checkpoint/checkpoint-restore-cri-test.sh
++++ b/contrib/checkpoint/checkpoint-restore-cri-test.sh
+@@ -110,7 +110,7 @@ function test_from_archive() {
+ 	fi
+ 	# Cleanup
+ 	echo "--> Cleanup images: "
+-	crictl rmi "${TEST_IMAGE}" | sed 's/^/----> \t/'
++	(crictl rmi "${TEST_IMAGE}" || true) | sed 's/^/----> \t/'
+ 	echo -n "--> Verifying container rootfs: "
+ 	crictl exec "$ctr_id" ls -la /root/testfile
+ 	if crictl exec "$ctr_id" ls -la /etc/motd >/dev/null 2>&1; then
+@@ -184,7 +184,7 @@ function test_from_oci() {
+ 	echo "--> Cleanup images: "
+ 	../../bin/ctr -n k8s.io images rm localhost/checkpoint-image:latest | sed 's/^/----> \t/'
+ 	echo "--> Cleanup images: "
+-	crictl rmi "${TEST_IMAGE}" | sed 's/^/----> \t/'
++	(crictl rmi "${TEST_IMAGE}" || true) | sed 's/^/----> \t/'
+ 	echo "--> Deleting all pods: "
+ 	crictl -t 5s rmp -fa | sed 's/^/----> \t/'
+ 	SUCCESS=1
+diff --git a/internal/cri/server/container_checkpoint_linux.go b/internal/cri/server/container_checkpoint_linux.go
+index b54963ae8..b122c392d 100644
+--- a/internal/cri/server/container_checkpoint_linux.go
++++ b/internal/cri/server/container_checkpoint_linux.go
+@@ -331,23 +331,6 @@ func (c *criService) CRImportCheckpoint(
+ 	if _, err := reference.ParseAnyReference(config.RootfsImageName); err != nil {
+ 		return "", fmt.Errorf("error parsing reference: %q is not a valid repository/tag %v", config.RootfsImageName, err)
+ 	}
+-	tagImage, err := c.client.ImageService().Get(ctx, config.RootfsImageRef)
+-	if err != nil {
+-		return "", fmt.Errorf("failed to get checkpoint base image %s: %w", config.RootfsImageRef, err)
+-	}
+-	// Second step is to tag the image with the same tag it used to have
+-	// during checkpointing. For the error that the image NAME:TAG already
+-	// exists is ignored. It could happen that NAME:TAG now belongs to
+-	// another NAME@DIGEST than during checkpointing and the restore will
+-	// happen on another image.
+-	// TODO: handle if NAME:TAG points to a different NAME@DIGEST
+-	tagImage.Name = config.RootfsImageName
+-	_, err = c.client.ImageService().Create(ctx, tagImage)
+-	if err != nil {
+-		if !errdefs.IsAlreadyExists(err) {
+-			return "", fmt.Errorf("failed to tag checkpoint base image %s with %s: %w", config.RootfsImageRef, config.RootfsImageName, err)
+-		}
+-	}
+ 
+ 	var image imagestore.Image
+ 	for i := 1; i < 500; i++ {
+-- 
+2.35.6
+
diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index 3cf088f0..4e8d95ee 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/2.2;protocol=ht
            file://CVE-2026-46680.patch \
            file://CVE-2026-47262.patch \
            file://CVE-2026-53488.patch \
+           file://CVE-2026-50195.patch \
           "
 
 # Apache-2.0 for containerd
-- 
2.35.6


