Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4021CAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 05:26:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12123.1758000367815029836
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Sep 2025 22:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hYifJuul;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13546ab805=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58G5JDt12511028
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Sep 2025 22:26:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=gM7mGKFX88n7+RS9dTmZYVLlqKktKPMqwkA5ecIXleo=; b=hYifJuulw0BB
	xCXkrr/SaLG+Oncbk1wnIEzuGMToyqa9HdbCAMbG7abvKOqMtC8C1d8TsOj4DeKv
	kfP4SzMEJcT9pRT/svqgKu1fgCSMWamSkq5V8cNEQcbrtMPSgaPhf1AroLN9RYsT
	Ud3SthXE3O2yJiZkUTZQDqPQS1P7nCCuz3euwitaqSQ/CG167laKN3ryBohxrb8s
	Fek1gp5sO3elJs+y6nsR6kExYK780fo7Q7AvPezqBKcnj4LJR35vzS9iU7QyESH3
	Yd+ExE6ejw626stzemCvcm+IsKCGAKMJ6HEFcVn8gRRsFfhGO9WeH3C0nTkvNRsW
	acFfmTGd4w==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4953w2at2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Sep 2025 22:26:07 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Sep 2025 22:26:05 -0700
From: yurade <yogita.urade@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][scarthgap][PATCH 2/2] buildah: fix CVE-2024-9407
Date: Tue, 16 Sep 2025 10:55:15 +0530
Message-ID: <20250916052515.891345-2-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250916052515.891345-1-yogita.urade@windriver.com>
References: <20250916052515.891345-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-GUID: DamiU5kr24gr_Jpp3UxMPeQ-hNMRF8ir
X-Proofpoint-ORIG-GUID: DamiU5kr24gr_Jpp3UxMPeQ-hNMRF8ir
X-Authority-Analysis: v=2.4 cv=PuaTbxM3 c=1 sm=1 tr=0 ts=68c8f4ef cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=VZzbbjECq-QA:10 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=20KFwNOVAAAA:8 a=t7CeM3EgAAAA:8 a=ZHOUijFxftgf4d7yEaAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDA1MCBTYWx0ZWRfX4v1m6SrypKTA
 4W+RGIZmYy99kXvcU191IL5FBOsnsawTFPriB1v6+4nJfg0wdSvgl28Ui4EtTObojDKijSeFwnZ
 ugRfhLn50xMig3C9wDboutt+d9stzH518wnTCd/dCudXwNWehLbcOmZ66FhEeThADBsRLV9JGnm
 6pCU1g/7Sjs27TEi72PHBdElegNA4kabGR1EB7Jy7LQ2geENRDwQWtVda/2G+GNIJHpWKJJdQfP
 Lbvme53yS765NDGWhY8UjnpHMpoz7BYYwb+nGkj5EAZEvI5DSEhh+RAYMJmq3mGFzxxiF1IDC1g
 AS/ZnLVAiIRzMpOuXXRd+GaV0iZDjAm/NmTiuJMwIJokUq9r/TeK/0tlGanQ5g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Sep 2025 05:26:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9393

From: Yogita Urade <yogita.urade@windriver.com>

A vulnerability exists in the bind-propagation option of the
Dockerfile RUN --mount instruction. The system does not properly
validate the input passed to this option, allowing users to pass
arbitrary parameters to the mount instruction. This issue can be
exploited to mount sensitive directories from the host into a
container during the build process and, in some cases, modify the
contents of those mounted files. Even if SELinux is used, this
vulnerability can bypass its protection by allowing the source
directory to be relabeled to give the container access to host files.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-9407

Upstream patch:
https://github.com/containers/buildah/commit/e289e285dc8b68873b6c16f58f2fdb4a1c7cca0c

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../buildah/buildah/CVE-2024-9407.patch       | 92 +++++++++++++++++++
 recipes-containers/buildah/buildah_git.bb     |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 recipes-containers/buildah/buildah/CVE-2024-9407.patch

