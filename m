Return-Path: <Haitao.Liu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EA1CD6E43
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 03:01:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2674.1780023650562150229
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 May 2026 20:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Hu/5hzwD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06090f33be=haitao.liu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T2D4pF2982308
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 29 May 2026 03:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ums2uROcY4+tVByrKhXo
	2rJWWkL5ImueR48oBRRRJco=; b=Hu/5hzwDXzCoU36bS2GX+RsBiegkz77s14wx
	A8Brt17mE0GEIu/p/TkAkcWTn5vm24h1Zr4BSyPN899iYfK6itVONDqEAPq8EeNt
	jt0c73dmH+9xAoVhgX2QZNxgMXzXU4oAcmkgq9efaiW1U1ODupcQxQrcOA8IYtu5
	zJCOeRajZgcPYv7QkK3ZVU2qWI0yautb0hUGBNs+LmO4P7FP4HiJ+oESqjmFlpOD
	q9aJwS1wqcE9uuYF9tvS1QAmgrInrAVoX5l9b34l5m7BgxmJyxWEEOC0ZpkczpH4
	I3V7aTCZ1rVcWc6laxFBMy+EiddhFNbVp5x7xrEGEOQ/sYLEFA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ee7x8su55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 29 May 2026 03:00:49 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 28 May 2026 20:00:47 -0700
Received: from pek-lpd-susbld.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 28 May 2026 20:00:46 -0700
From: Haitao Liu <haitao.liu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][wrynose][PATCH 1/2] libvirt: update to v12.2.0
Date: Fri, 29 May 2026 11:00:39 +0800
Message-ID: <20260529030040.1487113-1-haitao.liu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 9WvkRkt2Hv7coUUqdr_2B9xzoKjZxYVI
X-Proofpoint-GUID: 9WvkRkt2Hv7coUUqdr_2B9xzoKjZxYVI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAyOCBTYWx0ZWRfX7neE3f++wfKK
 3vAn9sB99zoomj/IUT9wMfAmN2ymPsQuqt7a9p3jDMCJb3MF8mswmjn5UERhE/E6PG291y5v2ZO
 4p3DBz/L7IdnlX/99scVtv5mFqvgJX2D+4u7o6y28l0hFJter/JJ3IS5TW07UXa11Q3ZkYxaC/S
 +ZWSJ2DM8TSb4qlUZ2LgaPJLMH7ouqEOwfI6UZhtXdePdiqxFh3X03DqgnpCO+z4I0XKpR6DMRy
 eTLRt/22dSCRREePuYcWZs4C4E4nFWomqhYSd5quIbu0yDJjydNMeJw+2Xa6rtzUs4pExbKIEmM
 RRVS3a7C6tLkVIxbwbcCFDAnuqW68u01kgYlyi+q+fNyUzxmuCoBzES8fFyaB/GhfdEtts8Kemp
 SRiX5RZzkwLGQJ8UA3MZl5UJKnvJEpRPMbKS6oHMCD7vVGUxwDGNINDbbyLqx59QkQk43AOHWWn
 1oPK93kV9Yjj1xt11zA==
X-Authority-Analysis: v=2.4 cv=E6v9Y6dl c=1 sm=1 tr=0 ts=6a190161 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=8Ad4tvYqdmIA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=SqMvC5kiAAAA:8
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=eqPuKCMO8Yi_H6ZatjoA:9
 a=_o8VnCo6Hb5Oqlm6Mk7M:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290028
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 May 2026 03:01:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9823

