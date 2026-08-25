Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2841EC61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 14:58:58 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24000.1787669932332632465
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 07:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Ka3qyQrK;
 spf=pass (domain: est.tech, ip: 52.101.72.19, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8qS4twMSbmJUk4mpRYq5zaG4+xYDCQHiY4VGLMRs8k++Fji4Ce/PNcz5l4sK9ASO+wQaP3HMdrZdfjufkddPuOZ1Qz1YjwWAr1hix9DSZ7RBs/BE9T7VseLI42CzVEFwj4BJeNTM1uG8VNT6vWpghpLlDFvhgNbJs4UrMaDX4RaWqNiBPXX+a14cRFTIkcEujwwJ0Nzvz8djmc9eLjE/ZDf7vixGj40ZYy0XFKa2YzZry0C1tJAe+Bj4axDm/5ZcTailgeR9hhScB26/8YttHxIqQe5Yj4ShC6zcBwEAX0DAU7tXwLbbvukxp82ePRG+obILBnjmW5mEVEceRsoSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXaFxxIDk9s7V6yYfXUpCXScIGno4uosoprLJvaADRM=;
 b=H0LbWgYvgK2wt/0XnarFAMeZSpKoEF1V8FOjgWqWXKkZh0/5iq4USmasMbGCtYMlMuvaq1PzpKWFMipCWOOwYZeVCZZiJDnnORE8YZXeUBnKsqeRh8Wq7GMj9xvnBrY1bRG41VONtF57SC7zL9qzQMn7wCB1H6ARrKJ1lC7wE9MPZWxTWVrfbA8TWkJJzGnPl1WECgAnl5sj5qh/x+ubm+/FOMaNwfDyvSWy3QorCLCCpu8p+26VY4fZCJfHEgVmhp4wgbi90bYLXPJ16vEQcsbYf0eIkVXR5jXkL1CsKc+1/pbO4L+yGJ3vyV5CduLAJLWng/e7hNo6NJY3P0M66Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXaFxxIDk9s7V6yYfXUpCXScIGno4uosoprLJvaADRM=;
 b=Ka3qyQrKe4xodqpTDiVG2nCyTT+4xtcJQz+wpxeo+WjbFJvA2Srgfh8UXmMlgaMatMSmW74BQYEm31RuFR3HAU3EWXsNPaqUmdG+yptZa+p1GDri1REmtW1kLKJEEs5TT7nlZZStu5cD1adlGKYpnlp4EaGHYmAuu9b4lwBrKTSvDBZMlB2PUFHcEZDImB74QHPGtHFPxpegwg7ok4walUqivFYAxU75I/+CjuXiQBM0M6TlgGlKgbkQOyvY2uqtb/Cn0KDue45eICeobMVvGq4plF4ZH/gkcScR48vdOYEKJCwhHk9OU9ECOblMR98I229Dl7cpA8zhwEIcCY4XpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PR3P189MB1068.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:40::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 14:58:44 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 14:58:44 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: meta-virtualization@lists.yoctoproject.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-virtualization][PATCH] meta-virtualization: fix trailing whitespace
