Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A31BCF8E4AE
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 06:28:13 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36808.1776407291726996701
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 23:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=dpR+eFHJ;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=acVwQAMG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0frr13102131
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Apr 2026 06:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=riKUloFPkYayumaFj9e9Wm+gzP+Hc+rzTTN
	5OKTGCsY=; b=dpR+eFHJIPyt1T1tRGA4qfBupPNGGPtQr7iYGUXdGTOuBnvozua
	kgvOJQ9+m6j7AAdZKktU0yUXUu6i3Yh5bS7zycLUCm8sLznEaJx9FxUAc5D9/Tfk
	3wV+Zheb0aenmqepbF5hGT4CMhn3XM7DQWPUiAb7H8F1mu/ReSDPv9wgZmXs8kt/
	u40J2ScY3Bk143OmEP3WljuOFnMWSyUSWJR9pd6LoyFgIFq6U/0nTFmE2e6LhU6K
	ZfxKKMAWPV2gqArecunZCjeGYM1e+VgOikQO6M07wlqp8oE/CKuXyTgEglqSH1wd
	I1GyRa/3QYoqY5YpLtbAtB0eK45T8nlgNFA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djx4kbn32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Apr 2026 06:28:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5d1c2289so9989701cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Apr 2026 23:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776407289; x=1777012089; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=riKUloFPkYayumaFj9e9Wm+gzP+Hc+rzTTN5OKTGCsY=;
        b=acVwQAMGVyP9CcLGtaNcTQ3+7dDRIPa+n7nlRQy21TN1ESkPeeHNzyhkUMDI/FD6WO
         gy2Y1Zl6x9Q3e5AfLVtPFfaOCXX86i9MiKA5GDYpBWsv6sKy1EuQmZXOmi3VSTeiVVUr
         +hqlKsS0ULuNacZBshpr4fEQBQqsOh6ZDVFPzskibhmDEXcrHgTZLh+B6nzs6C/HtpV3
         q8tBPmp9rKiZyVSDBo3gUgbe4IlNouDUC5OqoT9PAyD69KBG8h3zsoDbefS3CychM+0L
         C/gJMKWwxhm+Ht/AHKOxW6Non4w3k/NxbcaaCDaQ8VjnH14KAMzOWpBFzvmser1SsD3D
         cYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776407289; x=1777012089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riKUloFPkYayumaFj9e9Wm+gzP+Hc+rzTTN5OKTGCsY=;
        b=pZcV/0kvWOR31oG56ES6BqtS+G34IUDc+tASFoqe995skGpXWUkk4TXxsvhbYkH+jY
         zXu5G4oZilojglZQ9JMsbmBhNMMPn/eE58hotXokBTxxH4mY65gcq+6DEY290RHY+w1X
         cD2ACRqF6MDtYCQTy2+fHuueC6IcEW1Id0qFZFAakxHw1HTW88w34ZykNc4SvoK+2EGr
         KfQBgQ3pCjZq2zZSsfm9LKgmoRrX94apznBTi/HgJeZTG6ITz+Ph95FLlpQqtfDZrW79
         eIl2qCeDOKtCJUZKE0ee5Dnp1b4P4k9Ieliy/MX4wVL5hhrWaqeb7LhT1DDKF0SqwWlA
         hKEw==
X-Gm-Message-State: AOJu0Yyyl1tdEVagxC+dZMabnfhlst/5pV6rMhXg1NtrlS6cq4D0atVI
	J4LmWPh981h3wEnm0Oye+wKmBNRwnTZIK731011vwYMR0bUAbdgUprrzn9jH1esN4yh0eoDp86c
	TfeyzFB4G7Fq5U6sPoeaEhWlVR6qs3TX4XROKjW58BMNQkIIi8U3PLBaikLtCT24smE/QIGqq8d
	S6TtP/j823R9ftpd7TTA==
X-Gm-Gg: AeBDiesJtKEbwAh6gDc3R7aGKlH18jgHcWcnNkIbsMiMVo55KaeMDALSXHanZ5bpPcd
	StA4LGIgjskly1LUKa37b3bC34i7v9rIfpnrXJo1w1Mc0Rhc4Lj13Zv+RlzYXkJnqX+lmaex/8X
	5q6nouPliFNC+s6mHjqxM5CiC3AkqlqJQtinjQ0Wk++XFD1dUarWc+xshQxZX4cHSuF9rKtv7NF
	57AIHtJznp+u9vdpAYbu+qvMxBF//EWeC16vHrL6uup2+BbIP3uCg8uy5Q9uMjXWBHQq9rg4bXj
	Op06cPFEWGQMHX2+5FHxCWvmGu4Jvyh3HMmb/a68+Nmo3UoWccsgKu1MYFf56NlA5Wp60bQffWt
	ANI4ZixDPUNeTRKclNHK+PDsNgNA0VLJOAMnp9O0eLlE872Lx27VHU1DzFJ4=
X-Received: by 2002:a05:622a:11d5:b0:50b:41b7:d6c2 with SMTP id d75a77b69052e-50e36c55339mr20431501cf.47.1776407288949;
        Thu, 16 Apr 2026 23:28:08 -0700 (PDT)
X-Received: by 2002:a05:622a:11d5:b0:50b:41b7:d6c2 with SMTP id d75a77b69052e-50e36c55339mr20431171cf.47.1776407288224;
        Thu, 16 Apr 2026 23:28:08 -0700 (PDT)
