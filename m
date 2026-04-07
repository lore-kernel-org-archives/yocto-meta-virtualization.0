Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82321105D989
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 22:47:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.94199.1775602070474741506
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Apr 2026 15:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Q2biHIHB;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=I9F9BW7v;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637M6pgk2451580
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 7 Apr 2026 22:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5ftL+ntvp7n6/v+Ry2lDVJp3DHjMQF1rK2N
	S0tbrCQw=; b=Q2biHIHBEvryWBzRKkwlrqtirWYQYDUtKdFmx5ZANIEqFu0hfgV
	a2Kvs3UmOKv4FySZsL9DIk7lCPXykK8UJAqZmpBPxw0SrRP01+ZKn7WVhZoiTQiv
	Ey+b+sTevVpgoilPvoxuWZbHKYJ85vsX217QMGhYUwz5YCW3CKhi/lIqsBjGY374
	EvsYhX15jYvF3mWiQdFPriPfJoC6OVAwgzr9+J23FlS1USbBAMNXdY0RYWpAdOQ2
	m6InENc5aqsKsbpDP1N83r8vfuzSCv/W6GsYgG5RjBhOnI+7PYXSIC1JLloAfQVw
	cw/5SqR+QasyEFRckzXX+j9oO9qHCX6kOkw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddae6835c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Apr 2026 22:47:49 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12c20a91932so2602246c88.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Apr 2026 15:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775602068; x=1776206868; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ftL+ntvp7n6/v+Ry2lDVJp3DHjMQF1rK2NS0tbrCQw=;
        b=I9F9BW7v4efILg62ybTmtO2klA6/vDq6lojX2DX+pSovzrCDh7HKxTrU+uMPM5ibm0
         J7f09Qc7S1NA62qRj+Dq8OEUkQjrA02CPXx/NhBACUCaVaS4RY/j1OMNqTGbtI3f8S+p
         U6VNU6blFksCXYsmu9NzLalQNRQyY6YsPXz8X6QKKwj9LN/9MsyERNjx4Q+tW6rIOLqO
         o+7jhGVH+J8jqZdQiHlESinHWJ+O4exlKCg7U7dH2WB8ULiCHy39pkEsA2Gmlz2Fqm3S
         7omopBcC/FdQoZbXm/GlKprrychfe2hy/jPQajXUdojmbUfJrKKpR5ShjBCYtR+Y98rL
         lJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775602068; x=1776206868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ftL+ntvp7n6/v+Ry2lDVJp3DHjMQF1rK2NS0tbrCQw=;
        b=YUjnlZDGiRcOFF7Fvwo9Hdyxf5K0sBubJIUGMuYcvoyG2Mf/xdqVRH8wL0ZXuUYL+n
         5UVugEsqJ61RhX/9qR14heKNZ1W+T1R+TKQVOydC3lYn+CkxKKSdttfYIVgaoJ1QgaF3
         KGEVIKF4dhsI4oBNf2ToF4CApPk4CfYlj2Vz+MCa5dL9zgThHPtcLpmm8evdKNlt5aRK
         Wfbhjk9XHY5C04ziDZxw1440piSYleVpDkMxcpJbbjeTlpOcPYImQcB8Cx1gaVelS8yZ
         ZGA5rqmw4H1r8eoK2QtiGPvi5bWn2aicJzMgAl1sRRuSfK6zJDZYTLunfO0qxSe1iwxJ
         A+2Q==
X-Gm-Message-State: AOJu0YwfT+HpFiIiCblHnMo9K5/B8E38Gxa2dE1NfHO8sn6B2K1B+CB8
	4In5xi7+oGu/ZKqBg5D+Oj9klIEC5K6zw3H4Awl+zxGtwqZFRpXMQNCs7C/9au+dyvezwn4IrVw
	l0xhPT1hwXT1eweoqQWUAQmDR+edlNLJ70ZXVe1zw4NuwtEjk8VFpQqWp4yCCkpLecM9Sm5hplN
	4DnGVeIn4Lys5I31e2z4XY
X-Gm-Gg: AeBDieuHwBhkioN4wEbjL+33vYLz1MXNynYm0Da6x8oHk20qJbE8igeYrYQUcerShq2
	us0sm59vSmLkCAZUC12O4StaWF8+jXnpjCxT365xquBqzsDlQaSPIrm5AIzXP7yjs9O77/kz+NE
	APLeIbWqwcHSRs4jN8WLxJrNc1cJ0gAreTjTLVwrXgTL8dPNEXXho0BKKXwUmO+Xpf7n/PW7O6A
	i7kMitSZdV64Ogr/lbDNIXKk82/fFStHnZELlXzzRit6skND0TGFPtzFzGQ2wNR+HxDN7RGeQx2
	/DPmGiDifq0PrYSghywwRryasCknwersWWjlViLJza8Ik+HB4av3Sn3zpw8+1wmp258W4+R+FUl
	br3kIBPnKcr4CpJGD1xTsBieexVT2TQ==