Date: Tue, 25 Aug 2026 16:58:32 +0200
Message-ID: <20260825145832.63636-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0307.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::6) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PR3P189MB1068:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f41e86-6ef8-4e90-fae6-08df02b95c0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|10070799003|1800799024|10067099003|6133799003|10063799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	13B/5OhAcfQ4FSpGb8aRG4lVGxIrc+hrI4joBKy62Xh22xm9gum0mq1orOdo1pLpsylu2BHZWl6NX6+itQAUhXZTCuDGEpps7xXqeGDATLcBm84Rm8MmZmnm2FYW9cJ3AAWSWGvV7UNnwsn6VqVchz0Ju9NQ8IEMYJZ4Lx5xV553hB+ShiZEgRXZcN945X3ISoH3WPCGqqByHVZ7sgwY+lQjXPQNhwlKdNcQMDulYUjDJpCXiEpWoMMLgScAxMfgAlhgIo1Dih1YXis5hCVLBCrMb4Iw35V50dPYAf6LRiVfjdhoJETVHf5TFdf/FBY6iGmCknGCmBFbLHCdHz4gKSK1RDMJn0cJAjthroLR60lOeYwz8zKaHiRS3ZZPOf39u2R0AO5HXKfZPZ+34hQ661ynkP34fJQB/gD8f7PCzlq/Tv/28e+uk5Cd+XqDChs3qdSqM4xop0eK7WECTePTPt707KfJ/o5LoDpcXNnp7mPAXJKEYD3kp15D0jx9QpAgX1Mx4ETkZeVONY/D9A32vE5g2kVliz9atv4kDBZ2SXYtGnAUBpN30pzw1DnYs0Dv+F7q1qJhmPdjLuz8h0d56AR8KbSi+26u2cTvq6vXqLs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(10070799003)(1800799024)(10067099003)(6133799003)(10063799003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HgUCFdH+b5vDd8yn9CoTSdz6Y9c2aOLj+sCIqFNMXiOG+PSX3EJ5EInTnwUB?=
 =?us-ascii?Q?Qv68gq2w3pwlO/bkPXjwq/mVs65hECawRSotJ01bvoo54Zx3aKlWtGdxldci?=
 =?us-ascii?Q?etDVPnxW33lZpdwtRS5+p4BOVF5YQhXM6ivAwPV0KOfs2lS2qsNpRQlKXimY?=
 =?us-ascii?Q?Z7IN/ckBMQSKiiFxO/wa+EB8skuAIl6pBL6BFvxYXxFnwz5fBN0U92LAScnR?=
 =?us-ascii?Q?F9YVWLr872aim31gdOxD+humhKSFjSnALe/x0I0UAuvxQJ/lpeuU4HBFGc7z?=
 =?us-ascii?Q?qaFB7DZhevVejD2JBrDHafW++4F+j4m2609PwaZ10pU2EW5EGqgrp8MyspDN?=
 =?us-ascii?Q?wpu3WcFxzvVP0o2Lwt6edxBxaiC+WSTo186WE7sV+wKGuWKc9kv0953EdUDg?=
 =?us-ascii?Q?7IfF1csfTDCVV7lAZ2Qiib2eA656TscXkKLFH20XMg+c+yY+E1w6hbJtlOCd?=
 =?us-ascii?Q?VzJa0I5k3F+RccwZ6/l0MtuE8bCXmEELzFyzhun/lGYB/4/U67aCWbDDxdXm?=
 =?us-ascii?Q?GicWTsqSCzDBvNTHLDfzwJ6b0qZd1mAG/JrBHLju+yXHJ6v1ss/pBuW0zO4F?=
 =?us-ascii?Q?PYbtfINY66i3ZS2A6Dy8waErNFOTmQCzrt0MMUjPPP3jSfoU2kr4Rz9vmwX+?=
 =?us-ascii?Q?N7vXO4vYPKWmcmtpYt4rpcGgneDZqNjMc5A6jP/9RMIhVttHYVhBo7Q7+waW?=
 =?us-ascii?Q?yLqd/lVKhh99lqDOhWbhtK1mDf8QUveGIsnzsVoPxJvIFVynk3G2U3ssNZhU?=
 =?us-ascii?Q?YJfNck4RtWbngZhPtMffh+m1C+60RQ7+9ahdNxwzMlWB1jxBdP2hIomIpeZj?=
 =?us-ascii?Q?v8fd7EbBzjermuQMeVapGJbCOCuQq62RJQ/YTFDNLFXSLn5hFYfICXwIwvM6?=
 =?us-ascii?Q?y1srCD8r240V4sPepwtfEmAOUIjwc1aD4diPD1j15+LJ84XIS3+yVchuJCr3?=
 =?us-ascii?Q?FR9NVwBDM8i8IP+fghrKJaiT0VuP5JhYDTwRpAUhrCx0Rn4+OPA2MenPQ2wI?=
 =?us-ascii?Q?ehzbIKvUumLtSdPAb3UBtlmOA++TNPPhSS62GXVVUf0XLIN7YliIdtSdaaUX?=
 =?us-ascii?Q?fRltVoc52Kjyz0PfuGLTW4+6vkmnlkTgE+OpaXK8i6X1DHRha32HheGhkqIa?=
 =?us-ascii?Q?ICrQoho+GBwOacULLZaMqQ6vieeJNe6ikXpBsbxRuePotcnDINOLuaxBTcwA?=
 =?us-ascii?Q?pN7fw3wGBKaI5gFUlh7YpG6HZEAQ2WvKE+rAaaLoQdi6qD4PaKOZd0H1HY+T?=
 =?us-ascii?Q?on2W3GKIJllrdTuHvZBWbxmtv75uW5fquTKBzjiwhXk89I3YesAtiVX5S+6/?=
 =?us-ascii?Q?FRTcjYntAUrdh62VxavR4OeVWb02uDqoSDrmUibY+PHYjM25gcaz31laD1UD?=
 =?us-ascii?Q?xMZwHmw3GIjdaJ6Fr3BZlfA3NaOOMje97IwT+G/J1uFcNYPeYmj6UWOVqTiU?=
 =?us-ascii?Q?WDfVcUaY6iYu11LS2vyAQxkqXInpxn7m90ZVu20RcHqBjW70rN3rTjz8Z7XX?=
 =?us-ascii?Q?GBAx094G/wjN4Zy1gUSEktWkrr9Vi5DEIjFkoswCJFeUfG13AkhnIfcfjwcI?=
 =?us-ascii?Q?Ank8bBQk9nXyTS+Q8fSY1Jw4PMZ5P8RIn5A3vqbiEv1I8gWwkd9xK/gzrf9A?=
 =?us-ascii?Q?08t7eMw3B/RBbbxXfS9d3zsIQH2jLKhTsJM1xNMQxHuDRfyO77D8d8R2vun4?=
 =?us-ascii?Q?jfebKkP3LEipPzz2FJqfMB/43xkewsbMTS+w8p+B1iI/gwT4S0ODyf4OHFKx?=
 =?us-ascii?Q?a8MIHn2sJNaa8tjByAHANQZAAy5GS1weJbaQlKc6YdIrcTuIa/9kbvwN5WIV?=
X-MS-Exchange-AntiSpam-MessageData-1: XDgdyY8zkDWblu5+lNFyU1epZXPtNqhjcto=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f41e86-6ef8-4e90-fae6-08df02b95c0f
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 14:58:44.7962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVClwbUaCu6sgbv6rfSzawT2/Hcm/yTWWXUndBqDsUsc8oMCvWgCFuxNmy8cPV/a+57yZ1Sdr51/mXEwUiCSa3Yh5ruKbzlMQNIgiCr97WA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1068
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 25 Aug 2026 14:58:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10064

Bitbake now warns about trailing whitespace in parsed metadata lines.
Fix the affected files to silence the warnings during parsing.

Reported on:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/4284/ste=
ps/15/logs/warnings

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 classes/image-oci.bbclass                                 | 2 +-
 .../docker-distribution/docker-distribution_git.bb        | 2 +-
 recipes-containers/oci-image-tools/oci-image-tools_git.bb | 2 +-
 recipes-containers/riddler/riddler_git.bb                 | 2 +-
 recipes-containers/singularity/singularity_git.bb         | 2 +-
 recipes-containers/skopeo/skopeo_git.bb                   | 2 +-
 recipes-containers/sloci-image/sloci-image_git.bb         | 2 +-
 recipes-containers/umoci/umoci_git.bb                     | 2 +-
 recipes-demo/images/app-container.bb                      | 4 ++--
 recipes-devtools/python/gunicorn_26.0.0.bb                | 2 +-
 recipes-extended/images/cloud-image-controller.bb         | 6 +++---
 recipes-extended/images/cloud-image-guest.bb              | 2 +-
 recipes-extended/images/container-base.bb                 | 4 ++--
 recipes-extended/libvirt/libvirt-python.inc               | 2 +-
 recipes-extended/libvirt/libvirt_git.bb                   | 8 ++++----
 15 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbclass
index 141cd2a..441139d 100644
--- a/classes/image-oci.bbclass
+++ b/classes/image-oci.bbclass
@@ -128,7 +128,7 @@ OCI_IMAGE_WORKINGDIR ?=3D ""
 OCI_IMAGE_STOPSIGNAL ?=3D ""
=20
 # List of ports to expose from a container running this image:
-#  PORT[/PROT] =20
+#  PORT[/PROT]
 #     format: <port>/tcp, <port>/udp, or <port> (same as <port>/tcp).
 OCI_IMAGE_PORTS ?=3D ""
=20
diff --git a/recipes-containers/docker-distribution/docker-distribution_git=
.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index c519df5..28ac4b2 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -19,7 +19,7 @@ GO_IMPORT =3D "import"
 inherit goarch go systemd
=20
 # This disables seccomp and apparmor, which are on by default in the
-# go package.=20
+# go package.
 EXTRA_OEMAKE =3D "BUILDTAGS=3D''"
=20
 do_compile() {
diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb b/re=
cipes-containers/oci-image-tools/oci-image-tools_git.bb
index 3602621..e19d839 100644
--- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
+++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
@@ -15,7 +15,7 @@ inherit goarch
 inherit go
=20
 # This disables seccomp and apparmor, which are on by default in the
-# go package.=20
+# go package.
 EXTRA_OEMAKE =3D "BUILDTAGS=3D''"
=20
 S =3D "${UNPACKDIR}/git/src/github.com/opencontainers/image-tools"
diff --git a/recipes-containers/riddler/riddler_git.bb b/recipes-containers=
/riddler/riddler_git.bb
index e885c4c..768d8da 100644
--- a/recipes-containers/riddler/riddler_git.bb
+++ b/recipes-containers/riddler/riddler_git.bb
@@ -21,7 +21,7 @@ inherit go
 COMPATIBLE_HOST:mipsarch =3D "null"
=20
 # This disables seccomp and apparmor, which are on by default in the
-# go package.=20
+# go package.
 EXTRA_OEMAKE =3D "BUILDTAGS=3D''"
=20
 do_compile() {
diff --git a/recipes-containers/singularity/singularity_git.bb b/recipes-co=
ntainers/singularity/singularity_git.bb
index 32c505f..4d3770b 100644
--- a/recipes-containers/singularity/singularity_git.bb
+++ b/recipes-containers/singularity/singularity_git.bb
@@ -1,4 +1,4 @@
-# Skip QA check for library symbolic links (core issue is a packaging prob=
lem within=20
+# Skip QA check for library symbolic links (core issue is a packaging prob=
lem within
 # Singularity build / config: read up on the dev-so test for more info)
 INSANE_SKIP:${PN} +=3D "dev-so"
=20
diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/s=
kopeo/skopeo_git.bb
index 1225b48..f7f0722 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -42,7 +42,7 @@ inherit container-host
 CVE_STATUS[CVE-2019-10214] =3D "fixed-version: This CVE was fixed in the c=
ontainer image go library skopeo is using."
=20
 # This disables seccomp and apparmor, which are on by default in the
-# go package.=20
+# go package.
 EXTRA_OEMAKE =3D "BUILDTAGS=3D''"
=20
 do_compile() {
diff --git a/recipes-containers/sloci-image/sloci-image_git.bb b/recipes-co=
ntainers/sloci-image/sloci-image_git.bb
index 3de8d53..5d5418b 100644
--- a/recipes-containers/sloci-image/sloci-image_git.bb
+++ b/recipes-containers/sloci-image/sloci-image_git.bb
@@ -9,7 +9,7 @@ DEPENDS =3D ""
 SRCREV =3D "b45be2e049c5c55acb04a5edb017b793d2d9e677"
 PV =3D "v0.1.2+git"
=20
-do_compile() {=20
+do_compile() {
 	:
 }
=20
diff --git a/recipes-containers/umoci/umoci_git.bb b/recipes-containers/umo=
ci/umoci_git.bb
index eab3a6a..64db7da 100644
--- a/recipes-containers/umoci/umoci_git.bb
+++ b/recipes-containers/umoci/umoci_git.bb
@@ -20,7 +20,7 @@ inherit go
 COMPATIBLE_HOST =3D "^(?!mips).*"
=20
 # This disables seccomp and apparmor, which are on by default in the
-# go package.=20
+# go package.
 EXTRA_OEMAKE =3D "BUILDTAGS=3D''"
=20
=20
diff --git a/recipes-demo/images/app-container.bb b/recipes-demo/images/app=
-container.bb
index 8188d57..8e6756b 100644
--- a/recipes-demo/images/app-container.bb
+++ b/recipes-demo/images/app-container.bb
@@ -26,10 +26,10 @@ IMAGE_INSTALL =3D " \
=20
 # If the following is configured in local.conf (or the distro):
 #      PACKAGE_EXTRA_ARCHS:append =3D " container-dummy-provides"
-#=20
+#
 # it has been explicitly # indicated that we don't want or need a shell, s=
o we'll
 # add the dummy provides.
-#=20
+#
 # This is required, since there are postinstall scripts in base-files and =
base-passwd
 # that reference /bin/sh and we'll get a rootfs error if there's no shell =
or no dummy
 # provider.
diff --git a/recipes-devtools/python/gunicorn_26.0.0.bb b/recipes-devtools/=
python/gunicorn_26.0.0.bb
index de0bd72..2565bda 100644
--- a/recipes-devtools/python/gunicorn_26.0.0.bb
+++ b/recipes-devtools/python/gunicorn_26.0.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION =3D "\
   a pre-fork worker model ported from Ruby=E2=80=99s Unicorn project. The =
\
   Gunicorn server is broadly compatible with various web frameworks, \
   simply implemented, light on server resource usage, and fairly speedy. \
-  "=20
+  "
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5dc9171ccd8fcbd7827c850148b3ca9=
8"
=20
diff --git a/recipes-extended/images/cloud-image-controller.bb b/recipes-ex=
tended/images/cloud-image-controller.bb
index b192db9..69362d6 100644
--- a/recipes-extended/images/cloud-image-controller.bb
+++ b/recipes-extended/images/cloud-image-controller.bb
@@ -12,15 +12,15 @@ IMAGE_INSTALL =3D "\
     libvirt \
     libvirt-libvirtd \
     libvirt-python \
-    libvirt-virsh \   =20
+    libvirt-virsh \
     openflow \
-    qemu \  =20
+    qemu \
     kernel-modules \
     dhcp-client \
     perl-modules \
     grub \
     mysql5 \
-    python-twisted \=20
+    python-twisted \
     python-lxml \
     "
=20
diff --git a/recipes-extended/images/cloud-image-guest.bb b/recipes-extende=
d/images/cloud-image-guest.bb
index 2957506..58fcea5 100644
--- a/recipes-extended/images/cloud-image-guest.bb
+++ b/recipes-extended/images/cloud-image-guest.bb
@@ -5,7 +5,7 @@ IMAGE_INSTALL =3D "\
     ${CORE_IMAGE_BASE_INSTALL} \
     packagegroup-core-basic \
     openflow \
-    qemu \  =20
+    qemu \
     kernel-modules \
     tcpdump \
     dhcp-client \
diff --git a/recipes-extended/images/container-base.bb b/recipes-extended/i=
mages/container-base.bb
index 64655e0..6739b11 100644
--- a/recipes-extended/images/container-base.bb
+++ b/recipes-extended/images/container-base.bb
@@ -28,10 +28,10 @@ OCI_IMAGE_ENTRYPOINT ?=3D ""
=20
 # If the following is configured in local.conf (or the distro):
 #      PACKAGE_EXTRA_ARCHS:append =3D " container-dummy-provides"
-#=20
+#
 # it has been explicitly # indicated that we don't want or need a shell, s=
o we'll
 # add the dummy provides.
-#=20
+#
 # This is required, since there are postinstall scripts in base-files and =
base-passwd
 # that reference /bin/sh and we'll get a rootfs error if there's no shell =
or no dummy
 # provider.
diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended=
/libvirt/libvirt-python.inc
index e2a02d4..19625a8 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -2,7 +2,7 @@ inherit python3native python3-dir python3targetconfig
=20
 export STAGING_INCDIR
 export STAGING_LIBDIR
-export BUILD_SYS=20
+export BUILD_SYS
 export HOST_SYS
=20
 RDEPENDS:${PN}-python +=3D "python3"
diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/lib=
virt/libvirt_git.bb
index a327496..5d947af 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION =3D "A toolkit to interact with the virtualization capabilitie=
s of recent versions of Linux."=20
+DESCRIPTION =3D "A toolkit to interact with the virtualization capabilitie=
s of recent versions of Linux."
 HOMEPAGE =3D "http://libvirt.org"
 LICENSE =3D "GPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3 \
@@ -214,8 +214,8 @@ do_install_ptest() {
         # The virshtest expects virsh at ${PTEST_PATH}/tests/tools/virsh, =
but it is
         # installed to /usr/bin/virsh by libvirt-virsh. Create a symlink t=
o satisfy
         # the test's expected path.
-       install -d ${D}${PTEST_PATH}/tools=20
-       ln -sf /usr/bin/virsh ${D}${PTEST_PATH}/tools/virsh=20
+       install -d ${D}${PTEST_PATH}/tools
+       ln -sf /usr/bin/virsh ${D}${PTEST_PATH}/tools/virsh
        find ${B}/tests/  -type f -executable -print -maxdepth 1 | xargs -i=
 cp {} ${D}${PTEST_PATH}/tests -rf
        cd ${S}/tests && find . -mindepth 1 -maxdepth 1 -type d | xargs -i =
cp {} ${D}${PTEST_PATH}/datas/tests -a
        install -m 0755 ${B}/scripts/rpcgen/tests/test_demo ${D}${PTEST_PAT=
H}/tests
@@ -287,7 +287,7 @@ do_install:append() {
             fi
 	fi
=20
-	# The /run/libvirt directories created by the Makefile are=20
+	# The /run/libvirt directories created by the Makefile are
 	# wiped out in volatile, we need to create these at boot.
 	rm -rf ${D}/run
 	install -d ${D}${sysconfdir}/default/volatiles

