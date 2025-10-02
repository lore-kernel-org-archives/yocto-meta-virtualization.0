Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46797CAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 08:05:35 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.86])
 by mx.groups.io with SMTP id smtpd.web10.3533.1759392325308997675
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 01:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector1 header.b=k+2OCyuY;
 spf=pass (domain: witekio.com, ip: 40.107.159.86, mailfrom: tgaige@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7ODWgAF+kheZiUraTLtMO2PNcSe/dcE5nHMTSyDtIaXlQOU6XCRvKUByw+nZ6nKgmt2nswQjS/xFnH9T2hrJESiJgqI1KSYJrl1yYGH+CslmNCy016ivhlVutsKrT2+8s0ZiPBzqnPGT6KSo57/nqgnDbEmZdgVmaIXKWfKIXapQcv+lxbV5p2+Z7FXuTar8y8vH/m2Bf8OznGgmb1DcL3AzCCO3CMJ/KukF+n+Uh3Wk2Y7sKSjTfr60xuj3hbx4pzUNoMyr1wiES+Tz4+FbUP+FkHT6orLl0sh/zepWF3EZWqqUdtjlg4JPzBknIRgcumP90X73L27DqgkzWqLXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1QQh0ZmI/z3Nv7hwH8+gAIJ9atbm5fTA3oKjfJFgqw=;
 b=NgihdNw/pjHnBaDYJKYDMfVw/qCTjaD4Mgg9jycqNc13al4kwI0LGeBa1R+ptl5y0Diuh6ArHkILGr87oRdeHaXZB1oOo7oghxsG5GYxjUrI24ET65T1IjwAtvlwRDpuGdICymgNyWwtiL9mmF/9d9toeQ/Cd2GeBr9lWhhtp/gHKnm5cF7qknymAR+QTHOsFLql57msNrp57VdK+eqYMXAMPuWSHUVWBx8jCWs2xKo/HKY6rvyADF+qBlBwqt6UuPXZxTV1GeGZ0lUPMvNxgSOHExuBg/m3ycdyLQSJ3R4Wx7x8AJIIiLUhhgxfDf4qP5d5lK7aBuPD/c1Trb7wZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1QQh0ZmI/z3Nv7hwH8+gAIJ9atbm5fTA3oKjfJFgqw=;
 b=k+2OCyuYaHq3OXx/0nhC8LuPtTxeinharD1PlUgWGrkonEbubFQEGPxbkU/5mKutW3nwr7RiHjgIbzFu3rCnptLb6m74Utp8fq07kG/NN9V6pzAwTNfssklPPNfANt8C/FKR7UFYA6qC1SGKfm2S6MwOX4yCuE0Rvv+Og2AnN0VxO9UqYwj5XTV4o2VINFOKi3Gb0cSNObJ9e9fF0Dz11RmsA9H42OB8qM/e1WkgBbZ16fKuue6W7qEN/z8n5bfGJLE5s3WyNMny5Kxkac4yP3QyiqDWU2sSmZOgHLQaJBOTvRF8MPqepPby4iWP52Yt6WfMb22deNapRlH2qK867w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by PAXP192MB1632.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:28c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 08:05:17 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 08:05:17 +0000
From: tgaige.opensource@witekio.com
To: meta-virtualization@lists.yoctoproject.org
CC: Theo GAIGE <tgaige.opensource@witekio.com>
Subject: [kirkstone][PATCH] containerd-opencontainers: fix CVE-2024-40635
Date: Thu,  2 Oct 2025 10:05:07 +0200
Message-ID: <20251002080507.571150-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0070.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::13) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|PAXP192MB1632:EE_
X-MS-Office365-Filtering-Correlation-Id: e21af92c-b2f6-45b5-7936-08de018a6c75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lmfRg0Fx8qDFyXvDm6hM5fdEePyhiqVoLmoh5p37IR9ypivZy1xWCt7jmdmv?=
 =?us-ascii?Q?1xNkTMIOs0qd7SsbHq3YcCFfVuKbiD2xLheyLTSywDG2S/wbtD+tGM33zoUQ?=
 =?us-ascii?Q?Im2n6FMLM6Ks+F8tgLxLjfo8Uun4nfpiOULdzA36W3lqI8V+JmBZeU9njVMH?=
 =?us-ascii?Q?k+bMlIYbUJbwnnFf5KjF6dm6lI1RUP7FyUH8ZuBtLb8zdSzxXjRUkZNB6C3b?=
 =?us-ascii?Q?gD/1HrKJhxwkeq4MEHBhWKX85seVx32cvHKYcB26Y7WJ0yXS/XQPNVj8Wb3C?=
 =?us-ascii?Q?5cjFEo26klQ+Mpyo4UP4rWuL8nTnwnl54sJ4vn27lDx3KmKUm7RBLcHlE59J?=
 =?us-ascii?Q?Z/QOqtTeQcos2zYk/09ZjdQ4OEPkAnMbPRIiAWWEwrc8ZHycZ0ClkNfpiFBa?=
 =?us-ascii?Q?zZFNhXf0irkrJl6g2aHSEaRlwI3ma1g8S1kLxWMTC/rMSH8HAWvRO1C9uSvZ?=
 =?us-ascii?Q?sKwBelkFA2O4RpJ2ylRABrR/g0eCAtoe3kCIbnjZyzm6d7Buag8A04OPovnR?=
 =?us-ascii?Q?h7+9RGwno/18+0Y4GxAtoid/wCrw8uZq2pVrUnN62vPcdxrQhoeawb3qVS9i?=
 =?us-ascii?Q?M/wQdtoWBSknJW5VXehNUXsjxAS4I4a9o59XCfBUCWyOQvm22bzG+VbKefqZ?=
 =?us-ascii?Q?ivbDuQIpNd3YI7bc9DjNhV2X007EtX9QL1CPUoF1YMPwCK+lmb81TJ5SMcUi?=
 =?us-ascii?Q?djzDahJk4L9etZIuCFKnBxPlmQaa1nYffZRnXg5cCvM3wH8OozP9pFp4cMRc?=
 =?us-ascii?Q?SrrCyEj6jh20tYyddvdbGg/be+ilnLjXNeie7TMRLducB+1W8CrNQcxmeTWk?=
 =?us-ascii?Q?9rqh3MKfw3VgqKSunbmnUukpFpBYcTNYsbugoHdfZNImLkBHsUEO9YXOGrRu?=
 =?us-ascii?Q?hh0nGOso8bNgUveSGHpEhm53kOszZB60ucYEG8UNZQvDPWl/Dp94FKq38Zzm?=
 =?us-ascii?Q?/jqobZd/x4MzAbqpmkQr/YJLuABHEqOL1udcwSVPbwJNICpj+9lAXKxpg5xL?=
 =?us-ascii?Q?rksgo7kMu3fIP4QAAmPluNaNE6LZl3oh/UrpdHzMHWTkxK2dIuTjFiL8baWZ?=
 =?us-ascii?Q?AAbv9UudTnnL+jgG/sHWhm073vRKct4f7r3l828cm5zxamL1hrMA9cCgaaF5?=
 =?us-ascii?Q?hea4s4J/+EHHvG13tlVm1Hf5/oDGWvw4BEF47UM2PCp/vw2GqaAdAX+MA7UB?=
 =?us-ascii?Q?fEcKJe7/ogGW1Tgb59722tEQRi85IuEYmVaLwqT8CzdoFwtUHk56pkmRTy8G?=
 =?us-ascii?Q?cJftqwys6V+IFa5wTy5y1En0XRo1SBVuTlqsUCdCThjSPensbl2mc1NLB6p2?=
 =?us-ascii?Q?ZYHA86V/pXjf/RsC278Fz7uSlTgHbcLrtRxG+9cnKix7t9gf01M5r/ib54vj?=
 =?us-ascii?Q?49/CpYQtMPPFxzrf2yd86pg+kbnUqHCoe1XHljB1XcLvaWQH6BoRe1rTTUCp?=
 =?us-ascii?Q?y4z6EKVQLW5ob+SvNc10EYRYHBEzp7rVnMD9aO4cr+W5NKGoQCzO1A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iMBZc3nZx4HuEv5WoDcXTrNENKXfFO9q5TSvnAQMVT5bTPzXD0jvnTKglrNu?=
 =?us-ascii?Q?lZ2sDd09lGT1Yl/ZCra0hcS7PsPYpCPeHdfoBSa9WjsN1BIauFufCNkq0HZz?=
 =?us-ascii?Q?C8ZdGDd6aZNxfoMyjJyC1DZVDD5d0MyRA7D8LVKwBswY/O4JFXVVjgFydw1L?=
 =?us-ascii?Q?ehtjzzdvZYzmxtawzXF7FOR+Q6u9LHGIJ8nadTgaOvQqUQ54OfPjMuB4SOZ7?=
 =?us-ascii?Q?GtBmeyMdu1lTg4+7f0YWnL4yZlbJKMifGuxtsgUMX4M2W4QmZ+4llbJvjteD?=
 =?us-ascii?Q?BVfCyiEz76ktw6TVulzJOVOPHR+X3IPjc+4GwMx8rx6+t1FqvwQyJt2LH4dO?=
 =?us-ascii?Q?tuO5JEr94ET+Qm4lRZ0R2VAJGWW40ZsmWTO+vOokEbtJhaHjzRH1TaUqiQQA?=
 =?us-ascii?Q?qqwdCV9in5hCwbqCq7Jgwu3gfqhaYlRnE5I9wE0YXme+iw0Onn8CRPYEobb2?=
 =?us-ascii?Q?/n6am2UcO6I+k5YtmGhR6Vdg6ykqWxrFBEIalGANxnKxDqxHq6NbhwZTG0b9?=
 =?us-ascii?Q?ForiSDvfofCZzmkkxhU+CeghhTjwq7iG4Tf5dG5t+I6W144ljVLeitOWcTPo?=
 =?us-ascii?Q?XuBHtvi4SY9/OIqMwDdJC00S2uSszpLiXE1TM2XjQuJnfyU7PjnRsh2ZJwkl?=
 =?us-ascii?Q?TFv/2UwwFEPy5cWNIHerQ/2CI8EkbHN7Pa+EVJhGYOB0D9symTcyhBgt42Pz?=
 =?us-ascii?Q?/Q2u8J9lFbNuelUXupoNwEpflO+wbU0pm2CFmgTDeoPARJSIF1likPks0kLO?=
 =?us-ascii?Q?r2TOLEXIIRuL+727I7WIfrEgmnkwQygmLPeA6kdczQ39tYAqn1ZBlNTADPo6?=
 =?us-ascii?Q?ZYwx9+AO5qe8jWaJk2PKawQuQKJJXa/FYBW3KBKApzTmabGBlqi3OcyhTgGz?=
 =?us-ascii?Q?L9H9ITFdTwzCdCy08M+lj39Rax8hWi4dTF+ZgS4JQj8aCYx+CTF5rz8FPbw1?=
 =?us-ascii?Q?sLurnUcvyZlhhhyG667wqkMFB6PPx5mYMImb4AvQnE7vORwUfj3WPgsGvcTZ?=
 =?us-ascii?Q?Ks6pxkSyHs5wv2qOAir4FMe7GdUJjE7ZmmP6EP7SOrHy+npQJh5JHG3K6Cph?=
 =?us-ascii?Q?L283oA6TXQ08RWZnaPCwOO/btyeWU+RE1AfmUFUjTC4iQHo7u5In/E8wTGEO?=
 =?us-ascii?Q?n9CXOWcwLhPHjvQu575YM13AD1amhgZ6eP92rQYf3Nda9zQwjQcXs2zOWbd9?=
 =?us-ascii?Q?QmkkHuzWI3QkplyFhCQ/mfeyg8KVI2NqjK9POOcor/WER7RRmUMk1O0ws0KH?=
 =?us-ascii?Q?S4M/oI7Lxyc6Dk0M0wNe8axMFH9iDWLw12Iuslkq97JzbpKj7+d2J/NUHMKg?=
 =?us-ascii?Q?n4SBHduxv4iOVtJdKejww5pycYUEUg8KPI997KRPoSwnbTAhNBneSCpcVp6H?=
 =?us-ascii?Q?NYaLW0qc+6HS4RiVfXWhsjJVp/Pclw4dsVls7W616Nr2qgoaKGhAMFZbIvwF?=
 =?us-ascii?Q?cV4X5sSATa/lwu+I0jTVMfBTdpnm32pA0+xCb3UNHyqxd9yPVGe4eaGxvHwc?=
 =?us-ascii?Q?yv/6HkMmrtLetxpPC+rrS/yR9hTAnKRo9G9cpZg+hYfB3pUwaI8anLKMkCgT?=
 =?us-ascii?Q?9Bo/CG9eyNNA7PSLhWy5iob3omeWZtUewi64H1m0?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e21af92c-b2f6-45b5-7936-08de018a6c75
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 08:05:17.1396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ytl1SJSLhoO0kUdQaWmiCJ05TkeZfhnAhS7ewnPhyHskaoaEmYsgjK5scqNr6aKFCziFxS7ck6PgLJ8J0t3YzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP192MB1632
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Oct 2025 08:05:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9410

