Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5425CAC59E
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 05:26:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12124.1758000368368308301
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Sep 2025 22:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UnqcGOk2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13546ab805=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58G5FSCv1857834
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Sep 2025 05:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ukB5Fl5oFXnXmAY0dPX1
	xj3qfMZdyt7RO0lfnsfdjno=; b=UnqcGOk2nvSXTlbMnqgZmsYLSMDvVBeBVKGF
	J5iqm5up3a3HKUpGk/tH0o5JMtDRb98xcar0ysI0hWUA3TeBpTFPSqCbZ/1NNsmu
	79vS918mMer6X5izmBZfwv087pKYHHBCs9sdizSFeM5DwQXHTDNbzZGUNoXvlf8h
	fdUJzZLNjs3yBeV4rLIjFnvyJF31/btJYip2vHQQAVnBsQY82gCjtC+LIPRwGMXZ
	+9l7FiCKMMQM/00JiAsO196hAjXF7FDbNtHS269JU4MPkM+L7qKVCaC/J2fT24HP
	QAD/roSSS5TeSip3/u16sOdDhXP/p6C4Qxlk+lD2ZIGZYjrI5A==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 494wu132su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Sep 2025 05:26:06 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Sep 2025 22:26:03 -0700
From: yurade <yogita.urade@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][scarthgap][PATCH 1/2] podman: fix CVE-2024-9407
Date: Tue, 16 Sep 2025 10:55:14 +0530
Message-ID: <20250916052515.891345-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-ORIG-GUID: IR3aN6JeI_8ngdl8ZoyRMngrQTKJyAGB
X-Authority-Analysis: v=2.4 cv=EP8G00ZC c=1 sm=1 tr=0 ts=68c8f4ee cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=VZzbbjECq-QA:10 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=80lh4Q2-g6HarTfTuDUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: IR3aN6JeI_8ngdl8ZoyRMngrQTKJyAGB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDA1MCBTYWx0ZWRfXwW1NaAiRP2M6
 fSE2y+8QIYs+C9CkPRlu6a+hVSVom5xqOnngoxWJQmYZDdB4AP6QwqqadWhT6sM418rTNVfTQMa
 sg2Xd1xAzpUwOpOaNdFpMvwGxCG3Vvp6boQOcftHA8rxJTOetF6PkKPnhdT5odvwREE5eXifnMI
 ZMsueoZexY0KKkFU1oFNGQNKvtQcBjc/m/Tnx4Zydy3G6OAnK6PluTLs90qElKSS64Q384lMkO9
 +/rBkT+KBIoQ6uFDRAZXUNMLMsSeI9lH2wedGIEZCJdUBfDC3RVLIGGcIG7bnE9BvTCjhZMKnT8
 GCi6jS807pYgMXit2x55pjnxpyx5xpYGCmXDf9XSCgcoWtiBmMvVGD3BSLrTbk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Sep 2025 05:26:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9394

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
https://github.com/containers/podman/commit/2b2c7a89586d0e495b6bc5cc5687bab79162118e

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../podman/podman/CVE-2024-9407.patch         | 58 +++++++++++++++++++
 recipes-containers/podman/podman_git.bb       |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 recipes-containers/podman/podman/CVE-2024-9407.patch

diff --git a/recipes-containers/podman/podman/CVE-2024-9407.patch b/recipes-containers/podman/podman/CVE-2024-9407.patch
new file mode 100644
index 00000000..397cd362
--- /dev/null
+++ b/recipes-containers/podman/podman/CVE-2024-9407.patch
@@ -0,0 +1,58 @@
+From 2b2c7a89586d0e495b6bc5cc5687bab79162118e Mon Sep 17 00:00:00 2001
+From: Matt Heon <mheon@redhat.com>
+Date: Tue, 1 Oct 2024 12:38:45 -0400
+Subject: [PATCH] Validate the bind-propagation option to `--mount`
+
+Similar to github.com/containers/buildah/pull/5761 but not
+security critical as Podman does not have an expectation that
+mounts are scoped (the ability to write a --mount option is
+already the ability to mount arbitrary content into the container
+so sneaking arbitrary options into the mount doesn't have
+security implications). Still, bad practice to let users inject
+anything into the mount command line so let's not do that.
+
+Signed-off-by: Matt Heon <mheon@redhat.com>
+
+CVE: CVE-2024-9407
+Upstream-Status: Backport [https://github.com/containers/podman/commit/2b2c7a89586d0e495b6bc5cc5687bab79162118e]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ pkg/specgenutil/volumes.go  | 6 ++++++
+ test/e2e/run_volume_test.go | 4 ++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/pkg/specgenutil/volumes.go b/pkg/specgenutil/volumes.go
+index c481867163..5618b2d342 100644
+--- a/pkg/specgenutil/volumes.go
++++ b/pkg/specgenutil/volumes.go
+@@ -272,6 +272,12 @@ func parseMountOptions(mountType string, args []string) (*spec.Mount, error) {
+			if !hasValue {
+				return nil, fmt.Errorf("%v: %w", name, errOptionArg)
+			}
++                        switch value {
++			case "shared", "rshared", "private", "rprivate", "slave", "rslave", "unbindable", "runbindable":
++				// Do nothing, sane value
++			default:
++				return nil, fmt.Errorf("invalid value %q", arg)
++			}
+			mnt.Options = append(mnt.Options, value)
+		case "consistency":
+			// Often used on MACs and mistakenly on Linux platforms.
+diff --git a/test/e2e/run_volume_test.go b/test/e2e/run_volume_test.go
+index 4e777d62ef..5b256c9255 100644
+--- a/test/e2e/run_volume_test.go
++++ b/test/e2e/run_volume_test.go
+@@ -112,6 +112,10 @@ var _ = Describe("Podman run with volumes", func() {
+		session.WaitWithDefaultTimeout()
+		Expect(session).To(ExitWithError())
+
++		session = podmanTest.Podman([]string{"run", "--rm", "--mount", "type=bind,src=/tmp,target=/tmp,bind-propagation=fake", ALPINE, "true"})
++		session.WaitWithDefaultTimeout()
++		Expect(session).To(ExitWithError())
++
+		session = podmanTest.Podman([]string{"run", "--rm", "--mount", "type=tmpfs,target=/etc/ssl,notmpcopyup", ALPINE, "ls", "/etc/ssl"})
+		session.WaitWithDefaultTimeout()
+		Expect(session).Should(ExitCleanly())
+--
+2.40.0
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index ef9798f0..4086298f 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -24,6 +24,7 @@ SRC_URI = " \
     file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/import/vendor/github.com/containers/storage \
     file://CVE-2025-6032.patch;patchdir=src/import \
     file://CVE-2024-9341.patch;patchdir=src/import \
+    file://CVE-2024-9407.patch;patchdir=src/import \
 "
 
 LICENSE = "Apache-2.0"
-- 
2.40.0


