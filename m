Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C733C83013
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 07:03:52 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.17769.1751439823129506835
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Jul 2025 00:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PRQL0d7i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5626UJWC032111
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 2 Jul 2025 07:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KyyhBNhghL/P+x3PcY3KKPvTxz/GHOoKdGW
	liG6Oiow=; b=PRQL0d7iReVwLLl0NDiBOtGFp7FpxACD9kZATY4oqLSh9IBNBJy
	jvGkJUoU2QzE/Shyd/G1jm//sBVrNUSidLZBu1m2pm69WVTeKDe8lq8SSq18jdQ1
	C34hlIcjvQEdXwwN+mtgdv7qagGUf+O94cVStmiarJjNxGKolsc/tJQwmtu99uig
	6CcH/kQ7XMSvjBjdKUsUa8xdkD8EAvwsY7+Tyn0UiL5ia17UhZSQlKRgUy/8PLJ2
	8mV4sQRicZygkD1+J4sNQ2K5QVKCXrB2LVlnNoCE0saiZImJ91/rF8I03JLb1MzC
	P8SwqHuC2gUmahML5Y+CocNThCv8iPnF6Ig==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kbmd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Jul 2025 07:03:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d40f335529so1178119785a.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Jul 2025 00:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751439821; x=1752044621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KyyhBNhghL/P+x3PcY3KKPvTxz/GHOoKdGWliG6Oiow=;
        b=KW7WvRU/sFGlnc9DHb9Z+0apLhqSQPJOi9L2rcmaXZtlJIstow01V0JJqi79RTWEkh
         7aLpQ93kttOh0sYKL0PjS/Vy/f1A05+36PTaK99hnyMAxw0yldyUG9bgi4vKSf/1NWhd
         z/JOT0om8nsAmggxSQPgL973cEYHYHaYWazF2TtXSOzjYns3DqS8Y6jUV0tA1Njz0r/F
         2esUZctFCPeGhO2BTiaX5fBgxyGELFvya7U/SP0p9krrFAJQdiVEifFjkWZT4LF8X0wd
         R1R4mBoineo38gB0P+MVnZTuQPLE+LtXCnLwwK60oGy3o7FpjjMSZ0masQH0g7PqDBLs
         3Zdg==
X-Gm-Message-State: AOJu0Yzeu+8rsdg3EKckX6IrIicpwWEfhKnjybZiWp11KPiXymCgJaLv
	wqVWtTm9X7gw5NcG32jQ6p5V3Lbg1el9ZexWowecJCGwlphueHUIzJSnOCx6SEkIhj4Qi58BQnV
	Cz5aCsHuUbzhv10xn+nnLcawQLfGCAdxajSZuPT7EUo5S8nyJ8kQWlQrJHkqPBtS7n53tsMlaS2
	UQXqGKFplRiXEw9InW0Q==
X-Gm-Gg: ASbGncuPKacoA8b+sQMuQQm6Mow1eCQ7FBPXSN3OOLHF596ejaVMzmbG7/7HblcqmhV
	EqeR+qv80Erk0iQpPzIX7xG7vITwOW6OCmWWP6R3whvg3xSZ4X2Q7ahfuiXBfpjpHlMqH4LOieL
	s5Xb9g/fsOxCzDmysQe0VyS0guQSCvfRFu0Ft+iZfiswFjVLxJRLzwiB8AMeRX08EN73vM6fe5d
	A7rZAdVPuWlFkIEqWKnayo5O3XcobVsvH9dss3GDzRstL6yARigv+nHerhqqc1Z3N2JN9b7tRHu
	y65ygWdYA1for/YfRb/8Rw+8frvXXQKrxbRFW0kOMUxmbR9HaC7JHpEqc85UZWLEr1KPSqCBS2h
	4hSQ=
X-Received: by 2002:a05:620a:462a:b0:7d3:f8bd:f34c with SMTP id af79cd13be357-7d5c50d9d28mr224412085a.10.1751439820483;
        Wed, 02 Jul 2025 00:03:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYjIk9Cm35eQqMcQ7MAi3bkdpiZyjipCfzOPrKW3I7w0jJk0XJgCuZ/fUnmK6MLikAbWROaw==