From: Theo GAIGE <tgaige.opensource@witekio.com>

Upstream-Status: Backport from https://github.com/containerd/containerd/com=
mit/9639b9625554183d0c4d8d072dccb84fedd2320f

Signed-off-by: Theo GAIGE <tgaige.opensource@witekio.com>
---
 .../CVE-2024-40635.patch                      | 180 ++++++++++++++++++
 .../containerd-opencontainers_git.bb          |   1 +
 2 files changed, 181 insertions(+)
 create mode 100644 recipes-containers/containerd/containerd-opencontainers=
/CVE-2024-40635.patch

diff --git a/recipes-containers/containerd/containerd-opencontainers/CVE-20=
24-40635.patch b/recipes-containers/containerd/containerd-opencontainers/CV=
E-2024-40635.patch
new file mode 100644
index 00000000..71a0f8b6
--- /dev/null
+++ b/recipes-containers/containerd/containerd-opencontainers/CVE-2024-4063=
5.patch
@@ -0,0 +1,180 @@
+From 6727fad7cc608f47304c073d758a04ca516e08fd Mon Sep 17 00:00:00 2001
+From: Craig Ingram <Cjingram@google.com>
+Date: Fri, 7 Mar 2025 13:27:58 +0000
+Subject: [PATCH] validate uid/gid
+
+Upstream-Status: Backport [https://github.com/containerd/containerd/commit=
/9639b9625554183d0c4d8d072dccb84fedd2320f]
+CVE: CVE-2024-40635
+
+Signed-off-by: Theo GAIGE <tgaige.opensource@witekio.com>
+---
+ oci/spec_opts.go            | 24 ++++++++--
+ oci/spec_opts_linux_test.go | 92 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 112 insertions(+), 4 deletions(-)
+
+diff --git a/oci/spec_opts.go b/oci/spec_opts.go
+index 3330ad108..1f10b24c6 100644
+--- a/oci/spec_opts.go
++++ b/oci/spec_opts.go
+@@ -22,6 +22,7 @@ import (
+ 	"encoding/json"
+ 	"errors"
+ 	"fmt"
++	"math"
+ 	"os"
+ 	"path/filepath"
+ 	"runtime"
+@@ -536,6 +537,20 @@ func WithUser(userstr string) SpecOpts {
+ 		defer ensureAdditionalGids(s)
+ 		setProcess(s)
+ 		s.Process.User.AdditionalGids =3D nil
++		// While the Linux kernel allows the max UID to be MaxUint32 - 2,
++                // and the OCI Runtime Spec has no definition about the m=
ax UID,
++                // the runc implementation is known to require the UID to=
 be <=3D MaxInt32.
++                //
++                // containerd follows runc's limitation here.
++                //
++                // In future we may relax this limitation to allow MaxUin=
t32 - 2,
++                // or, amend the OCI Runtime Spec to codify the implement=
ation limitation.
++		const (
++			minUserID  =3D 0
++			maxUserID  =3D math.MaxInt32
++			minGroupID =3D 0
++			maxGroupID =3D math.MaxInt32
++		)
+=20
+ 		// For LCOW it's a bit harder to confirm that the user actually exists =
on the host as a rootfs isn't
+ 		// mounted on the host and shared into the guest, but rather the rootfs=
 is constructed entirely in the
+@@ -552,8 +567,8 @@ func WithUser(userstr string) SpecOpts {
+ 		switch len(parts) {
+ 		case 1:
+ 			v, err :=3D strconv.Atoi(parts[0])
+-			if err !=3D nil {
+-				// if we cannot parse as a uint they try to see if it is a username
++			if err !=3D nil || v < minUserID || v > maxUserID {
++				// if we cannot parse as an int32 then try to see if it is a username
+ 				return WithUsername(userstr)(ctx, client, c, s)
+ 			}
+ 			return WithUserID(uint32(v))(ctx, client, c, s)
+@@ -564,12 +579,13 @@ func WithUser(userstr string) SpecOpts {
+ 			)
+ 			var uid, gid uint32
+ 			v, err :=3D strconv.Atoi(parts[0])
+-			if err !=3D nil {
++			if err !=3D nil || v < minUserID || v > maxUserID {
+ 				username =3D parts[0]
+ 			} else {
+ 				uid =3D uint32(v)
+ 			}
+-			if v, err =3D strconv.Atoi(parts[1]); err !=3D nil {
++			v, err =3D strconv.Atoi(parts[1])
++			if err !=3D nil || v < minGroupID || v > maxGroupID {
+ 				groupname =3D parts[1]
+ 			} else {
+ 				gid =3D uint32(v)
+diff --git a/oci/spec_opts_linux_test.go b/oci/spec_opts_linux_test.go
+index 904edcb42..f3be5ef27 100644
+--- a/oci/spec_opts_linux_test.go
++++ b/oci/spec_opts_linux_test.go
+@@ -31,6 +31,98 @@ import (
+ 	"golang.org/x/sys/unix"
+ )
+=20
++// nolint:gosec
++func TestWithUser(t *testing.T) {
++	t.Parallel()
++
++	expectedPasswd :=3D `root:x:0:0:root:/root:/bin/ash
++guest:x:405:100:guest:/dev/null:/sbin/nologin
++`
++	expectedGroup :=3D `root:x:0:root
++bin:x:1:root,bin,daemon
++daemon:x:2:root,bin,daemon
++sys:x:3:root,bin,adm
++guest:x:100:guest
++`
++	td :=3D t.TempDir()
++	apply :=3D fstest.Apply(
++		fstest.CreateDir("/etc", 0777),
++		fstest.CreateFile("/etc/passwd", []byte(expectedPasswd), 0777),
++		fstest.CreateFile("/etc/group", []byte(expectedGroup), 0777),
++	)
++	if err :=3D apply.Apply(td); err !=3D nil {
++		t.Fatalf("failed to apply: %v", err)
++	}
++	c :=3D containers.Container{ID: t.Name()}
++	testCases :=3D []struct {
++		user        string
++		expectedUID uint32
++		expectedGID uint32
++		err         string
++	}{
++		{
++			user:        "0",
++			expectedUID: 0,
++			expectedGID: 0,
++		},
++		{
++			user:        "root:root",
++			expectedUID: 0,
++			expectedGID: 0,
++		},
++		{
++			user:        "guest",
++			expectedUID: 405,
++			expectedGID: 100,
++		},
++		{
++			user:        "guest:guest",
++			expectedUID: 405,
++			expectedGID: 100,
++		},
++		{
++			user: "guest:nobody",
++			err:  "no groups found",
++		},
++		{
++			user:        "405:100",
++			expectedUID: 405,
++			expectedGID: 100,
++		},
++		{
++			user: "405:2147483648",
++			err:  "no groups found",
++		},
++		{
++			user: "-1000",
++			err:  "no users found",
++		},
++		{
++			user: "2147483648",
++			err:  "no users found",
++		},
++	}
++	for _, testCase :=3D range testCases {
++		testCase :=3D testCase
++		t.Run(testCase.user, func(t *testing.T) {
++			t.Parallel()
++			s :=3D Spec{
++				Version: specs.Version,
++				Root: &specs.Root{
++					Path: td,
++				},
++				Linux: &specs.Linux{},
++			}
++			err :=3D WithUser(testCase.user)(context.Background(), nil, &c, &s)
++			if err !=3D nil {
++				assert.EqualError(t, err, testCase.err)
++			}
++			assert.Equal(t, testCase.expectedUID, s.Process.User.UID)
++			assert.Equal(t, testCase.expectedGID, s.Process.User.GID)
++		})
++	}
++}
++
+ // nolint:gosec
+ func TestWithUserID(t *testing.T) {
+ 	t.Parallel()
+--=20
+2.43.0
+
diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb=
 b/recipes-containers/containerd/containerd-opencontainers_git.bb
index 6c0266ac..dd621705 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -9,6 +9,7 @@ SRCREV =3D "1e1ea6e986c6c86565bc33d52e34b81b3e2bc71f"
 SRC_URI =3D "git://github.com/containerd/containerd;branch=3Drelease/1.6;p=
rotocol=3Dhttps;destsuffix=3Dgit/src/github.com/containerd/containerd \
            file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-spec=
i.patch \
            file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
+           file://CVE-2024-40635.patch \
           "
=20
 # Apache-2.0 for containerd
--=20
2.43.0


