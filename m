Return-Path: <vudupa@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEE3D1D873
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 06:44:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37478.1764830661804086411
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Dec 2025 22:44:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=AQ0O5tvN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: vudupa@qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B46ASaN135928
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 4 Dec 2025 06:44:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2qe/TljuBfwZoSLn2P2MR1vHGzEwOR76NUy
	tFFqpxV4=; b=AQ0O5tvN4YKBlfnVZypcjakZrBCUhv2E/GkpG8QXppNqARwJ9HH
	ncS5dluXaeqAagYWJxx79XhZGnO6M9UviwCdoqwm/cuJw/LvMme9IX1rDH1JGbKf
	vhlna7tQOY9Qv9euskJC+dbfiQVeKpREzRpdIbekXyCp/9qKoMQaLtrzp79SXOEK
	94rQZBLdj2n4KvKrMSbco3SMaMtljyaWHkqzUDy7cpx0Nms3+b6M9RUkQKu+Rh/e
	OFyHytrKiETF8moJnG9H3EQfaK+Ci8KGVpaFJi0zxUoa9mak1M+YubHj6I7SiAMi
	OQdBrfOEdKOhiZBH3cmIbmGp69BcEH1M+OQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0hu62h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Dec 2025 06:44:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B46iIwh000595
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 4 Dec 2025 06:44:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4aqswmu03t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Dec 2025 06:44:18 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5B46iHMh000589
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 4 Dec 2025 06:44:17 GMT
Received: from hyd-e160-a01-2-03.qualcomm.com (hyd-e160-a01-2-03.qualcomm.com [10.147.154.239])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5B46iHJp000586
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 06:44:17 +0000
Received: by hyd-e160-a01-2-03.qualcomm.com (Postfix, from userid 3978420)
	id 9292E51D6; Thu,  4 Dec 2025 12:14:16 +0530 (IST)
From: Vishwas Udupa <vudupa@qti.qualcomm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: anuj.mittal@oss.qualcomm.com, Vishwas Udupa <vudupa@qti.qualcomm.com>
Subject: [PATCH v2] lxc: delete empty lxc state directory
Date: Thu,  4 Dec 2025 12:13:29 +0530
Message-Id: <20251204064329.568898-1-vudupa@qti.qualcomm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eMOyC5xbErDpD-1oSkLhAN8VMGSqHEzN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA1MiBTYWx0ZWRfXxoPXyZncKX5b
 4TUpbOf9UqTEHWzGQ66a9OsSY50WIm/yo1mQ1Yk+OYGQiPzE0w1/nFC5Ele+CubazfRY5coCjGt
 fUp5hqYns3CyNy8Yzk2MvXLYe/DGUApNjh9a2Y9r4JLK2fTkLk6+C4Xy3IuzG1ETOC31ANNsOYm
 bREbofBGecC5KuISvdoKLmnTwzD43UJRHAwghkYof/y3b9EUfBvZ2uoL676Ft7SYf/CTfGb0Ouv
 U5ZJ/WXyhoK4GUNlTbzdbX+ZiCc2hR2FLDOBnm0wVrBOcHJ/kLXn/9xi2+ZJI0qCS212P1FxsgD
 v/1R34dXVi1lwOL8HvrVsAOR9zknFYDVAmtg4+yQ2HslcKqmpgRCT+gF3p6luo6UNZXFLB7clqj
 5Rr3EMQ5vUuajXgR1+gFTHUelZnXZg==
X-Proofpoint-GUID: eMOyC5xbErDpD-1oSkLhAN8VMGSqHEzN
X-Authority-Analysis: v=2.4 cv=V5lwEOni c=1 sm=1 tr=0 ts=69312dc5 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=8TO6Z-NECf0Wmy0hxN8A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040052
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Dec 2025 06:44:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9477

lxc systemd service [1] defines a StateDirectory to ensure that
the /var/lib/lxc directory is automatically created and managed
by systemd during service startup.
Do not create lxc directory at build time for systemd.

[1] https://github.com/lxc/lxc/blob/f9ff9ea2a92653a823edf25e8e28c9dab08b3090/config/init/systemd/lxc.service.in#L16

Signed-off-by: Vishwas Udupa <vudupa@qti.qualcomm.com>
---
 recipes-containers/lxc/lxc_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
index d6f137d3..542134db 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -141,7 +141,7 @@ do_install:append() {
 
 	if "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}"; then
 	    # nothing special for systemd at the moment
-	    true
+	    (cd ${D}${localstatedir}; [ -d lib/lxc ] && rmdir -v --parents lib/lxc)
 	else
 	    # with meson, these aren't built unless sysvinit is the enabled
 	    # init system.
-- 
2.25.1


