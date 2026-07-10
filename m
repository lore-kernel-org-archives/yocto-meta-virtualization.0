Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338DDC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 12:27:09 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11450.1783686423712363196
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 05:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=F4YvKUFL;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5474; q=dns/txt;
  s=iport01; t=1783686423; x=1784896023;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WSqkJQ0iXfEo6fROAdpQPHpRyfW6iLU3YVMQSl5CstY=;
  b=F4YvKUFLtVOYaDSN8e7JMQ+DVrQdF6k2L7e/zZfYQnnoqyAY+TTB7TsK
   1C7bzVJrrOhfn7O0tSrez5o0aNGpv/wuP9YIS0sOaa/wgzEEbA5sCAohr
   D6ec1HD6Lefm7om2VlH7hXMBZxxLQW8R+bdGEd0do7M+xo6us1tG4Zq1s
   MUkUHxiGIwODLBhkKNs8MfiMfPCw0FeJWaKmiGSTdkIIc/4pNkP3CwgFE
   q9zaNwB/s6DKJ/5kOiyms3Dmrq37bE2wLFruG7DAvg4AfkDD19TwWOLGU
   kvQfMvmEzwxh5ctc6Npx2jmLwsiAwt3gjqcI+UPRvjhJr3nyA1ycInLJ2
   w==;
X-CSE-ConnectionGUID: l9uwvFBdSe2VJmjRiStUjA==
X-CSE-MsgGUID: 2Gy4bNTWQWSESdrNpA6WUA==
X-IPAS-Result: =?us-ascii?q?A0BDAgAi5FBq/5L/Ja1aHgEBCxIMggULgld0X0JJA5Qmg?=
 =?us-ascii?q?iGLZ5I3gX4PAQEBD0QNBAEBhD+OFQImNAkOAQIEAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZaATgBcgMBAk8LIxkIgwIBgjoDNgMRukOCLIEBh?=
 =?us-ascii?q?H3YSQ2CWAELFAGBOIU/gnyFI1sYAYR8JxsbgXKBFYNpgQWBGkICiCUEgiKBD?=
 =?us-ascii?q?IFabo8iSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BWYECh?=
 =?us-ascii?q?HkjHwM5f4EwdUp5LXMSHgqBUoIWVAMLGA1IESw3FBsEPm4HjT4XD4I3B3sTA?=
 =?us-ascii?q?SsXghUcAQGSc5JioCFxCiiDdYwhjz6FfBozhVulEQuYfYs3glOECZJHhGmBa?=
 =?us-ascii?q?DyBWXAVgyIJShkPji0LC4NgzkI8NQsDLwEBBwIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:afqlTqq46w1ha3sebN9peUw923ReBmJLZBIvgKrLsJaIsI4StFCzt
 garIBmHPP+JZGL1fowgbYux8k1Vv5DVztM2QABo+yxgEC5GpePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8EM35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0uImHH5Q2
 9YUEz1XUDKGhdi3+66GSMA506zPLOGzVG8ekmtrwTecCbMtRorOBv2bo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LVvrSn8/w7pX7WzFVpUicuaowy2PS1wd2lrPqNbI5f/TXHZoKzxvJ9
 jquE2LRWD4LaNa59QW8zUmBvePVuzvSBr0vPejtnhJtqBjJroAJMzUTWEey5Oe4kFKjUtZeO
 UUI+y0ohawz71CwCMj6VAG/uGSDvBMXR5xXCeJS1e2W4rDf7wDcAi0PSSRMLYR38sQ3Xjctk
 FSOmrsFGABSjVFcclrFnp/8kN94EXF9wbMqDcPccTY43g==
IronPort-HdrOrdr: A9a23:a4f0YakH90ozHcAH9y+P29xbguTpDfIc3DAbv31ZSRFFG/Fw8P
 re/sjzuiWbtN98YhwdcLO7Scq9qA3nlKKdiLN5VdzJYOCMggSVxe9ZgbcKuweBJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadE/DFCm5rY4ts3CBxWPGVXV50=
X-Talos-CUID: 9a23:3IrmVW+nM6NoiB/MwOCVv0pFB987XFfR93qKHW29C1xoc6GoS3bFrQ==
X-Talos-MUID: 9a23:jOcByQXh+vVg/7vq/GXDlW1oEvtX2puVJXsBi7Mekpe7CAUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="507795980"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jul 2026 12:27:02 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 5C68418000204
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jul 2026 12:27:02 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 7F720CC037D; Fri, 10 Jul 2026 17:57:00 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH 1/3] containerd: fix CVE-2026-46680
Date: Fri, 10 Jul 2026 17:56:50 +0530
Message-Id: <20260710122652.3004381-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jul 2026 12:27:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9949

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream release/2.2 backport for
CVE-2026-46680. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/containerd/containerd/commit/d20c6267b88bfd52277337184916e293c627542a
[2] https://github.com/containerd/containerd/security/advisories/GHSA-fqw6-gf59-qr4w

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../containerd/CVE-2026-46680.patch           | 112 ++++++++++++++++++
 .../containerd/containerd_git.bb              |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 recipes-containers/containerd/containerd/CVE-2026-46680.patch

