Return-Path: <patrick.vogelaar@belden.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0773BCA0EFC
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 12:14:31 +0000 (UTC)
Received: from mx0a-00015a02.pphosted.com (mx0a-00015a02.pphosted.com [205.220.166.249])
 by mx.groups.io with SMTP id smtpd.web10.15682.1756037670494709799
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 24 Aug 2025 05:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@belden.com header.s=podpps1 header.b=MJHOeljK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: belden.com, ip: 205.220.166.249, mailfrom: patrick.vogelaar@belden.com)
Received: from pps.filterd (m0264209.ppops.net [127.0.0.1])
	by mx0a-00015a02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57O9mONd021259
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 24 Aug 2025 08:14:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=belden.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=podpps1; bh=BijruzDiDzVAjgmV57VEW+btgLes4EHxkcXft
	4XE6MM=; b=MJHOeljKjy7GJ3m1A/Oi48h1zKvZRrf5yXMoINebHFV3C1Ts7ZL2q
	/kS4FDs+ReHapJ0FtC2bIn3oPy8RuSPgUGUplyBxpH2YzwouK2Ova3lgZbLS9nqO
	92iZC6XT8Mt6Xj7enRKIBOS1nUpRDEdm6Mp4GTP7tvQ6dOlOMMt2Y1PCALETqRqm
	au3I2sQuPBKu58oXInCUy4UsxbdHnFHI1dSEDjPzBK2XuT9o5emNcuOteYtXBC5G
	1V2Bv+cXF/5t74daIBDk8sXZ7jfNkg6Jv/hFk00A5Cci1FqIVt5yssJYeHoJ2O+M
	TkaVWt2IEwalaWhwgZAXzmpr7HSs+6xBA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-00015a02.pphosted.com (PPS) with ESMTPS id 48q9y91a57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 24 Aug 2025 08:14:30 -0400 (EDT)
Received: from m0264209.ppops.net (m0264209.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57OCDMDV008320
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 24 Aug 2025 08:14:29 -0400
Received: from relay1.belden.com ([12.161.118.81])
	by mx0a-00015a02.pphosted.com (PPS) with ESMTPS id 48q9y91a55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 24 Aug 2025 08:14:29 -0400 (EDT)
Received: from pps.filterd (dcric1ppa01pb.mcp.local [127.0.0.1])
	by dcric1ppa01pb.mcp.local (8.18.1.2/8.18.1.2) with ESMTP id 57OCBeHU031065;
	Sun, 24 Aug 2025 08:14:28 -0400
Received: from denec1lt1241.eu.gad.local ([10.1.2.1])
	by dcric1ppa01pb.mcp.local (PPS) with ESMTP id 48q8yu108p-1;
	Sun, 24 Aug 2025 08:14:27 -0400 (EDT)
From: Patrick Vogelaar <patrick.vogelaar@belden.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Patrick Vogelaar <patrick.vogelaar@belden.com>
Subject: [meta-virtualization][PATCH] docker: make ca-certificates a packageconfig
Date: Sun, 24 Aug 2025 14:14:14 +0200
Message-Id: <20250824121414.293436-1-patrick.vogelaar@belden.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-24_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 spamscore=0 adultscore=0 mlxscore=0 mlxlogscore=922
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508240116
X-Proofpoint-GUID: KVml0qZ5WcOCpxsgyAqJvX0fhaZ2qUhL
X-Authority-Analysis: v=2.4 cv=EfzIQOmC c=1 sm=1 tr=0 ts=68ab0226 cx=c_pps
 a=cuOCxa8MntS3/AsasmU/aA==:117 a=cuOCxa8MntS3/AsasmU/aA==:17
 a=2OwXVqhp2XgA:10 a=WDlp8lUfAAAA:8 a=4SZMf02-LMkw_P97CAcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA4MSBTYWx0ZWRfX3RkcwyQC/bsU
 MT0NUMKFhEcYD9n2/qJmyL2CEN2wlwV3XS6eS3ygyvOJB1mvBAAa6+TsVMnThWy1gnDij6C1Llz
 VZCw5VCWhOfwh+WUVrFRRsUAy9PiKGOK2NYBoEporxFm78KKrCbBTcwBQJy8BkQzW0U1UDpXTgZ
 HYIlm2mLhvinEkkPE55g4g0O/Cli6ZbQf3WbnTeUguaVLzvTOOlioWQuGGLPyu+hRcwPWYPwEko
 SuRoj61WNvUoHoK66/St+qLFFD1NYl0kMZErSh6DPqSHpy6tlioH8HtjlJNjKD489ZM05kYLeI1
 9dAq+Hme1kED3sjnZvljZfDxR/8oFCeGU+9TG1Wp63vb4uN89nFNzpO47wSsHdrbJbAsaz9kBhm
 w3TrNSmZ
X-Proofpoint-ORIG-GUID: 7dzZHaZ8q9O25RAOv7NjCKCc-HD9Q4o4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-24_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230081
X-Proofpoint-TriggeredRule: module.spam.rule.outbound_notspam
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 24 Aug 2025 12:14:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9357

Moving ca-certificates into a packageconfig allows using docker without
installing all the certificates.

Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
---
 recipes-containers/docker/docker.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index 94ee34db..c464bc3c 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -10,7 +10,6 @@ RDEPENDS:${PN} = "util-linux util-linux-unshare iptables \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'aufs', 'aufs-util', '', d)} \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'cgroup-lite', d)} \
                   bridge-utils \
-                  ca-certificates \
                  "
 RDEPENDS:${PN} += "virtual-containerd ${VIRTUAL-RUNTIME_container_runtime}"
 
@@ -37,10 +36,11 @@ RPROVIDES:${PN}-dev += "docker-dev"
 RPROVIDES:${PN}-contrip += "docker-dev"
 
 inherit pkgconfig
-PACKAGECONFIG ??= "docker-init seccomp"
+PACKAGECONFIG ??= "docker-init seccomp ca-certs"
 PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
 PACKAGECONFIG[docker-init] = ",,,docker-init"
 PACKAGECONFIG[transient-config] = "transient-config"
+PACKAGECONFIG[ca-certs] = ",,,ca-certificates"
 
 GO_IMPORT = "import"
 
-- 
2.34.1


**********************************************************************
DISCLAIMER:
Privileged and/or Confidential information may be contained in this message. If you are not the addressee of this message, you may not copy, use or deliver this message to anyone. In such event, you should destroy the message and kindly notify the sender by reply e-mail. It is understood that opinions or conclusions that do not relate to the official business of the company are neither given nor endorsed by the company. Thank You.