Received: from rogue.. (185-047-135-246.jonaz.nl. [185.47.135.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cdfd27sm23637266b.26.2026.04.16.23.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 23:28:07 -0700 (PDT)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [meta-virtualization][PATCH v2] cdi: add container-device-interface commandline utility
Date: Fri, 17 Apr 2026 08:27:47 +0200
Message-ID: <20260417062747.833899-1-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xdvn8p74XPAgk7VgL7mxHv2pacHxd3KK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA2MiBTYWx0ZWRfXzfWjGgtS34g0
 fg57x9n/7P4v/p7rH1ubRVzwH6YkvazEBb60cIyuxPaHNRj9UAbtfm7bFA5k87skyebYgRe9sFN
 ShG51PE37gry60nEJyIHMkkXyGd/IIGRQ05HZTAVujiKnCoR3bHrHwXw7ktFQtkwHaG/7n8DU27
 gMfvMBpAIlBg1K9yJpzub0GYKy7gNAs1H4Tas+S+/Nhs7Zt/SHvfAB4AGwxX+5EOzCItN4zICGd
 iRy0iXjoEnVKrd7u92lAT0xxfE/OxF5aTHL1bm/XKnUroKcgOI/wLW8Wm7D/qolBlA4O1krcZUA
 XMOSWRuNZEunoJ/KmjfueeaVkN2I0lre/RxR0BYt/vHT60XdiAr5A5oS+hF+yxo5Ddj0qxuuq0S
 OY8ugdPc71a6m/9E9/vHVytqBXt3EGn7P/XaSHt+/V9Pp2noJy4Y8fL0rmCE0zblTRFcYE9vk0X
 mO1Pw6VP4OSIuY534Ng==
X-Authority-Analysis: v=2.4 cv=H47rBeYi c=1 sm=1 tr=0 ts=69e1d2fa cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=/kpjpRmFdjEkggKB3J9tkg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=pM9yUfARAAAA:8 a=Oh2cFVv5AAAA:8 a=y8JpcNg0vFqbPD1lgokA:9
 a=dawVfQjAaf238kedN5IG:22 a=YH-7kEGJnRg4CV3apUU-:22 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-ORIG-GUID: xdvn8p74XPAgk7VgL7mxHv2pacHxd3KK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170062
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Apr 2026 06:28:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9708

From the upstream description:

The `cdi` command-line tool is a utility for inspecting and interacting with the CDI (Container Device Interface) cache.
It allows developers and system administrators to:

- List CDI Spec files: View all available CDI specification files in the configured directories
- List vendors: Display registered device vendors in the CDI cache
- List device classes: Show available device classes from CDI Specs
- List devices: Enumerate all CDI devices available in the system
- Validate specs: Verify CDI specification files against the JSON schema
- Inject devices: Inject CDI device configurations into OCI runtime specifications
- Monitor cache: Watch for changes in the CDI cache and Spec directories
- Resolve devices: Resolve fully-qualified device names to their configurations

The CLI tool is particularly useful for debugging CDI configurations, validating spec files, and testing device assignments before deploying them in production environments.

Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
---

Changes since v1:
	* Buildflags patch went upstream: https://github.com/cncf-tags/container-device-interface/pull/313

 recipes-containers/cdi/cdi_git.bb             | 42 ++++++++++++++++
 recipes-containers/cdi/go-mod-cache.inc       | 50 +++++++++++++++++++
 recipes-containers/cdi/go-mod-git.inc         | 42 ++++++++++++++++
 .../cdi/go-mod-hybrid-cache.inc               | 10 ++++
 recipes-containers/cdi/go-mod-hybrid-git.inc  |  7 +++
 .../cdi/go-mod-hybrid-gomod.inc               | 45 +++++++++++++++++
 6 files changed, 196 insertions(+)
 create mode 100644 recipes-containers/cdi/cdi_git.bb
 create mode 100644 recipes-containers/cdi/go-mod-cache.inc
 create mode 100644 recipes-containers/cdi/go-mod-git.inc
 create mode 100644 recipes-containers/cdi/go-mod-hybrid-cache.inc
 create mode 100644 recipes-containers/cdi/go-mod-hybrid-git.inc
 create mode 100644 recipes-containers/cdi/go-mod-hybrid-gomod.inc

diff --git a/recipes-containers/cdi/cdi_git.bb b/recipes-containers/cdi/cdi_git.bb
new file mode 100644
index 00000000..138956dc
--- /dev/null
+++ b/recipes-containers/cdi/cdi_git.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "The cdi command-line tool is a utility for inspecting and interacting with the CDI (Container Device Interface) cache."
+SUMMARY = "The cdi command-line tool."
+HOMEPAGE = "https://github.com/cncf-tags/container-device-interface"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+PV = "1.1.0+git"
+SRCREV_cdi = "35765bd41b50a86aa3919eb352bc90321e010e68"
+SRCREV_FORMAT = "cdi"
+SRC_URI = "git://github.com/cncf-tags/container-device-interface.git;protocol=https;name=cdi;branch=main;destsuffix=${GO_SRCURI_DESTSUFFIX} \
+          "
+SRCREV_FORMAT = "cdi"
+
+GO_IMPORT = "tags.cncf.io/container-device-interface/"
+
+inherit go goarch
+
+# GO_MOD_FETCH_MODE: "vcs" (all git://) or "hybrid" (gomod:// + git://)
+GO_MOD_FETCH_MODE ?= "hybrid"
+
+# VCS mode: all modules via git://
+include ${@ "go-mod-git.inc" if d.getVar("GO_MOD_FETCH_MODE") == "vcs" else ""}
+include ${@ "go-mod-cache.inc" if d.getVar("GO_MOD_FETCH_MODE") == "vcs" else ""}
+
+# Hybrid mode: gomod:// for most, git:// for selected
+include ${@ "go-mod-hybrid-gomod.inc" if d.getVar("GO_MOD_FETCH_MODE") == "hybrid" else ""}
+include ${@ "go-mod-hybrid-git.inc" if d.getVar("GO_MOD_FETCH_MODE") == "hybrid" else ""}
+include ${@ "go-mod-hybrid-cache.inc" if d.getVar("GO_MOD_FETCH_MODE") == "hybrid" else ""}
+
+EXTRA_OEMAKE = "GO_EXTRAFLAGS='${GO_BUILDFLAGS}'"
+
+do_compile() {
+	cd ${S}/src/${GO_IMPORT}
+	pwd
+	oe_runmake
+}
+
+do_install() {
+        install -d "${D}${bindir}"
+        install -m 755 ${S}/src/${GO_IMPORT}/bin/* "${D}${bindir}"
+}
diff --git a/recipes-containers/cdi/go-mod-cache.inc b/recipes-containers/cdi/go-mod-cache.inc
new file mode 100644
index 00000000..43703e1c
--- /dev/null
+++ b/recipes-containers/cdi/go-mod-cache.inc
@@ -0,0 +1,50 @@
+# Generated by oe-go-mod-fetcher.py v3.0.0
+# Module cache data for Go dependencies
+#
+# This file contains recipe-specific module metadata.
+# The task implementations are in go-mod-vcs.bbclass.
+
+inherit go-mod-vcs
+
+# Module metadata for cache building (one module per line)
+GO_MODULE_CACHE_DATA = '[\
+{"module":"tags.cncf.io/container-device-interface/specs-go","version":"v1.1.0","vcs_hash":"2a0706ee0554e66b341fabb5c09e62f00336b0a7e6faac981d973f30b4064622","timestamp":"2025-12-10T08:48:20Z","subdir":"specs-go","vcs_ref":"refs/tags/specs-go/v1.1.0"},\
+{"module":"tags.cncf.io/container-device-interface","version":"v1.1.0","vcs_hash":"2a0706ee0554e66b341fabb5c09e62f00336b0a7e6faac981d973f30b4064622","timestamp":"2025-12-10T08:48:20Z","subdir":"","vcs_ref":"refs/tags/v1.1.0"},\
+{"module":"sigs.k8s.io/yaml","version":"v1.4.0","vcs_hash":"1a5189a2f11994a0ed72dcd69d5046be49f0ac8890830fc52ddb333e63e84cd5","timestamp":"2023-10-24T17:13:34Z","subdir":"","vcs_ref":"refs/tags/v1.4.0"},\
+{"module":"golang.org/x/sys","version":"v0.19.0","vcs_hash":"4c6d98cad0d2b72a8309948ddb246f7d1da1f67b85f99caad7634ffd5e574be0","timestamp":"2024-04-04T14:40:38Z","subdir":"","vcs_ref":"refs/tags/v0.19.0"},\
+{"module":"golang.org/x/mod","version":"v0.19.0","vcs_hash":"8e48031d1725b73effc9fbf41ecad98f251385f856e11330aacdf52bbeb0ca77","timestamp":"2024-06-26T14:12:39Z","subdir":"","vcs_ref":"refs/tags/v0.19.0"},\
+{"module":"github.com/moby/sys/capability","version":"v0.4.0","vcs_hash":"e67c1b1913863f71a44fb255bb4ceafcd322cbb0790a301c410f76acaf083f75","timestamp":"2024-11-11T19:02:25Z","subdir":"capability","vcs_ref":"refs/tags/capability/v0.4.0"},\
+{"module":"github.com/spf13/cobra","version":"v1.6.0","vcs_hash":"75f09e2cb98d4d00ab0efbae6d89092470408d4c2ea5fa51f9863754705b1c36","timestamp":"2022-10-10T23:06:30Z","subdir":"","vcs_ref":"refs/tags/v1.6.0"},\
+{"module":"github.com/opencontainers/runtime-tools","version":"v0.9.1-0.20251114084447-edf4cb3d2116","vcs_hash":"9120451d0089ff79de31a4292e8836bebf3ee5e2d7e8c4852764fee040cbfc1e","timestamp":"2025-11-14T08:44:47Z","subdir":"","vcs_ref":""},\
+{"module":"github.com/opencontainers/runtime-spec","version":"v1.3.0","vcs_hash":"d9c05db6124626de7f86b5f7cf385d2a821699e74a3a1d784837399c70f4e1b9","timestamp":"2025-11-02T07:35:43Z","subdir":"","vcs_ref":"refs/tags/v1.3.0"},\
+{"module":"github.com/inconshreveable/mousetrap","version":"v1.0.1","vcs_hash":"e2df627ef3b92dd51e6ba1089850ca40365e1dfdeaa6ebe778c845cdf17f4774","timestamp":"2022-08-07T15:49:23Z","subdir":"","vcs_ref":"refs/tags/v1.0.1"},\
+{"module":"github.com/blang/semver/v4","version":"v4.0.0","vcs_hash":"592c6d9a3fd1b340b1d148a1229b29c0f07951f6a2324b4abdbe310d546bda36","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
+{"module":"github.com/cpuguy83/go-md2man/v2","version":"v2.0.2","vcs_hash":"415015530da751018f21f20a17c97aa3e18912934f8beeda05ff608790a0ed83","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
+{"module":"github.com/davecgh/go-spew","version":"v1.1.1","vcs_hash":"4c7d69cfe586f86079773ff48d94f76d327c2914d8dfeffca9e34fd1146e5d5e","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
+{"module":"github.com/fsnotify/fsnotify","version":"v1.5.1","vcs_hash":"57dc92422ad78a4fa6b523031a09238c27e85f28f339c2cc92304f5c7cdb18a1","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
+{"module":"github.com/google/go-cmp","version":"v0.5.9","vcs_hash":"fd14e45645e0977841a8f51fbe51cc4ca8444dbd2b4e5eddd91172a3805102fa","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
+{"module":"github.com/google/uuid","version":"v1.3.0","vcs_hash":"baaff4147d4a04e5d30e5b64e58b5212e2563d7d6043a2edc09a3a5c217ad47f","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
+{"module":"github.com/hashicorp/errwrap","version":"v1.0.0","vcs_hash":"65db17b2a8abd8c2bde5a919d17f7abc0e891ae4037aa21f7aa2482f560cf21f","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
+{"module":"github.com/hashicorp/go-multierror","version":"v1.1.1","vcs_hash":"cec0f337a88725c16a86058204a5dd4ae667b8a92bbed995ab204ebcb62177a5","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
+{"module":"github.com/mndrix/tap-go","version":"v0.0.0-20171203230836-629fa407e90b","vcs_hash":"8bb1ed2d8275bc2dbf722411dd9448c055174d4deabf466b5d13bd0b0d5d3e80","timestamp":"2017-12-03T23:08:36Z","subdir":"","vcs_ref":""},\
+{"module":"github.com/moby/sys/mountinfo","version":"v0.7.2","vcs_hash":"239ddfa409797a858e0b084af9d021679c3bac379a7a5c619a113fc3b9872551","timestamp":"1970-01-01T00:00:00Z","subdir":"mountinfo","vcs_ref":""},\
+{"module":"github.com/mrunalp/fileutils","version":"v0.5.0","vcs_hash":"80bd1af07a30fc2d094f02ec5b9871e476767c6ceb240dbc6ccf1015f5974a69","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
+{"module":"github.com/opencontainers/selinux","version":"v1.10.0","vcs_hash":"b358f84d4337845146d844b82f67b9798d6218ab6af3086b00cde708bb0436eb","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
+{"module":"github.com/pmezard/go-difflib","version":"v1.0.0","vcs_hash":"c04ad296d2e3203fda8b7ca96feaca21b20b3b7441e33c7d67cda029ea61ab4c","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
+{"module":"github.com/russross/blackfriday/v2","version":"v2.1.0","vcs_hash":"6dd1604eceba1790dbf7f827f1e22a5866a5348a2ab616daed7363a6e16e081d","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
+{"module":"github.com/sirupsen/logrus","version":"v1.8.1","vcs_hash":"1389673f985797078534cc41d2be170c341c9dc3ceff65dd417e2583d488159b","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
+{"module":"github.com/spf13/pflag","version":"v1.0.5","vcs_hash":"dbfdd18a638b7c45a5c225a857127418838676706ffaf75f8739561cd3b235db","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
+{"module":"github.com/stretchr/objx","version":"v0.1.0","vcs_hash":"39828321881a0709a36a2d1edde8fc9928ddd471ebd0bbdf7012076e7214bb02","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
+{"module":"github.com/stretchr/testify","version":"v1.7.0","vcs_hash":"f87883f9ef1ad6bd6ecb844fe9108ae126c4dfab49080e5fb37bd27ca64417be","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
+{"module":"github.com/urfave/cli","version":"v1.19.1","vcs_hash":"16abec32eeeacf78ac938b59d96d2b50aba6e642cc5617322f40d2aa3b51daa0","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
+{"module":"github.com/xeipuuv/gojsonpointer","version":"v0.0.0-20180127040702-4e3ac2762d5f","vcs_hash":"f35df1afe406fbe96a9200b2fa5c736db1be1c70f292d9e69247d35fa318ec32","timestamp":"2018-01-27T04:07:02Z","subdir":"","vcs_ref":""},\
+{"module":"github.com/xeipuuv/gojsonreference","version":"v0.0.0-20180127040603-bd5ef7bd5415","vcs_hash":"6cce19ebe3be9e8f13d8b3c5090971f010f3f3cda349fa51197c974450d133ee","timestamp":"2018-01-27T04:06:03Z","subdir":"","vcs_ref":""},\
+{"module":"github.com/xeipuuv/gojsonschema","version":"v1.2.0","vcs_hash":"21478840c17d30281eb0f8b90406d132c72274e71f74dcbe3dfb4fa4236df77c","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
+{"module":"golang.org/x/tools","version":"v0.13.0","vcs_hash":"113f573f2a2c2d878f629ffd220d2fb3cfeacb1a574a60b2ab9343fc01919103","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
+{"module":"gopkg.in/check.v1","version":"v0.0.0-20161208181325-20d25e280405","vcs_hash":"f6f7125ac7ef086ca6395a14a9a28c8c11cd6f8790a8be7cfd6475d1acd0f40b","timestamp":"2016-12-08T18:13:25Z","subdir":"","vcs_ref":""},\
+{"module":"gopkg.in/yaml.v2","version":"v2.4.0","vcs_hash":"84e688efadb8602ec1990d3cd251d5818e95c14682a169266ac9a1edadfe5424","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
+{"module":"gopkg.in/yaml.v3","version":"v3.0.1","vcs_hash":"8d340fff421a1861f196061b40e49b2f9e802647204935d08e1062b8ecd90b0d","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
+{"module":"github.com/davecgh/go-spew","version":"v1.1.0","vcs_hash":"5ce38ad71c2d3bc390b87154a89c53fd5ead19aed2bf005419db5c0b28ea9dfd","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":"refs/tags/v1.1.0"},\
+{"module":"github.com/stretchr/testify","version":"v1.3.0","vcs_hash":"15f4be955793ecb9ef81031cf64191211271265868a72e4bf25c409e978a8ce8","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":"refs/tags/v1.3.0"},\
+{"module":"golang.org/x/sys","version":"v0.0.0-20210630005230-0f9fa26af87c","vcs_hash":"a45f0085dd2c323e7107078c703b782801a1d64d6248bb87578d4c4f8330f8df","timestamp":"2021-06-30T00:52:30Z","subdir":"","vcs_ref":"refs/tags/v1.3.0"}\
+]'
diff --git a/recipes-containers/cdi/go-mod-git.inc b/recipes-containers/cdi/go-mod-git.inc
new file mode 100644
index 00000000..6491f79d
--- /dev/null
+++ b/recipes-containers/cdi/go-mod-git.inc
@@ -0,0 +1,42 @@
+# Generated by oe-go-mod-fetcher.py v3.0.0
+# Git repositories for Go module dependencies
+
+SRC_URI += "git://github.com/cncf-tags/container-device-interface;protocol=https;nobranch=1;tag=v1.1.0;shallow=1;rev=98a7d735d9592c1ccca0130e06b0709f4b65ecbf;name=git_c2439148_0;destsuffix=vcs_cache/2a0706ee0554e66b341fabb5c09e62f00336b0a7e6faac981d973f30b4064622"
+SRC_URI += "git://github.com/kubernetes-sigs/yaml;protocol=https;nobranch=1;tag=v1.4.0;shallow=1;rev=c3772b51db126345efe2dfe4ff8dac83b8141684;name=git_a731a2aa_0;destsuffix=vcs_cache/1a5189a2f11994a0ed72dcd69d5046be49f0ac8890830fc52ddb333e63e84cd5"
+SRC_URI += "git://go.googlesource.com/sys;protocol=https;branch=master;rev=0f9fa26af87c481a6877a4ca1330699ba9a30673;name=git_da0444fc_0;destsuffix=vcs_cache/a45f0085dd2c323e7107078c703b782801a1d64d6248bb87578d4c4f8330f8df"
+SRC_URI += "git://go.googlesource.com/sys;protocol=https;nobranch=1;tag=v0.19.0;shallow=1;rev=cabba82f75d7f55a0657810d02d534745dee5d59;name=git_da0444fc_1;destsuffix=vcs_cache/4c6d98cad0d2b72a8309948ddb246f7d1da1f67b85f99caad7634ffd5e574be0"
+SRC_URI += "git://go.googlesource.com/mod;protocol=https;nobranch=1;tag=v0.19.0;shallow=1;rev=d58be1cb16e62a9821b6dbd0157b8c7ff0b667ec;name=git_13df7481_0;destsuffix=vcs_cache/8e48031d1725b73effc9fbf41ecad98f251385f856e11330aacdf52bbeb0ca77"
+SRC_URI += "git://github.com/moby/sys;protocol=https;nobranch=1;tag=capability/v0.4.0;shallow=1;rev=50e999a770172a519119e1c4fd4b6153b7dac90d;name=git_66165bb7_0;destsuffix=vcs_cache/e67c1b1913863f71a44fb255bb4ceafcd322cbb0790a301c410f76acaf083f75"
+SRC_URI += "git://github.com/moby/sys;protocol=https;branch=main;rev=9c4e3a8251666612cfcd2c102700e20755ed2e33;name=git_66165bb7_1;destsuffix=vcs_cache/239ddfa409797a858e0b084af9d021679c3bac379a7a5c619a113fc3b9872551"
+SRC_URI += "git://github.com/spf13/cobra;protocol=https;nobranch=1;tag=v1.6.0;shallow=1;rev=860791844ed3a2e544a9b9bbbcb14144a948ad20;name=git_41456771_0;destsuffix=vcs_cache/75f09e2cb98d4d00ab0efbae6d89092470408d4c2ea5fa51f9863754705b1c36"
+SRC_URI += "git://github.com/opencontainers/runtime-tools;protocol=https;branch=master;rev=edf4cb3d21162a17b02e19637f7d7f8c6bd8523f;name=git_b055e1ee_0;destsuffix=vcs_cache/9120451d0089ff79de31a4292e8836bebf3ee5e2d7e8c4852764fee040cbfc1e"
+SRC_URI += "git://github.com/opencontainers/runtime-spec;protocol=https;nobranch=1;tag=v1.3.0;shallow=1;rev=92249139eea7161e13745abd4cb6d0ea02a3227a;name=git_502d0543_0;destsuffix=vcs_cache/d9c05db6124626de7f86b5f7cf385d2a821699e74a3a1d784837399c70f4e1b9"
+SRC_URI += "git://github.com/inconshreveable/mousetrap;protocol=https;nobranch=1;tag=v1.0.1;shallow=1;rev=3a66f25f8779fad208598f21472174ef7b35c3ec;name=git_b31cc6ad_0;destsuffix=vcs_cache/e2df627ef3b92dd51e6ba1089850ca40365e1dfdeaa6ebe778c845cdf17f4774"
+SRC_URI += "git://github.com/blang/semver;protocol=https;branch=master;rev=af3461a9cbcf1f3f5889d21b83f5ef63880c33a8;name=git_b6bc1865_0;destsuffix=vcs_cache/592c6d9a3fd1b340b1d148a1229b29c0f07951f6a2324b4abdbe310d546bda36"
+SRC_URI += "git://github.com/cpuguy83/go-md2man;protocol=https;branch=master;rev=d97078115282836e16d0dca10b4b42ce60fc70e6;name=git_af686cb3_0;destsuffix=vcs_cache/415015530da751018f21f20a17c97aa3e18912934f8beeda05ff608790a0ed83"
+SRC_URI += "git://github.com/davecgh/go-spew;protocol=https;nobranch=1;tag=v1.1.0;shallow=1;rev=346938d642f2ec3594ed81d874461961cd0faa76;name=git_d9a489aa_0;destsuffix=vcs_cache/5ce38ad71c2d3bc390b87154a89c53fd5ead19aed2bf005419db5c0b28ea9dfd"
+SRC_URI += "git://github.com/davecgh/go-spew;protocol=https;branch=master;rev=8991bc29aa16c548c550c7ff78260e27b9ab7c73;name=git_d9a489aa_1;destsuffix=vcs_cache/4c7d69cfe586f86079773ff48d94f76d327c2914d8dfeffca9e34fd1146e5d5e"
+SRC_URI += "git://github.com/fsnotify/fsnotify;protocol=https;branch=main;rev=466b39d216616549a37ee93c7c47775f6a010790;name=git_3fa8b61c_0;destsuffix=vcs_cache/57dc92422ad78a4fa6b523031a09238c27e85f28f339c2cc92304f5c7cdb18a1"
+SRC_URI += "git://github.com/google/go-cmp;protocol=https;branch=master;rev=a97318bf6562f2ed2632c5f985db51b1bc5bdcd0;name=git_8726c33a_0;destsuffix=vcs_cache/fd14e45645e0977841a8f51fbe51cc4ca8444dbd2b4e5eddd91172a3805102fa"
+SRC_URI += "git://github.com/google/uuid;protocol=https;branch=master;rev=44b5fee7c49cf3bcdf723f106b36d56ef13ccc88;name=git_c3a7687c_0;destsuffix=vcs_cache/baaff4147d4a04e5d30e5b64e58b5212e2563d7d6043a2edc09a3a5c217ad47f"
+SRC_URI += "git://github.com/hashicorp/errwrap;protocol=https;branch=master;rev=8a6fb523712970c966eefc6b39ed2c5e74880354;name=git_28334120_0;destsuffix=vcs_cache/65db17b2a8abd8c2bde5a919d17f7abc0e891ae4037aa21f7aa2482f560cf21f"
+SRC_URI += "git://github.com/hashicorp/go-multierror;protocol=https;branch=main;rev=9974e9ec57696378079ecc3accd3d6f29401b3a0;name=git_151ee577_0;destsuffix=vcs_cache/cec0f337a88725c16a86058204a5dd4ae667b8a92bbed995ab204ebcb62177a5"
+SRC_URI += "git://github.com/mndrix/tap-go;protocol=https;branch=master;rev=629fa407e90bbf3781e448e8e9b8931523ec823c;name=git_e9509ffb_0;destsuffix=vcs_cache/8bb1ed2d8275bc2dbf722411dd9448c055174d4deabf466b5d13bd0b0d5d3e80"
+SRC_URI += "git://github.com/mrunalp/fileutils;protocol=https;branch=master;rev=d7fdd64cc1cabe10bc154ee7d2318b07b7f296ef;name=git_98373e58_0;destsuffix=vcs_cache/80bd1af07a30fc2d094f02ec5b9871e476767c6ceb240dbc6ccf1015f5974a69"
+SRC_URI += "git://github.com/opencontainers/selinux;protocol=https;branch=main;rev=036780110200290e6decd05ce62d7086bf0546f5;name=git_49bf5caa_0;destsuffix=vcs_cache/b358f84d4337845146d844b82f67b9798d6218ab6af3086b00cde708bb0436eb"
+SRC_URI += "git://github.com/pmezard/go-difflib;protocol=https;branch=master;rev=792786c7400a136282c1664665ae0a8db921c6c2;name=git_b66720d7_0;destsuffix=vcs_cache/c04ad296d2e3203fda8b7ca96feaca21b20b3b7441e33c7d67cda029ea61ab4c"
+SRC_URI += "git://github.com/russross/blackfriday;protocol=https;branch=v2;rev=4c9bf9512682b995722660a4196c0013228e2049;name=git_fb978822_0;destsuffix=vcs_cache/6dd1604eceba1790dbf7f827f1e22a5866a5348a2ab616daed7363a6e16e081d"
+SRC_URI += "git://github.com/sirupsen/logrus;protocol=https;branch=master;rev=bdc0db8ead3853c56b7cd1ac2ba4e11b47d7da6b;name=git_02061634_0;destsuffix=vcs_cache/1389673f985797078534cc41d2be170c341c9dc3ceff65dd417e2583d488159b"
+SRC_URI += "git://github.com/spf13/pflag;protocol=https;branch=master;rev=2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab;name=git_66b7b8c8_0;destsuffix=vcs_cache/dbfdd18a638b7c45a5c225a857127418838676706ffaf75f8739561cd3b235db"
+SRC_URI += "git://github.com/stretchr/objx;protocol=https;branch=master;rev=facf9a85c22f48d2f52f2380e4efce1768749a89;name=git_7987da5d_0;destsuffix=vcs_cache/39828321881a0709a36a2d1edde8fc9928ddd471ebd0bbdf7012076e7214bb02"
+SRC_URI += "git://github.com/stretchr/testify;protocol=https;branch=master;rev=acba37e5db06f0093b465a7d47822bf13644b66c;name=git_aa93f7ee_0;destsuffix=vcs_cache/f87883f9ef1ad6bd6ecb844fe9108ae126c4dfab49080e5fb37bd27ca64417be"
+SRC_URI += "git://github.com/stretchr/testify;protocol=https;nobranch=1;tag=v1.3.0;shallow=1;rev=ffdc059bfe9ce6a4e144ba849dbedead332c6053;name=git_aa93f7ee_1;destsuffix=vcs_cache/15f4be955793ecb9ef81031cf64191211271265868a72e4bf25c409e978a8ce8"
+SRC_URI += "git://github.com/urfave/cli;protocol=https;branch=main;rev=0bdeddeeb0f650497d603c4ad7b20cfe685682f6;name=git_cd035cbf_0;destsuffix=vcs_cache/16abec32eeeacf78ac938b59d96d2b50aba6e642cc5617322f40d2aa3b51daa0"
+SRC_URI += "git://github.com/xeipuuv/gojsonpointer;protocol=https;branch=master;rev=4e3ac2762d5f479393488629ee9370b50873b3a6;name=git_bd44e658_0;destsuffix=vcs_cache/f35df1afe406fbe96a9200b2fa5c736db1be1c70f292d9e69247d35fa318ec32"
+SRC_URI += "git://github.com/xeipuuv/gojsonreference;protocol=https;branch=master;rev=bd5ef7bd5415a7ac448318e64f11a24cd21e594b;name=git_ca2a9119_0;destsuffix=vcs_cache/6cce19ebe3be9e8f13d8b3c5090971f010f3f3cda349fa51197c974450d133ee"
+SRC_URI += "git://github.com/xeipuuv/gojsonschema;protocol=https;branch=master;rev=82fcdeb203eb6ab2a67d0a623d9c19e5e5a64927;name=git_6efae2af_0;destsuffix=vcs_cache/21478840c17d30281eb0f8b90406d132c72274e71f74dcbe3dfb4fa4236df77c"
+SRC_URI += "git://go.googlesource.com/tools;protocol=https;branch=master;rev=b5e55d198461206bca9558e65cdd518f8e4f2735;name=git_7d9b3b49_0;destsuffix=vcs_cache/113f573f2a2c2d878f629ffd220d2fb3cfeacb1a574a60b2ab9343fc01919103"
+SRC_URI += "git://github.com/go-check/check;protocol=https;branch=v1;rev=20d25e2804050c1cd24a7eea1e7a6447dd0e74ec;name=git_fc1e328f_0;destsuffix=vcs_cache/f6f7125ac7ef086ca6395a14a9a28c8c11cd6f8790a8be7cfd6475d1acd0f40b"
+SRC_URI += "git://github.com/go-yaml/yaml;protocol=https;branch=v2;rev=7649d4548cb53a614db133b2a8ac1f31859dda8c;name=git_b0089ab1_0;destsuffix=vcs_cache/84e688efadb8602ec1990d3cd251d5818e95c14682a169266ac9a1edadfe5424"
+SRC_URI += "git://github.com/go-yaml/yaml;protocol=https;branch=v3;rev=f6f7691b1fdeb513f56608cd2c32c51f8194bf51;name=git_b0089ab1_1;destsuffix=vcs_cache/8d340fff421a1861f196061b40e49b2f9e802647204935d08e1062b8ecd90b0d"
+
diff --git a/recipes-containers/cdi/go-mod-hybrid-cache.inc b/recipes-containers/cdi/go-mod-hybrid-cache.inc
new file mode 100644
index 00000000..7cbd74eb
--- /dev/null
+++ b/recipes-containers/cdi/go-mod-hybrid-cache.inc
@@ -0,0 +1,10 @@
+# Generated by oe-go-mod-fetcher-hybrid.py
+# Metadata for git-fetched modules (VCS path)
+# Used by go-mod-vcs.bbclass to build module cache from git checkouts
+
+inherit go-mod-vcs
+
+# Module metadata for cache building (one module per line)
+GO_MODULE_CACHE_DATA = '[\
+{"module":"tags.cncf.io/container-device-interface","version":"v1.1.0","vcs_hash":"2a0706ee0554e66b341fabb5c09e62f00336b0a7e6faac981d973f30b4064622","timestamp":"2025-12-10T08:48:20Z","subdir":"","vcs_ref":"refs/tags/v1.1.0"},\
+{"module":"tags.cncf.io/container-device-interface/specs-go","version":"v1.1.0","vcs_hash":"2a0706ee0554e66b341fabb5c09e62f00336b0a7e6faac981d973f30b4064622","timestamp":"2025-12-10T08:48:20Z","subdir":"specs-go","vcs_ref":"refs/tags/specs-go/v1.1.0"}]'
diff --git a/recipes-containers/cdi/go-mod-hybrid-git.inc b/recipes-containers/cdi/go-mod-hybrid-git.inc
new file mode 100644
index 00000000..43dc77ee
--- /dev/null
+++ b/recipes-containers/cdi/go-mod-hybrid-git.inc
@@ -0,0 +1,7 @@
+# Generated by oe-go-mod-fetcher-hybrid.py
+# Go modules fetched from git repositories (VCS path)
+#
+# These modules are fetched directly from their git repositories.
+# They provide full VCS provenance and allow easy SRCREV bumping.
+
+SRC_URI += "git://github.com/cncf-tags/container-device-interface;protocol=https;nobranch=1;tag=v1.1.0;shallow=1;rev=98a7d735d9592c1ccca0130e06b0709f4b65ecbf;name=git_c2439148_0;destsuffix=vcs_cache/2a0706ee0554e66b341fabb5c09e62f00336b0a7e6faac981d973f30b4064622"
diff --git a/recipes-containers/cdi/go-mod-hybrid-gomod.inc b/recipes-containers/cdi/go-mod-hybrid-gomod.inc
new file mode 100644
index 00000000..79c10ca1
--- /dev/null
+++ b/recipes-containers/cdi/go-mod-hybrid-gomod.inc
@@ -0,0 +1,45 @@
+# Generated by oe-go-mod-fetcher-hybrid.py
+# Go modules fetched from proxy.golang.org (fast path)
+#
+# These modules are fetched as pre-built zip files from the Go proxy.
+# They do not provide VCS commit-level provenance but are much faster.
+
+inherit go-mod
+
+SRC_URI += "gomod://github.com/blang/semver/v4;version=v4.0.0;sha256sum=96a2bbe11960f3a3c16db0da822c69ce9ac4b738ee731a0476031bbb71987504"
+SRC_URI += "gomod://github.com/cpuguy83/go-md2man/v2;version=v2.0.2;sha256sum=70a7e609809cf2a92c5535104db5eb82d75c54bfcfed2d224e87dd2fd9729f62"
+SRC_URI += "gomod://github.com/davecgh/go-spew;version=v1.1.1;sha256sum=6b44a843951f371b7010c754ecc3cabefe815d5ced1c5b9409fb2d697e8a890d"
+SRC_URI += "gomod://github.com/davecgh/go-spew;version=v1.1.0;sha256sum=0b5a691aeb8b6af31bd2bb640973ea7e8bf1ed9bc5889da220bf44dc06d9692c"
+SRC_URI += "gomod://github.com/fsnotify/fsnotify;version=v1.5.1;sha256sum=f38d7e395bc45f08a34e9591c9c4900031f81c1ddc7d761a785cbbb9aaee0db0"
+SRC_URI += "gomod://github.com/google/go-cmp;version=v0.5.9;sha256sum=32450874ac756ef5d47f6b819305105304b9819045a16e3f105289b7cf252c51"
+SRC_URI += "gomod://github.com/google/uuid;version=v1.3.0;sha256sum=0a5fcc05ea492afeaca984a012485f6a15e2259b32f1206d6f36a88c88afc607"
+SRC_URI += "gomod://github.com/hashicorp/errwrap;version=v1.0.0;sha256sum=ccdf4c90f894d8a5fde4e79d5828c5d27a13e9f7ce3006dd72ce76e6e17cdeb2"
+SRC_URI += "gomod://github.com/hashicorp/go-multierror;version=v1.1.1;sha256sum=972cd841ee51fdeac69c5a301e57f8ea27aebf15fddd7f621d5c240f28c3000c"
+SRC_URI += "gomod://github.com/inconshreveable/mousetrap;version=v1.0.1;sha256sum=af6f61a00f42d025f195ea272620bbddb045552a9badcf97d8a837980017dbfc"
+SRC_URI += "gomod://github.com/mndrix/tap-go;version=v0.0.0-20171203230836-629fa407e90b;sha256sum=c6f65bd8d977e53fa083d9d0309cffb0dbfaaae69a5a64a352fb2f7d079ce73d"
+SRC_URI += "gomod://github.com/moby/sys/capability;version=v0.4.0;sha256sum=3502bba106a402fd440d1d4e8eb5ca741da4d70a674e8313725838ec8e22b44c"
+SRC_URI += "gomod://github.com/moby/sys/mountinfo;version=v0.7.2;sha256sum=94f79687bc3b72ca4cc60fafda851454fefc0ef04bdb4499e8c7c2b2e231b5d3"
+SRC_URI += "gomod://github.com/mrunalp/fileutils;version=v0.5.0;sha256sum=202a6e33b519ddcbece708c3779845114bb7324d4c9ff9899f7c4f80f1e7b1bf"
+SRC_URI += "gomod://github.com/opencontainers/runtime-spec;version=v1.3.0;sha256sum=09e58e616eb70f2972ed19ada447dd661b298b39777adb0bbd35c94886bdbdf8"
+SRC_URI += "gomod://github.com/opencontainers/runtime-tools;version=v0.9.1-0.20251114084447-edf4cb3d2116;sha256sum=02a13b5731f9232d9c4c91d7d25348245dbe6a53a2ee43edcc0a4e036a3b8e8c"
+SRC_URI += "gomod://github.com/opencontainers/selinux;version=v1.10.0;sha256sum=57bd7c4d8d9819b5c1bc40d0b57675f79182e41b4b1e66211fd1a8f1741cc977"
+SRC_URI += "gomod://github.com/pmezard/go-difflib;version=v1.0.0;sha256sum=de04cecc1a4b8d53e4357051026794bcbc54f2e6a260cfac508ce69d5d6457a0"
+SRC_URI += "gomod://github.com/russross/blackfriday/v2;version=v2.1.0;sha256sum=7852750d58a053ce38b01f2c203208817564f552ebf371b2b630081d7004c6ae"
+SRC_URI += "gomod://github.com/sirupsen/logrus;version=v1.8.1;sha256sum=8caec32e0aba1b95effc69d645b50f937137f78f0d0534b149f017dc0164a354"
+SRC_URI += "gomod://github.com/spf13/cobra;version=v1.6.0;sha256sum=61b6ba34cd34ac5f82f386bde90fc4531f84f0ace33ce82b9d5310d8e0101915"
+SRC_URI += "gomod://github.com/spf13/pflag;version=v1.0.5;sha256sum=fc6e704f2f6a84ddcdce6de0404e5340fa20c8676181bf5d381b17888107ba84"
+SRC_URI += "gomod://github.com/stretchr/objx;version=v0.1.0;sha256sum=1fa10dab404ed7fc8ed2a033f8784187d5df3513ced3841ce39e46d37850eb1d"
+SRC_URI += "gomod://github.com/stretchr/testify;version=v1.7.0;sha256sum=5a46ccebeff510df3e2f6d3842ee79d3f68d0e7b1554cd6ee93390d68b6c6b34"
+SRC_URI += "gomod://github.com/stretchr/testify;version=v1.3.0;sha256sum=8c935aed71cc334d5bfdf04b34909d9965cf28f80198dec13fb954dc292e6588"
+SRC_URI += "gomod://github.com/urfave/cli;version=v1.19.1;sha256sum=da2593f17d06e88d73dbbfc6c0fdf97cb25d858a3d86f675411aa9ad7694a48e"
+SRC_URI += "gomod://github.com/xeipuuv/gojsonpointer;version=v0.0.0-20180127040702-4e3ac2762d5f;sha256sum=5b1a4bcc8e003f214c92b3fa52959d9eb0e3af1c0c529efa55815db951146e48"
+SRC_URI += "gomod://github.com/xeipuuv/gojsonreference;version=v0.0.0-20180127040603-bd5ef7bd5415;sha256sum=7ec98f4df894413f4dc58c8df330ca8b24ff425b05a8e1074c3028c99f7e45e7"
+SRC_URI += "gomod://github.com/xeipuuv/gojsonschema;version=v1.2.0;sha256sum=55c8ce068257aa0d263aad7470113dafcd50f955ee754fc853c2fdcd31ad096f"
+SRC_URI += "gomod://golang.org/x/mod;version=v0.19.0;sha256sum=f98b5d576225d13dac6945afc53bc79cb66ad3ebd9a4eacdefbf629f4d20ea44"
+SRC_URI += "gomod://golang.org/x/sys;version=v0.19.0;sha256sum=f3e06adc66b840da7719fcf496d2916a38317706509fb5beed5932cd8ae5fb6b"
+SRC_URI += "gomod://golang.org/x/sys;version=v0.0.0-20210630005230-0f9fa26af87c;sha256sum=e28dd0a068bd7e9257a9f194e4b00bef0a37b83d5b10333ee001515cbd0bec1d"
+SRC_URI += "gomod://golang.org/x/tools;version=v0.13.0;sha256sum=6fd1e250112215709454468ead53c31c524b05cc90a62ed817d0d4780fdb6429"
+SRC_URI += "gomod://gopkg.in/check.v1;version=v0.0.0-20161208181325-20d25e280405;sha256sum=4e1817f964ca34e545b81afda0325a5e89cf58de2e413d8207c0afddd0fdc15c"
+SRC_URI += "gomod://gopkg.in/yaml.v2;version=v2.4.0;sha256sum=ede49e27c4cca6cdd2ec719aed8ea4d363710cceb3d411e7a786fbdec0d391fd"
+SRC_URI += "gomod://gopkg.in/yaml.v3;version=v3.0.1;sha256sum=aab8fbc4e6300ea08e6afe1caea18a21c90c79f489f52c53e2f20431f1a9a015"
+SRC_URI += "gomod://sigs.k8s.io/yaml;version=v1.4.0;sha256sum=ef031ff78ff9b7036e174eef49dfbd77468dc4f0afb73a639b61f8ab3a1cc425"
-- 
2.47.3