X-Received: by 2002:a05:7022:6613:b0:128:cf5c:5357 with SMTP id a92af1059eb24-12bfb6ec4camr10333971c88.2.1775602067740;
        Tue, 07 Apr 2026 15:47:47 -0700 (PDT)
X-Received: by 2002:a05:7022:6613:b0:128:cf5c:5357 with SMTP id a92af1059eb24-12bfb6ec4camr10333955c88.2.1775602067020;
        Tue, 07 Apr 2026 15:47:47 -0700 (PDT)
Received: from evatuf ([187.65.214.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cc0c6ec215sm16434651eec.4.2026.04.07.15.47.45
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 15:47:46 -0700 (PDT)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] wic: move files to files/wic
Date: Tue,  7 Apr 2026 19:47:24 -0300
Message-ID: <20260407224724.510758-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDIwOSBTYWx0ZWRfX34TH39kau/2f
 OEtDNjfzvbYvFiJ0SXFTqg8JUJTYJ0yYRCEoI6f/c625lobGjXvD1tcBymGPMpAMabg60fOTzfp
 vPQGjTfBumVdxa/xaOJ1owHVhl2v+hppo+L6NtxKvl5bOpEi4cGUEspmSb1/wX1oRVl4cvQML1U
 9Y3S2WT1RMT9ljKKFLsHLVZ+1cDWHrpGwpEon6xnq+I++piJNJuZqGy05BCMXsY6Z6tZKUAPOWg
 dvQRZ0gHZMgk3MYihtRyE3NGs2pYHBYkGr2bACF4mLpZma9KUL9Z7n4vvzrvkHh2YsnWFLHFSpi
 ug7mO+/tbTnQu2U5d7iWwD70yoj9G6THbgnUnfOyrLCXupC2zH5OD2pBFZHywJOMbP+Uu5svdaa
 q9v1g17TOIAMAKAvIaFnl2LwrbGmhD90bhRTCZww/hSqt4agFrEV6gzyCCwy+Y+8uzA7XDi1+Jm
 NBsyRbHNe4LKwsSQMTw==
X-Proofpoint-GUID: VLQerlNWnM-pBFR2LqCl0VV61QeoDnYy
X-Proofpoint-ORIG-GUID: VLQerlNWnM-pBFR2LqCl0VV61QeoDnYy
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69d58995 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=5XGjxTY8yYkUmB1D1iF5Cg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=y30RpWWPrUE8_umzoLoA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_05,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070209
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Apr 2026 22:47:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9687

Move local wic files to the new expected location files/wic, needed after
the wic migration to a standalone project outside oe-core.

Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 {wic => files/wic}/directdisk-bootloader-xen.cfg | 0
 {wic => files/wic}/directdisk-bootloader-xen.wks | 0
 {wic => files/wic}/directdisk-xen.wks            | 0
 {wic => files/wic}/qemuboot-xen-x86-64.cfg       | 0
 {wic => files/wic}/qemuboot-xen-x86-64.wks       | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename {wic => files/wic}/directdisk-bootloader-xen.cfg (100%)
 rename {wic => files/wic}/directdisk-bootloader-xen.wks (100%)
 rename {wic => files/wic}/directdisk-xen.wks (100%)
 rename {wic => files/wic}/qemuboot-xen-x86-64.cfg (100%)
 rename {wic => files/wic}/qemuboot-xen-x86-64.wks (100%)

diff --git a/wic/directdisk-bootloader-xen.cfg b/files/wic/directdisk-bootloader-xen.cfg
similarity index 100%
rename from wic/directdisk-bootloader-xen.cfg
rename to files/wic/directdisk-bootloader-xen.cfg
diff --git a/wic/directdisk-bootloader-xen.wks b/files/wic/directdisk-bootloader-xen.wks
similarity index 100%
rename from wic/directdisk-bootloader-xen.wks
rename to files/wic/directdisk-bootloader-xen.wks
diff --git a/wic/directdisk-xen.wks b/files/wic/directdisk-xen.wks
similarity index 100%
rename from wic/directdisk-xen.wks
rename to files/wic/directdisk-xen.wks
diff --git a/wic/qemuboot-xen-x86-64.cfg b/files/wic/qemuboot-xen-x86-64.cfg
similarity index 100%
rename from wic/qemuboot-xen-x86-64.cfg
rename to files/wic/qemuboot-xen-x86-64.cfg
diff --git a/wic/qemuboot-xen-x86-64.wks b/files/wic/qemuboot-xen-x86-64.wks
similarity index 100%
rename from wic/qemuboot-xen-x86-64.wks
rename to files/wic/qemuboot-xen-x86-64.wks
-- 
2.53.0


