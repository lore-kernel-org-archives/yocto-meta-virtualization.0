Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094DDD73EA0
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 22:40:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28210.1769726448948105432
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 14:40:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=E4rJ51NV;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=LShF2Kbf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TH7ZWf179555
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Jan 2026 22:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QiOsbhyCmbq/5vkbRKVGDoio1pUM1wUrdRF
	zwwLsf+o=; b=E4rJ51NV6REiTGIUCQpnufqdeUh2n5QwC5YzvRO1RnBFdEjGEQU
	eieT0wF07J6nS0xV1JEAj4LEQz5hbI+QJiiF3hSKCccAZh8Uq4+q25V8ASjolQxC
	L1Uq5CZqK41iH0AJR9firnocZUHVU29qtlVHO9XIik62eFHcOXHs9ou3nVDHY4bZ
	8KpRsx4McIXogXPfkhGhSrapkMKR4u/0vWoeNlF8mHAxiTWHWSWCdalRqAr2WKbZ
	8wkuoh0TDO5ww6wukuqdzwgCKG34GY5S3krzdRvS3HY00RdeTF6GjpgREkmqA3I9
	yGXJ06kggC92RbppMlNarIbGDs/4x4mDQow==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0bp3ryq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Jan 2026 22:40:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b71d3ac508so1576130eec.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Jan 2026 14:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769726447; x=1770331247; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QiOsbhyCmbq/5vkbRKVGDoio1pUM1wUrdRFzwwLsf+o=;
        b=LShF2KbfxMgrxvbWKBZ3f3o3BSHQ18dWk2m6xi+KTQVzC3ZbRo9oqx3i9iEfGgHuaH
         1gd00HDa0ob5ZotLblTRY8DvI3kBK/3ywLqufqUc13yybTDEpD0kOrCUwEFEYhnWU/4v
         iIIJPONW/2QBVQQSXIyLOSAEdYC22gBxDFyHVIkxH/SMsp4aV9nRoj5eiMT8dNgzsXrP
         y5NsM9wiVaERiddo1/z+mlNzsPlreo8yR41cJM8XXcx7htPCfrLV3TkHzp8ebJSsTu8F
         vUjtgVQ3RzCekiCjC+K+0Hrms7G7MjX3v9Ri5NQDcMXRRlXapZTr8Ni+si4R/erp8BFn
         By/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769726447; x=1770331247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QiOsbhyCmbq/5vkbRKVGDoio1pUM1wUrdRFzwwLsf+o=;
        b=MFIGCGATte9mYWPBxS4q0CLjjC8b5CVIR4A+fdCLXTLd49Fbkllrfy+0BR3Z0FkIBD
         0S8ujO+UcKgEe9vt1QmnMGjCACAsQAe3n5bPCSRDap0+Liu4W+Sl4randrc48UNR3AHu
         V21k/s6KowZFRLc0iN1Mg84/J0NEVjw5smto+58ZXOiWtYsQnajrQRgXfRNAL7gmU75f
         naWltsSAfvXQDmzDpiBXVq6arMHW/DeMl+w2N01Z+EZCl50P8LEfRNkuIlTOC/yRVNdx
         vzt3ZdrTKzU8ciCCqN9utoRT7xW9te2PVJxjBuUZOhIn6Bkcl/taewDKLlN/9x9tkeHj
         vLNw==
X-Gm-Message-State: AOJu0YyIvbHgye26rRGbeIymstJhJACtQbxKkRHXqUqR0OT34ctICAe2
	Y/WmsOYXMul147RQu2V9xRF6Fi5nOSFI2ytLjiBsIBrD4LJP/uoK7BiGaxkIuajuq1tdiDN88Ra
	X2DgO2vEUiKQrT9EskJAOjdKm7VQzZxQ5Kb58HMHPijNb1JCMi1j9AZubMkJEqScf0P65urRdWU
	1hUmSv1LfbTFUise7K4Q==
X-Gm-Gg: AZuq6aKwL+VgEoxLxwOIEyYOSo1yMjgyUdxSzwlDkRffgEeV1eQhv3a1D16g28SCiBf
	wXPPU+4J31XT3ojYWkt44MkwggpiOO/LE7lEkr4Vyoy4S8UkNLmrX0VK/oZ3VcQZAsmhsbQjvU6
	FB0tg2+JViVfpD3E/W5EKB26wiOdLl/7JDb1O/Aa9GETd2EWRsBEjdjTySyWs6DFKczWmvYr1oQ
	fjUqUCcwZCIjV/fsq5+nfToTyIcBraGmsFE+cKIAAL3YTrQMQhOwY8S27/Zr0pZy7FbNMAyxwBT
	WcT5TK0H09SHbOeLm6ml+vgzsrsRzy2gXYk+MUCls6Y15fFbRzFTaUZImHL7lL8x/wpfoy63ZgY
	C38e2TNR/lr4nbR5CMeQG
