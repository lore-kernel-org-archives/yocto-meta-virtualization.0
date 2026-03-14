Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DA410706D5
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 12:16:45 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8582.1773490598204443248
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 14 Mar 2026 05:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=R1zfyt6D;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=eMyWnR4T;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E3nw0J2907986
	for <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Mar 2026 12:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ux0y9bRtZIvDBFe2hPNBdoQYoaD23KQ/Ry/
	DiTydyEM=; b=R1zfyt6DYeGgYhe8CR8KFra3wDNrf9+pCYoUCSexXFoidhox3LI
	QcB7l8pDwuVoS4hypPPawYVFZpS8rIl6xoaOqKZI9iCiIumLJNrARrDNyeHDJLSS
	et6aV0pGHs+7U8XJwpWbocQMd+kY2gkZ2KIsdS9eP5tiUK2OpjYU+4z324VFvVcC
	8sgvtJB26BBox83xJhr0BYLn8MiWdMBspvlpQTSWWdfPk5xtFNNdY/D5i/kSshHK
	ieA51RaAmfwFQk3k8dyclJPWUHW5t2oWan47k9uc+J0Xq9eK/HXcPpKghCvvvQAr
	ETlyjmko+yQSSGAkyvTALCnHSM+p27hn6Dw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw043gqrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Mar 2026 12:16:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3594620fe97so21862924a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Mar 2026 05:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773490597; x=1774095397; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ux0y9bRtZIvDBFe2hPNBdoQYoaD23KQ/Ry/DiTydyEM=;
        b=eMyWnR4TVroAZ+PwLt31jowoKtais6W6kjTwWGl8fJ3xy7DVzfCSOFtZRfEoUUb8Vl
         IRNjJVrn7Ccd29nE9gCSmSr4C85RqBoaSHDYo5X2PeJSLNdt0UQaaz4arSZJPDt9CcRl
         D44RGmKzbGVaJIhzxbC1QC4V8YCjN6b85NUhXfB6GzKKKMRHNN61x8Madnrk1qo80Iut
         bSEgxjEL3oIXVPkuMtW0ZgGMKEsBykB4oWSYnvtZxXBaspdk7dyKE7jMOCGrZKaaoWfZ
         Ph+GuEsDH5vDGQg2ZALaDxraFIfKr/yWrwM4ZpUPXj0fkYvV/zPqOmCXouiPRBkdwEyI
         ahNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773490597; x=1774095397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ux0y9bRtZIvDBFe2hPNBdoQYoaD23KQ/Ry/DiTydyEM=;
        b=D/BgykX3l4YxpBZCEjDdyuK2nLmIj07+ggjK2ELJYx2a8p6FkFnq2wAi8+OjqMHyGm
         l7JV7pGXErRg8aWqSsstx7Rlx60U8dakZytUVoLOsfTD7bfW4cMRtV/5vl59bmL0uJMo
         rZF8Eiv2rUG+cTAlCfQBfPy+SFOMGU+6jifLqB2QbXCsYdRCFCvTEeLKkspT2Ola2FgD
         gO9qAqZUiXx2rFC98+JEnlIHlAbjldIsVhOWYydlJ0gXH00HEvHns9jJHRtyZZ314pUA
         CBlwRpZYbnHhHiX37qY//Z0QPTIBYyCJj/vfSiCCXxZHhQnaxbT4xxPQosLo2jTyCRVf
         S/cg==
X-Gm-Message-State: AOJu0Yyeq94Kmzv0fQrPkZQo5LAwO2d9RmXeA2/vssykijglub9xTs38
	SDXgeEZtr6XB21ppAzzcc4bjQYhaeUOHoB6T0SF1mXtRYtcxIjtcqTjG6dYdEzObh0VeqIXt4hN
	MrkZRvr9/uu4472NOH3VircBG/sVNB3HPyPZD5+EMlg7uLCyKjAVQP+nTIWlCqMpeDDWkId1wXY
	oP0xOQsYElXq0/OgytYw==
X-Gm-Gg: ATEYQzynd0dvWRM2vq6ahrS5mJGX6L9vwz8U8yzKVtqYGWHZuq5ZsH4IvPWdUyag0Pv
	pvlDKc6to8pEODevWy4CPsm8Nnmc+0YqydxsuBiMsgO661AXuNxqsQKoEW9jX2clBcta6Gssvuj
	WTwo+QhyVjBWxAhb67EioRd3pXJavbeGiYl6Jrp41FAMZu9xtpWrBTuLDNl0d3ibfMZXH6bRqRu
	iiDl2BhAjwYY/vkP1R1rlDrwS0HcoF7WpjUKBrVxWFv/dIjgiuYg4EfLwkBlXfMGQHsbQrsmtyo
	hqNrPb2cCjjhNHumgICOIKl835x5aJbwiMBgqZ0jQyLEUoumT6M/RVRvxAlUbZzPQN2KJXjCHST
	0dRFCO/PGD5G13C7LGEXwQXf09GH7uCVV54rSVw6jqFNrSgC9wo+AdfD1bZHLT42tECwyRGg5Op
	zMt4i2tQhSFIu+XfAFWwg=