Bumping libvirt to version v12.2.0-93a00a3db8c, which comprises the following commits:

    93a00a3db8 (tag: v12.2.0) Release of libvirt-12.2.0
    f9c95bdbd0 NEWS: mention new hyperv features
    8850040735 NEWS: Document 'handle' fs backend removal, blockjob backend zeroing and stats for '<dataStore>'
    d2c6b93f4e NEWS: Document IOMMUFD fixes and new features
    f5868958e4 NEWS: Mention VIR_CONNECT_GET_DOMAIN_CAPABILITIES_EXPAND_CPU_FEATURES
    473b1d917c NEWS: Document features/improvements/bug fixes I've participated in
    2f8013287a qemu_hotplug: Set correct iommufdState on error path
    e46934cd98 (tag: v12.2.0-rc2) Translated using Weblate (Czech)
    b96ea4db3a hypervisor: Call virWaitForDevices() after detaching host devices
    3a91192252 util: virfile: Don't over-allocate buffers in saferead_lim
    a719ab7344 util: virfile: Document the various functions for reading from file/fd
    4fc09da299 virPCIDeviceReadID: Fix use of 'virFileReadAll'
    59684e9cc1 virNetDevIPCheckIPv6Forwarding: Don't NUL terminate buffer from virFileReadAll
    747a74dd05 virSecretLoadValue: Don't re-termiante the buffer
    58b3a78aff virPCIDeviceReadClass: Don't write beyond end of buffer from virFileReadAll
    458c6a2810 util: file: Shrink buffer returned from 'saferead_lim' to actual size
    74b24ffc24 secret: config: Don't leak 'cfg->secretsEncryptionKey'
    4a363bdfe9 qemu: driver: Don't leak 'qemu_driver->backupPorts'
    f590a18da6 (tag: v12.2.0-rc1) po: Refresh potfile for v12.2.0
    9d99334bba Translated using Weblate (Romanian)
    d3667c0bad Translated using Weblate (Korean)
    d1223c502f Translated using Weblate (Chinese (Simplified) (zh_CN))
    a99d11bd22 Translated using Weblate (Spanish)
    b1d88f766d Translated using Weblate (Spanish)
    616c618a2f Translated using Weblate (Spanish)
    397b1f9cf0 Translated using Weblate (Spanish)
    0fa4d624fe Translated using Weblate (Portuguese)
    26263b5600 Translated using Weblate (Georgian)
    a8ee17c8a3 Translated using Weblate (English (United Kingdom))
    0f52d35b1b virxml: Fix virXMLPropTristateBoolAllowDefault() documentation
    a52ba0ae7b tests/virhostcputest: Remove duplicit g_autofree
    83f49f6335 util: Fix comment in virBitmapNewData
    e2e1b02ae4 qemuDomainGetBlockInfo: Add debug statement when updating disk physical size
    ce56dc26f4 qemu: monitor: Separate stats from capacity properties in qemuBlockStats
    5f081c4b2e qemuDomainGetStatsBlockExportDisk: Export stats also for 'dataStore'
    d731d54a57 virDomainGetBlockInfo: Log 'disk' argument

Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
---
 recipes-extended/libvirt/libvirt-python.inc | 2 +-
 recipes-extended/libvirt/libvirt_git.bb     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 6738193a..c37a9ebe 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -20,7 +20,7 @@ INSANE_SKIP:${PN}-dbg += "buildpaths"
 
 SRC_URI += "http://libvirt.org/sources/python/${LIBVIRT_PYTHON_ARCHIVE_NAME}.tar.gz;name=libvirt_python;subdir=${BP}"
 LIBVIRT_PYTHON_ARCHIVE_NAME = "${BPN}_python-${LIBVIRT_VERSION}"
-SRC_URI[libvirt_python.sha256sum] = "2cc02c0b91a9abd140185feab46b33281091d4deffbc1bbfdb68ce682359f2b0"
+SRC_URI[libvirt_python.sha256sum] = "742147988bba7d400f6892beeeb7e0a27758f10ff65421b569b7b4b6a2572e44"
 
 export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS = "-I${S}/include"
diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
index 34a1ff21..cb5d3482 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -26,9 +26,9 @@ RDEPENDS:libvirt-libvirtd:append:aarch64 = " dmidecode"
 #connman blocks the 53 port and libvirtd can't start its DNS service
 RCONFLICTS:${PN}_libvirtd = "connman"
 
-SRCREV_libvirt = "9fa6beff05728a32dd11f7ccb7e3c97fca510029"
+SRCREV_libvirt = "93a00a3db8c8b5e3ee4a97ff2539193e5e7accff"
 
-LIBVIRT_VERSION = "12.1.0"
+LIBVIRT_VERSION = "12.2.0"
 PV = "v${LIBVIRT_VERSION}+git"
 
 SRC_URI = "gitsm://github.com/libvirt/libvirt.git;name=libvirt;protocol=https;branch=master \
-- 
2.34.1