X-Received: by 2002:a05:7300:8b15:b0:2b1:76f9:e094 with SMTP id 5a478bee46e88-2b7c8930b0cmr503398eec.36.1769726447285;
        Thu, 29 Jan 2026 14:40:47 -0800 (PST)
X-Received: by 2002:a05:7300:8b15:b0:2b1:76f9:e094 with SMTP id 5a478bee46e88-2b7c8930b0cmr503387eec.36.1769726446546;
        Thu, 29 Jan 2026 14:40:46 -0800 (PST)
Received: from evatuf.. ([187.65.214.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16ec51csm8834375eec.10.2026.01.29.14.40.45
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 14:40:46 -0800 (PST)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] lxc: restore DEBUG_PREFIX_MAP in TARGET_LDFLAGS for LTO reproducibility
Date: Thu, 29 Jan 2026 19:40:41 -0300
Message-Id: <20260129224041.2242384-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: k1uFS8QvsmgH8a2VDI8zjmd4vjvgAjRS
X-Proofpoint-ORIG-GUID: k1uFS8QvsmgH8a2VDI8zjmd4vjvgAjRS
X-Authority-Analysis: v=2.4 cv=d6T4CBjE c=1 sm=1 tr=0 ts=697be1f0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=5XGjxTY8yYkUmB1D1iF5Cg==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=i8bFWRfQuvo7y7cm82gA:9
 a=bBxd6f-gb0O0v-kibOvt:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDE2NiBTYWx0ZWRfX2ZfMQE5NXX7W
 nqlUixBZIL1bS/bFxUXhe7hAOWzbuq1BRQ7X38kh+cVphrLRB45/b8IOcV+1yiF2JH8NJ50D5rc
 7KIrwkVVJwkyMICl4xy42ztu5Fh1nTi3QUdv6duDINAs0TsotzuBKf7Cke5HPc7Sf1FerWK4IEM
 NxIBdvXFN8m1p41BP7z+71kSAyFox7x2+hTKLq+rbqxdRf7dimxy4cFyaR/U71q2J84JJ4qKTQR
 iUS6G9tgMdHMKRjGuvxPDglBc3LKP7tGjZGeqoiLN5sxC7ZNJMaFfTgQ75pvIo5b6v6z+b3Bv83
 x60L6XZbv3X58k1L3f9phYGcvfqPqYxxwkeHX9H4u64SKpbGK8gp9C09YUi98gJEhwlCWS8e6i8
 VXGB9A/vQGxwDlp2Yrca2dbOCATFtvbzTrrr0XD15Ztm/+4vmzzsAWJ1CbUE/MZ0UJOSva9Z5td
 psOv1JiMQUYdAlmnxZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 malwarescore=0 clxscore=1011 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290166
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Jan 2026 22:40:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9553

oe-core [1] removed DEBUG_PREFIX_MAP from TARGET_LDFLAGS to avoid passing
prefix-map options via the linker flags. This is fine for most projects
since DEBUG_PREFIX_MAP is also provided via CFLAGS at configure time.

However, lxc enables LTO by default, which causes link-time code generation
to (re)emit debug information during the link step. Without DEBUG_PREFIX_MAP
on the link command line, TMPDIR/WORKDIR paths can leak into DWARF,
triggering the buildpaths QA check and breaking reproducibility.

Append DEBUG_PREFIX_MAP back to TARGET_LDFLAGS for lxc to ensure prefix-map
options are visible during LTO link-time compilation.

[1]
https://git.openembedded.org/openembedded-core/commit/?id=1797741aad02b8bf429fac4b81e30cdda64b5448

Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 recipes-containers/lxc/lxc_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
index 542134db..04db2ac0 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -63,6 +63,9 @@ EXTRA_OEMESON += "${PTEST_CONF} -Ddistrosysconfdir=${sysconfdir}/default"
 # No meson equivalent for these yet
 # EXTRA_OECONF += "--enable-log-src-basename --disable-werror"
 
+# LTO is enabled by default, expose prefix-map options to the linker for reproducibility
+TARGET_LDFLAGS:append = " ${DEBUG_PREFIX_MAP}"
+
 PACKAGECONFIG ??= "templates \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
-- 
2.34.1