X-Received: by 2002:a05:620a:462a:b0:7d3:f8bd:f34c with SMTP id af79cd13be357-7d5c50d9d28mr224403885a.10.1751439819925;
        Wed, 02 Jul 2025 00:03:39 -0700 (PDT)
Received: from localhost.localdomain (082-163-040-105.jonaz.nl. [82.163.40.105])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b221sm1022872066b.36.2025.07.02.00.03.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 02 Jul 2025 00:03:39 -0700 (PDT)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [meta-virtualization][PATCH v2] Docker: add more required kernel modules as RRECOMMENDS:${PN}
Date: Wed,  2 Jul 2025 09:03:27 +0200
Message-ID: <20250702070328.89514-1-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6864d9ce cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IQEsc5u+BqvcbVO/417rXg==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=4Qw2WPkzrlztrcxQjFMA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA1NSBTYWx0ZWRfX2BswTso5ZLRf
 AV04LcpeaMrYPMEnUEOlbb6MpFhhc21m+OYFfJ/gHKIFerLbNkwUotaP6DXZKFSIJgPhpk43we8
 hpKiuCJ/b4StBwfw6i80JOJRlUJPoz3GmPFyAG+PZk+op5EVzaV2jCZetBmNqnIIohHDf6cmJrZ
 GSbW2ahsgJBVaPoQJe3OgdoulGhZn66MDAor2frCyUPgeXOwDp/zdXCILToRMKvsthVVrKMXg6Z
 HdzDc1OuLnvz/dpJhz2RY8cNrP/JNUJGjs+TyoowOz1nq7gyYPmC29ToDeAyjM3A2NAUwycYqkf
 Y0lHLEVXPFhY9Fqn0Iicx+v6COH7FnRZlCBigf7tLAVyPSmW8mTS4PIbI6H3IgHLF03pdyvIn6h
 OCP3gNZnlBK+SF0ZFFnasg4HkoV0+PDse3A/m0j8uygCRGjBehnQEYByR7a68GRPSO+NiU0K
X-Proofpoint-ORIG-GUID: CB6Y5t88ccEdxR0Ygtz5yMjRDxBz-afY
X-Proofpoint-GUID: CB6Y5t88ccEdxR0Ygtz5yMjRDxBz-afY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020055
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Jul 2025 07:03:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9288

With a very minimal image recipe that just pulls in docker, the daemon
won't start due to missing modules, so add the missing ones.

The list of new modules was created by diffing the output of `lsmod`
before installing all kernel-modules and the output  after launching 
docker with all modules installed.

Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
---

Changes since v1:
	* Add kernel-module-veth, the docker daemon starts up just fine
	  with the v1 patch, but launching an actual container fails due
          to missing veth.ko.

 recipes-containers/docker/docker.inc | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index 05a14f97..3a9d6865 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -14,7 +14,18 @@ RDEPENDS:${PN} = "util-linux util-linux-unshare iptables \
                  "
 RDEPENDS:${PN} += "virtual-containerd ${VIRTUAL-RUNTIME_container_runtime}"
 
-RRECOMMENDS:${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat kernel-module-nf-conntrack-netlink kernel-module-xt-addrtype kernel-module-xt-masquerade"
+RRECOMMENDS:${PN} = "kernel-module-dm-thin-pool \
+                     kernel-module-nf-conntrack \
+                     kernel-module-nf-conntrack-netlink \
+                     kernel-module-nf-nat \
+                     kernel-module-nfnetlink \
+                     kernel-module-overlay \
+                     kernel-module-veth \
+                     kernel-module-x-tables \
+                     kernel-module-xt-addrtype \
+                     kernel-module-xt-conntrack \
+                     kernel-module-xt-masquerade \
+                    "
 
 PROVIDES += "virtual/docker"
 
-- 
2.48.1