X-Received: by 2002:a17:90a:d006:b0:359:8e1c:53e with SMTP id 98e67ed59e1d1-35a220b54d6mr6328038a91.31.1773490596669;
        Sat, 14 Mar 2026 05:16:36 -0700 (PDT)
X-Received: by 2002:a17:90a:d006:b0:359:8e1c:53e with SMTP id 98e67ed59e1d1-35a220b54d6mr6328012a91.31.1773490596049;
        Sat, 14 Mar 2026 05:16:36 -0700 (PDT)
Received: from hyd-e160-a01-2-02.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb64819sm4967505a12.22.2026.03.14.05.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 05:16:35 -0700 (PDT)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [meta-oe][PATCH] android-tools: add fix for strchr() conformance to C23
Date: Sat, 14 Mar 2026 17:44:59 +0530
Message-Id: <20260314121459.2875362-1-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDA5NSBTYWx0ZWRfX1hNaC1lnrbSF
 Hw5cfBufcsKWnrsYBPsmL0wUgnetNPPb96X5j5xVNAVbGW95+8fovziNFVpQbPDeS3pv7/f9s0o
 QzvgmIF2EhZLaDU14Bha3fO3QahwBvCnCqwHY6aXRR5Mu/WHD39RTpNUCdtOreIFvUQb2Vz9itb
 SWrfttVW9C5M1Mus/C5f/73BProX8vJfJY4sneG+tFdoj1xWNJqAtSaCvtJbZrkERfD7K/fyGk/
 n6LIwWCBft3VIw8tQ48SSu6kRH7GZZoIufH/w8dvNOqV6JqLK6tpit1EBm5i3g/czrtpCk1xq8U
 iPj1JVS/igQbd4O2mj5Rfop/xdoFSup1uuXzBUnWrZSbFNWjeXiX6/KMradb+NYdEPCGl+r4Qzh
 I/fwlXWKHbDzu9PoZibS/ZqGh2j7mSXyh6XF7IWQC56rzbU6Fs72+2T/K399Z9m4got8oTPA9OU
 cturbPthspU/TOrMbZA==
X-Proofpoint-GUID: jv7UWk9xhPDmVZHnBpwOerwsPpaB5Jcg
X-Authority-Analysis: v=2.4 cv=fLs0HJae c=1 sm=1 tr=0 ts=69b551a5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=SZdcAycclXX2kHHUgkgA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: jv7UWk9xhPDmVZHnBpwOerwsPpaB5Jcg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603140095
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Mar 2026 12:16:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9656

Building android-tools v29.0.6.r14 with glibc 2.43 fails due to ISO C23
changes to strchr(). Add a patch to update the affected libunwind sources
to use const pointer types to fix this build failure.

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 ...nd-fix-strchr-conformance-to-ISO-C23.patch | 27 +++++++++++++++++++
 .../android-tools/android-tools_29.0.6.r14.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch
new file mode 100644
index 0000000000..4da65ea285
--- /dev/null
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch
@@ -0,0 +1,27 @@
+From d91f5324f809c3a5b0343927716e4b99bc31db53 Mon Sep 17 00:00:00 2001
+From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
+Date: Fri, 13 Mar 2026 18:57:36 +0530
+Subject: [PATCH] libunwind: fix strchr() conformance to ISO C23
+
+Fix uses of strchr() to conform to ISO C23, supported since glibc-2.43
+
+Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
+Upstream-Status: Pending
+---
+ external/libunwind/src/dwarf/Gfind_proc_info-lsb.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/external/libunwind/src/dwarf/Gfind_proc_info-lsb.c b/external/libunwind/src/dwarf/Gfind_proc_info-lsb.c
+index 77ed3d09..37eadf52 100644
+--- a/external/libunwind/src/dwarf/Gfind_proc_info-lsb.c
++++ b/external/libunwind/src/dwarf/Gfind_proc_info-lsb.c
+@@ -248,7 +248,8 @@ load_debug_frame (const char *file, char **buf, size_t *bufsize,
+ 
+   if (*buf == NULL && linkbuf != NULL && memchr (linkbuf, 0, linksize) != NULL)
+     {
+-      char *newname, *basedir, *p;
++      char *newname, *basedir;
++      const char *p;
+       static const char *debugdir = "/usr/lib/debug";
+       int ret;
+ 
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
index 74928ed171..3d4e95b496 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
@@ -22,6 +22,7 @@ SRC_URI += " \
     file://debian/external/libunwind/legacy_built-in_sync_functions.patch \
     file://debian/external/libunwind/20150704-CVE-2015-3239_dwarf_i.h.patch \
     file://debian/external/libunwind/libunwind-guard-unreachable-macro-to-avoid-redefinit.patch \
+    file://debian/external/libunwind/libunwind-fix-strchr-conformance-to-ISO-C23.patch \
     \
     file://debian/system/core/move-log-file-to-proper-dir.patch \
     file://debian/system/core/Added-missing-headers.patch \

