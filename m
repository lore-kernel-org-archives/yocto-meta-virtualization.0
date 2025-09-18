Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BD9CAC59F
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 08:46:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9248.1758185180820100114
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 01:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UYZdOlgb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13567e3d28=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58I7u5rF3193568
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Sep 2025 08:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=1yv7Evo5YBiYmfD3O9e6
	lJZa1W7TzhtcJa/ZKsZupF4=; b=UYZdOlgbC76wvQiYD5LMmx5DhadEP5DZLp9z
	X13IEDPXFm6B5aZ1anBaMarkjhQzAd2bHjpoVseVHmyuDJIsCaS0hhnvr1ZXIr22
	qkVvNLNi4AS+Wh4tG/D+Q8k/diLtQaUOGer9e69PaNjUAYBIgt0jLXjnpgkHzGHQ
	oQQUA+e4jAhzQ1biI1LZTj9hqtnhtuLlozvweU6TUwtiIPZi9+DA9H8xpu27gExN
	Fkc9bXMPyPws0eOtm//lq0gyejY1NKW3UbHNuwlZxL0/T7AweW3QGreTlOtt5fnw
	BVOz98+QXzZgIWY4+G37PM34bwoVI6doWJ+0kmSpV9d5ioRyEQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwrstyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Sep 2025 08:46:19 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 18 Sep 2025 01:46:17 -0700
From: yurade <yogita.urade@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [OE-core][walnascar][PATCH 1/1] grub2: fix CVE-2024-56738
Date: Thu, 18 Sep 2025 14:15:42 +0530
Message-ID: <20250918084542.274452-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-ORIG-GUID: VVqvx4Aifog0rqNj1GbEJznOsZjOalB_
X-Authority-Analysis: v=2.4 cv=Sdr3duRu c=1 sm=1 tr=0 ts=68cbc6db cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=7CQSdrXTAAAA:8 a=P-IC7800AAAA:8
 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=rfopBRLC-93ZHpjoEacA:9
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA4MCBTYWx0ZWRfX9o4F63Vl4S2k
 hpYDwKvWg297vHJiLhCiTfckwyQ75pXy63LmQHYO/p2LOjZCEksJ4tyCg2XjbE+CN7e9ORdI9Jx
 L+YrVlHS4vXaAAIgkGEu8etg4eVT5hYwsFRNcbyrmMYa/mGCAz7yJh9tpszZ4NULcP4W86qt07e
 CSTwhP4CLfjvJS7zR2E0pVOR31raG8/cLWFfo/BQL+R0owd+MjZsV2mtnjotbYXiBULjFwsCCVw
 Z9PDLWJ61L6C8uvpQIOmsuK2aIzm00zWyFoEvZ2vGg0pqAITZ0TRSwohAh1nMiWCd1okvWqr9gn
 YBqPwx5NWpNhc72JOOK25NQ2gBeGWrBBJGNO1XzJkuhwk38YHozhn/QQ8KZSlc=
X-Proofpoint-GUID: VVqvx4Aifog0rqNj1GbEJznOsZjOalB_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Sep 2025 08:46:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9398

From: Ross Burton <ross.burton@arm.com>

Backport an algorithmic change to grub_crypto_memcmp() so that it
completes in constant time and thus isn't susceptible to side-channel
attacks.

(From OE-Core rev: 30a1cc225a2bd5d044bf608d863a67df3f9c03be)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../grub/files/CVE-2024-56738.patch           | 74 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-56738.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-56738.patch b/meta/recipes-bsp/grub/files/CVE-2024-56738.patch
new file mode 100644
index 0000000000..f6a3641eb1
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-56738.patch
@@ -0,0 +1,74 @@
+From 4cef2fc7308b2132317ad166939994f098b41561 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 9 Sep 2025 14:23:14 +0100
+Subject: [PATCH] CVE-2024-56738
+
+Backport an algorithmic change to grub_crypto_memcmp() so that it completes in
+constant time and thus isn't susceptible to side-channel attacks.
+
+This is a partial backport of grub 0739d24cd
+("libgcrypt: Adjust import script, definitions and API users for libgcrypt 1.11")
+
+CVE: CVE-2024-56738
+Upstream-Status: Backport [0739d24cd]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ grub-core/lib/crypto.c | 23 ++++++++++++++++-------
+ include/grub/crypto.h  |  2 +-
+ 2 files changed, 17 insertions(+), 8 deletions(-)
+
+diff --git a/grub-core/lib/crypto.c b/grub-core/lib/crypto.c
+index 396f76410..19db7870a 100644
+--- a/grub-core/lib/crypto.c
++++ b/grub-core/lib/crypto.c
+@@ -433,19 +433,28 @@ grub_crypto_gcry_error (gcry_err_code_t in)
+   return GRUB_ACCESS_DENIED;
+ }
+
++/*
++ * Compare byte arrays of length LEN, return 1 if it's not same,
++ * 0, otherwise.
++ */
+ int
+-grub_crypto_memcmp (const void *a, const void *b, grub_size_t n)
++grub_crypto_memcmp (const void *b1, const void *b2, grub_size_t len)
+ {
+-  register grub_size_t counter = 0;
+-  const grub_uint8_t *pa, *pb;
++  const grub_uint8_t *a = b1;
++  const grub_uint8_t *b = b2;
++  int ab, ba;
++  grub_size_t i;
+
+-  for (pa = a, pb = b; n; pa++, pb++, n--)
++  /* Constant-time compare. */
++  for (i = 0, ab = 0, ba = 0; i < len; i++)
+     {
+-      if (*pa != *pb)
+-	counter++;
++      /* If a[i] != b[i], either ab or ba will be negative. */
++      ab |= a[i] - b[i];
++      ba |= b[i] - a[i];
+     }
+
+-  return !!counter;
++  /* 'ab | ba' is negative when buffers are not equal, extract sign bit.  */
++  return ((unsigned int)(ab | ba) >> (sizeof(unsigned int) * 8 - 1)) & 1;
+ }
+
+ #ifndef GRUB_UTIL
+diff --git a/include/grub/crypto.h b/include/grub/crypto.h
+index 31c87c302..20ad4c5f7 100644
+--- a/include/grub/crypto.h
++++ b/include/grub/crypto.h
+@@ -393,7 +393,7 @@ grub_crypto_pbkdf2 (const struct gcry_md_spec *md,
+		    grub_uint8_t *DK, grub_size_t dkLen);
+
+ int
+-grub_crypto_memcmp (const void *a, const void *b, grub_size_t n);
++grub_crypto_memcmp (const void *b1, const void *b2, grub_size_t len);
+
+ int
+ grub_password_get (char buf[], unsigned buf_size);
+--
+2.43.0
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 1fe39a59d2..db053b27b0 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -36,6 +36,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45778_CVE-2024-45779.patch \
            file://CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch \
            file://CVE-2025-0678_CVE-2025-1125.patch \
+           file://CVE-2024-56738.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.40.0