diff --git a/recipes-containers/containerd/containerd/CVE-2026-46680.patch b/recipes-containers/containerd/containerd/CVE-2026-46680.patch
new file mode 100644
index 00000000..463412f9
--- /dev/null
+++ b/recipes-containers/containerd/containerd/CVE-2026-46680.patch
@@ -0,0 +1,112 @@
+From 3ad9d7b797ba6190c6fc3e0635786ea611c9fa42 Mon Sep 17 00:00:00 2001
+From: LEI WANG <ssst0n3@gmail.com>
+Date: Tue, 17 Mar 2026 17:58:00 +0800
+Subject: [PATCH 1/3] oci: return explicit error for out-of-range USER values
+
+Detect strconv.ErrRange and validate uid/gid bounds to avoid falling back to username/group lookups.
+
+CVE: CVE-2026-46680
+Upstream-Status: Backport [https://github.com/containerd/containerd/commit/d20c6267b88bfd52277337184916e293c627542a]
+
+Signed-off-by: LEI WANG <ssst0n3@gmail.com>
+(cherry picked from commit 85706b6d4416d93b47033ba345d7b885a75657b4)
+Signed-off-by: Chris Henzie <chrishenzie@gmail.com>
+(cherry picked from commit d20c6267b88bfd52277337184916e293c627542a)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ pkg/oci/spec_opts.go            | 29 +++++++++++++++++++++++++----
+ pkg/oci/spec_opts_linux_test.go | 14 +++++++++++---
+ 2 files changed, 36 insertions(+), 7 deletions(-)
+
+diff --git a/pkg/oci/spec_opts.go b/pkg/oci/spec_opts.go
+index c298e4bb2..5cc7187d7 100644
+--- a/pkg/oci/spec_opts.go
++++ b/pkg/oci/spec_opts.go
+@@ -626,14 +626,25 @@ func WithUser(userstr string) SpecOpts {
+ 			return nil
+ 		}
+ 
++		isErrRange := func(err error) bool {
++			var numErr *strconv.NumError
++			return errors.As(err, &numErr) && numErr.Err == strconv.ErrRange
++		}
++
+ 		parts := strings.Split(userstr, ":")
+ 		switch len(parts) {
+ 		case 1:
+ 			v, err := strconv.Atoi(parts[0])
+-			if err != nil || v < minUserID || v > maxUserID {
+-				// if we cannot parse as an int32 then try to see if it is a username
++			if err != nil {
++				if isErrRange(err) {
++					return fmt.Errorf("invalid USER value %q: uid out of range", userstr)
++				}
++				// Non-numeric user value; treat it as a username.
+ 				return WithUsername(userstr)(ctx, client, c, s)
+ 			}
++			if v < minUserID || v > maxUserID {
++				return fmt.Errorf("invalid USER value %q: uid out of range", userstr)
++			}
+ 			return WithUserID(uint32(v))(ctx, client, c, s)
+ 		case 2:
+ 			var (
+@@ -642,14 +653,24 @@ func WithUser(userstr string) SpecOpts {
+ 			)
+ 			var uid, gid uint32
+ 			v, err := strconv.Atoi(parts[0])
+-			if err != nil || v < minUserID || v > maxUserID {
++			if err != nil {
++				if isErrRange(err) {
++					return fmt.Errorf("invalid USER value %q: uid out of range", userstr)
++				}
+ 				username = parts[0]
++			} else if v < minUserID || v > maxUserID {
++				return fmt.Errorf("invalid USER value %q: uid out of range", userstr)
+ 			} else {
+ 				uid = uint32(v)
+ 			}
+ 			v, err = strconv.Atoi(parts[1])
+-			if err != nil || v < minGroupID || v > maxGroupID {
++			if err != nil {
++				if isErrRange(err) {
++					return fmt.Errorf("invalid USER value %q: gid out of range", userstr)
++				}
+ 				groupname = parts[1]
++			} else if v < minGroupID || v > maxGroupID {
++				return fmt.Errorf("invalid USER value %q: gid out of range", userstr)
+ 			} else {
+ 				gid = uint32(v)
+ 			}
+diff --git a/pkg/oci/spec_opts_linux_test.go b/pkg/oci/spec_opts_linux_test.go
+index d30f62570..3f46ca2f4 100644
+--- a/pkg/oci/spec_opts_linux_test.go
++++ b/pkg/oci/spec_opts_linux_test.go
+@@ -94,15 +94,23 @@ guest:x:100:guest
+ 		},
+ 		{
+ 			user: "405:2147483648",
+-			err:  "no groups found",
++			err:  "invalid USER value \"405:2147483648\": gid out of range",
+ 		},
+ 		{
+ 			user: "-1000",
+-			err:  "no users found",
++			err:  "invalid USER value \"-1000\": uid out of range",
+ 		},
+ 		{
+ 			user: "2147483648",
+-			err:  "no users found",
++			err:  "invalid USER value \"2147483648\": uid out of range",
++		},
++		{
++			user: "999999999999999999999999999999999999",
++			err:  "invalid USER value \"999999999999999999999999999999999999\": uid out of range",
++		},
++		{
++			user: "0:999999999999999999999999999999999999",
++			err:  "invalid USER value \"0:999999999999999999999999999999999999\": gid out of range",
+ 		},
+ 	}
+ 	for _, testCase := range testCases {
+-- 
+2.35.6
diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index 51d7c2e2..ad41f248 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/2.2;protocol=ht
            file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
            file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
            file://cni-containerd-net.conflist \
+           file://CVE-2026-46680.patch \
           "
 
 # Apache-2.0 for containerd
-- 
2.35.6


