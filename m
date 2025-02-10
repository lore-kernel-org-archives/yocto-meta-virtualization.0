Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 886E2C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 08:31:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.46322.1739176309521512848
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Feb 2025 00:31:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=413644b4c0=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A5tQ9E018637
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Feb 2025 08:31:48 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44nx88snhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Feb 2025 08:31:48 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 10 Feb 2025 00:31:47 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 10 Feb 2025 00:31:46 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH V3] libvirt: fix installed-vs-shipped QA error
Date: Mon, 10 Feb 2025 16:31:45 +0800
Message-ID: <20250210083145.2939-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1822C9325CE187F8.703@lists.yoctoproject.org>
References: <1822C9325CE187F8.703@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 2J0qLcEvRwCXRMvCfEfd8C2jOcQrVWGQ
X-Authority-Analysis: v=2.4 cv=VZANPEp9 c=1 sm=1 tr=0 ts=67a9b974 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=X5hJq3LC1e5CMLFQvTIA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 2J0qLcEvRwCXRMvCfEfd8C2jOcQrVWGQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502100071
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Feb 2025 08:31:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9134

In commit [1], upstream added sysusers config file for qemu & kvm user/groups,
the install dir is "install_dir: prefix / 'lib' / 'sysusers.d'".

In commit [2], Yocto created an empty file libvirt-qemu.conf to override
sysusers config file which is added by commit [1]

While usrmerge not in DISTRO_FEATURES, nonarch_base_libdir does not match
install_dir and trigger an installed-vs-shipped QA error
...
ERROR: QA Issue: libvirt: Files/directories were installed but not shipped in any package:
  /usr/lib/sysusers.d
  /usr/lib/sysusers.d/libvirt-qemu.conf
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
libvirt: 2 installed and not shipped files. [installed-vs-shipped]
...

Use nonarch_libdir to intead of nonarch_base_libdir to match the install dir
in commit [1]

[1] https://github.com/libvirt/libvirt/commit/a2c3e390f7bedf36f4ddc544d09fe3b8772c5c6f
[2] https://git.yoctoproject.org/meta-virtualization/commit/?id=8138d9cc7e0c31171230110db0cfa881c46a821b

Suggested-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-extended/libvirt/libvirt_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
index 6a524977..b6f46722 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -95,7 +95,7 @@ FILES:${PN} += "${libdir}/libvirt/connection-driver \
 	    ${datadir}/bash-completion/completions/vsh \
 	    ${datadir}/bash-completion/completions/virt-admin \
 	    /usr/lib/firewalld/ \
-            ${nonarch_base_libdir}/sysusers.d/ \
+            ${nonarch_libdir}/sysusers.d/ \
 	    "
 
 FILES:${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug ${libdir}/libvirt/lock-driver/.debug"
@@ -204,11 +204,11 @@ do_install:append() {
 	install -d ${D}/etc/init.d
 	install -d ${D}/etc/libvirt
 	install -d ${D}/etc/dnsmasq.d
-	install -d ${D}${nonarch_base_libdir}/sysusers.d/
+	install -d ${D}${nonarch_libdir}/sysusers.d/
 
 	install -m 0755 ${UNPACKDIR}/libvirtd.sh ${D}/etc/init.d/libvirtd
 	install -m 0644 ${UNPACKDIR}/libvirtd.conf ${D}/etc/libvirt/libvirtd.conf
-	install -m 0644 ${UNPACKDIR}/libvirt-qemu.conf ${D}${nonarch_base_libdir}/sysusers.d/libvirt-qemu.conf
+	install -m 0644 ${UNPACKDIR}/libvirt-qemu.conf ${D}${nonarch_libdir}/sysusers.d/libvirt-qemu.conf
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 	    # This will wind up in the libvirtd package, but will NOT be invoked by default.
-- 
2.34.1