diff --git a/recipes-containers/buildah/buildah/CVE-2024-9407.patch b/recipes-containers/buildah/buildah/CVE-2024-9407.patch
new file mode 100644
index 00000000..ec93e7b8
--- /dev/null
+++ b/recipes-containers/buildah/buildah/CVE-2024-9407.patch
@@ -0,0 +1,92 @@
+From e289e285dc8b68873b6c16f58f2fdb4a1c7cca0c Mon Sep 17 00:00:00 2001
+From: Nalin Dahyabhai <nalin@redhat.com>
+Date: Tue, 1 Oct 2024 11:01:45 -0400
+Subject: [PATCH] CVE-2024-9407: validate "bind-propagation" flag settings
+
+CVE-2024-9407: validate that the value for the "bind-propagation" flag
+when handling "bind" and "cache" mounts in `buildah run` or in RUN
+instructions is one of the values that we would accept without the
+"bind-propagation=" prefix.
+
+Paul: fix merged conflict in tests (cherry-picked from 732f770648)
+
+Fixes https://issues.redhat.com/browse/RHEL-61147
+Fixes https://issues.redhat.com/browse/RHEL-61145
+
+Signed-off-by: Nalin Dahyabhai <nalin@redhat.com>
+Signed-off-by: Paul Holzinger <pholzing@redhat.com>
+
+CVE: CVE-2024-9407
+Upstream-Status: Backport [https://github.com/containers/buildah/commit/e289e285dc8b68873b6c16f58f2fdb4a1c7cca0c]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ internal/volumes/volumes.go | 12 ++++++++++++
+ tests/bud.bats              | 25 +++++++++++++++++++++++++
+ 2 files changed, 37 insertions(+)
+
+diff --git a/internal/volumes/volumes.go b/internal/volumes/volumes.go
+index c6d6e3545..871006099 100644
+--- a/internal/volumes/volumes.go
++++ b/internal/volumes/volumes.go
+@@ -106,6 +106,12 @@ func GetBindMount(ctx *types.SystemContext, args []string, contextDir string, st
+			if !hasArgValue {
+				return newMount, "", fmt.Errorf("%v: %w", argName, errBadOptionArg)
+			}
++                       switch argValue {
++                       default:
++                           return newMount, "", fmt.Errorf("%v: %q: %w", argName, argValue, errBadMntOption)
++                       case "shared", "rshared", "private", "rprivate", "slave", "rslave":
++                           // this should be the relevant parts of the same list of options we accepted above
++                       }
+			newMount.Options = append(newMount.Options, argValue)
+		case "src", "source":
+			if !hasArgValue {
+@@ -278,6 +284,12 @@ func GetCacheMount(args []string, store storage.Store, imageMountLabel string, a
+			if !hasArgValue {
+				return newMount, nil, fmt.Errorf("%v: %w", argName, errBadOptionArg)
+			}
++                       switch argValue {
++                       default:
++                           return newMount, nil, fmt.Errorf("%v: %q: %w", argName, argValue, errBadMntOption)
++                       case "shared", "rshared", "private", "rprivate", "slave", "rslave":
++                           // this should be the relevant parts of the same list of options we accepted above
++                       }
+			newMount.Options = append(newMount.Options, argValue)
+		case "id":
+			if !hasArgValue {
+diff --git a/tests/bud.bats b/tests/bud.bats
+index 9e3930f52..15165953f 100644
+--- a/tests/bud.bats
++++ b/tests/bud.bats
+@@ -6682,3 +6682,28 @@ EOF
+   run_buildah 1 build --security-opt label=disable --build-context testbuild=${TEST_SCRATCH_DIR}/cve20249675/ --no-cache ${TEST_SCRATCH_DIR}/cve20249675/
+   expect_output --substring "cat: can't open '/var/tmp/file.txt': No such file or directory"
+ }
++
++@test "build-validates-bind-bind-propagation" {
++  _prefetch alpine
++
++  cat > ${TEST_SCRATCH_DIR}/Containerfile << _EOF
++FROM alpine as base
++FROM alpine
++RUN --mount=type=bind,from=base,source=/,destination=/var/empty,rw,bind-propagation=suid pwd
++_EOF
++
++  run_buildah 125 build $WITH_POLICY_JSON ${TEST_SCRATCH_DIR}
++  expect_output --substring "invalid mount option"
++}
++
++@test "build-validates-cache-bind-propagation" {
++  _prefetch alpine
++
++  cat > ${TEST_SCRATCH_DIR}/Containerfile << _EOF
++FROM alpine
++RUN --mount=type=cache,destination=/var/empty,rw,bind-propagation=suid pwd
++_EOF
++
++  run_buildah 125 build $WITH_POLICY_JSON ${TEST_SCRATCH_DIR}
++  expect_output --substring "invalid mount option"
++}
+--
+2.40.0
diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
index 22cf3605..3abd1227 100644
--- a/recipes-containers/buildah/buildah_git.bb
+++ b/recipes-containers/buildah/buildah_git.bb
@@ -36,6 +36,7 @@ SRC_URI = " \
     file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/github.com/containers/buildah/vendor/github.com/containers/storage \
     file://CVE-2024-9675.patch;patchdir=src/github.com/containers/buildah \
     file://CVE-2024-9341.patch;patchdir=src/github.com/containers/buildah \
+    file://CVE-2024-9407.patch;patchdir=src/github.com/containers/buildah \
     "
 
 DEPENDS = "libdevmapper btrfs-tools gpgme"
-- 
2.40.0


