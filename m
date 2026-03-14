Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4EC107BCFD
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 07:15:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5505.1773472497840413843
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 14 Mar 2026 00:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GE/+O7hG;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=hryH8sFx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E4DFuA723713
	for <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Mar 2026 07:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VgW/QSwVeomdt8IuCchtebtgixGrJQ6xy5l
	ZV2Fkgg8=; b=GE/+O7hGr5XspqoDNgQ+4La6tQPopOIowwALrraCzGBQ7CBWib1
	b5VkNKj4+NGVoD86LLt6ZxxsFOnzFRYaTlVbuF4j5mGmmQtEKKBSrsO6MdUuGm7X
	I/+2bRhbmQGtc10FdqUcdO+6ZGUeZ09enqSRHrYF8PJGzOqEntnxziMpHBX0I4qt
	Wp/Kq2KrbY+0aM+DurtQW8sMqXzCnsl4E/zty2zpFh2QomwkfT1q7vAl3K+BRVb9
	exMxjRuhxYRWjxn+xQS5MJ2psOXK4WVYxg4GPYVtXVg9m+Qda1QceAKcSJJtJOvh
	mhh+j9Z7cJ+8gBMrBl5ZNa/oSlZgpVc94yQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0ec88uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Mar 2026 07:14:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aecbb78e44so75129645ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Mar 2026 00:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773472496; x=1774077296; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VgW/QSwVeomdt8IuCchtebtgixGrJQ6xy5lZV2Fkgg8=;
        b=hryH8sFxU9oJeERc1HMqJ3VPiEf9AqjwahQlTJ5V6FduNqQSEQc665NAbumlwETpjv
         DbESCuIphM9NoFC26TcSNEDnk9vxdhd+8XB7QZEInsA6+2DChvurYUNHVqS+J/JDPGXu
         T4SNhckrv85s4QsIbfzM96uDN2lGbVl92V7pH2KzsGAePR78fp0bskNcVjcsdoyptL9/
         JgESfX3XUbnug6xPocAs3krwnzRLNs42mOx/jkb9S0BhoJ+sLJELvzFfn2qsw+fR3cvR
         sV/YZdFYUubYb8GQhiI+NKGphr8oDsuFDShfs0y3SX/BJXXti/L/Rm0LH4JlBNhdAtUz
         +0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773472496; x=1774077296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgW/QSwVeomdt8IuCchtebtgixGrJQ6xy5lZV2Fkgg8=;
        b=V6AH/uSmptJHTaO+UH8vwaZFk3CO3Teuz7HUUlp2FQpRrLJrP1AG02cMKsSYB/lRi5
         jFelh0QV8k5pP2VWvSP9d96Qp77X81dIgBfMp76cLsGnvZwsNUIZi3Sz1hHuaw98qAQg
         oMIC7zN7gNxIAFSUpViMtjMG0eUVpzv5idfWCPLCbEMFoNsyh/UWIpbmYt/1LO1/EkUR
         I5gANupZfeQYqsbqGjwcP+6hxPpL7dq6v/lESP7SX6WRtf+2R8ZB6mwYHX+Z7RgBVvft
         hT37hTrX2jQN9vSviUpvauOvk6IDiG+ffwA961Q4w/i7BS3lVHujTqMV6AY9UWCW+6gf
         9YqA==
X-Gm-Message-State: AOJu0YxyGlSarWAo5/JZOZ8hSD+Uf3hknmVpdc/o7LhsBMJ2Cgur7EZQ
	FkbkE3b3ldQKh/R0RS4ESzgdJbV6V+iPIw7QsNBJRzw7A1hIBgi9IPPfwaTDr4eulrLUn50WaT8
	n9M9moXiylxZp7S6BD+uya4uJ3hxLVqZy7+H+O7sHCNmrrjmAEklZb6I02e3FuPhNUb+fd//us2
	u0bwzE06BsBpr2Mlne6w==
X-Gm-Gg: ATEYQzwwKz4KSbBNAcnC/9XphOTvLl2z0UjlWd9kIVk07xOTSUHe17M4yNxOSgQq3FY
	swo8FWtQhjJL+eZUtP94zkOxih8+nrxy3Ie1jHx8FmW8b2qpgEXhkXakubV3TZXQdck5GdzPEe8
	Z+jNMZVCAJ6MwxO7c7SpLduzb9eLWmC5BOWl+gByeQ52Z7WtESG6mD+W5ZD1OWXXWif6zhkADfP
	6WYueA4ewP2qOwtwVZ0vr8uXX3cEIhsFIOTjlc8B9zkVJhP5YqkuIP3YDk9F1LHMkt1cHp5XvQA
	vHEHO0APLpWkXYUyejlX+h+eoNXYaO6bbHw1rXIW0ef9qCYHcdzK2ssxmPvqnNazcoipv3kFINw
	pDh674pyfe35OnVuvWz8VSm7ybHd0raZDlQ0kKTiQ80acZR6ssnuRyBko0AbcYOd3TbNLXsyqDo
	FXz3+iIXdVgUJs85GRBEk=
X-Received: by 2002:a17:903:1983:b0:2ae:c5fc:b2e6 with SMTP id d9443c01a7336-2aecaaad124mr56277885ad.28.1773472496429;
        Sat, 14 Mar 2026 00:14:56 -0700 (PDT)
X-Received: by 2002:a17:903:1983:b0:2ae:c5fc:b2e6 with SMTP id d9443c01a7336-2aecaaad124mr56277765ad.28.1773472495893;
        Sat, 14 Mar 2026 00:14:55 -0700 (PDT)
Received: from hyd-e160-a01-2-02.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece81dc18sm43161985ad.69.2026.03.14.00.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 00:14:55 -0700 (PDT)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [meta-virtualization][PATCH] lxc: backport fixes to build with glibc 2.43
Date: Sat, 14 Mar 2026 12:44:47 +0530
Message-Id: <20260314071447.2558206-1-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dLb5auYXey_Bp0K_LFJeTUuhF0Jrp3e0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDA1NCBTYWx0ZWRfX09CdPOB1FN3A
 32HldflfhbUqG1Oif0yJPtP/u8xFpgZkaYhAS/ZnKHenFCII/BdPbLPVYcz3U8d8wpS+VWdlozn
 3opN+eJfNWHahLA5xMjtwijX9qmipl+S/OUSfLmNPogNvC5WYhTHErxQ+4q6Ox8bIOnLA3l3a/g
 39I69fIlPTDsVC+wdNlIJD2HoGN85Yr1i/Bww4UNWDs/H9JPZGZCYOknK9qUCMf6tvJIo+BshHW
 mb+K8/3VrgKAyso6XAU24PUAut7Fqd9731AfODBsaWxCxAftH1PZBO7payhnqMr5gLSn2GN280b
 Wa1VQB8pI6A/nJEsUymv/pXRhoxNYV4N2HHv5Pyd5Vkhz0pxsrwjZl+yj4Iyoi1J1abO4wBwClE
 IymENHtD+36DXzbqmghOYLS4MEBkOOfjpuEoH1AR+JJchuq61uExNmaXTSWDstVuWrYhQYLPOV6
 iiKbgn36J6yNg76r9RA==
X-Proofpoint-ORIG-GUID: dLb5auYXey_Bp0K_LFJeTUuhF0Jrp3e0
X-Authority-Analysis: v=2.4 cv=BqqQAIX5 c=1 sm=1 tr=0 ts=69b50af1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=dZbOZ2KzAAAA:8 a=7mOBRU54AAAA:8 a=yj8IN82nhoLklf4Ubo4A:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=wa9RWnbW_A1YIeRBVszw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1011 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140054
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Mar 2026 07:15:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9654

Building lxc with glibc 2.43 fails due to stricter header checks and
FORTIFY related validations.

Backport the following upstream fixes to resolve these build failures:
  - meson.build: fix open_how include handling for glibc 2.43+
  - meson.build: fix openat2 include typo exposed by glibc 2.43 + FORTIFY

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 ...fix-open_how-include-with-glibc-2.43.patch | 40 +++++++++++++++++++
 ...openat2-include-typo-fix-with-glibc-.patch | 29 ++++++++++++++
 recipes-containers/lxc/lxc_git.bb             |  2 +
 3 files changed, 71 insertions(+)
 create mode 100644 recipes-containers/lxc/files/0001-meson.build-fix-open_how-include-with-glibc-2.43.patch
 create mode 100644 recipes-containers/lxc/files/0001-meson.build-fix-openat2-include-typo-fix-with-glibc-.patch

diff --git a/recipes-containers/lxc/files/0001-meson.build-fix-open_how-include-with-glibc-2.43.patch b/recipes-containers/lxc/files/0001-meson.build-fix-open_how-include-with-glibc-2.43.patch
new file mode 100644
index 00000000..1b3d4de6
--- /dev/null
+++ b/recipes-containers/lxc/files/0001-meson.build-fix-open_how-include-with-glibc-2.43.patch
@@ -0,0 +1,40 @@
+From 388a511a7070d1ea9c6b8d2d98e6fa9a3efb0e87 Mon Sep 17 00:00:00 2001
+From: Li Lu <1487442471@qq.com>
+Date: Wed, 18 Feb 2026 09:24:26 +0800
+Subject: [PATCH] meson.build: fix open_how include with glibc-2.43+
+
+Signed-off-by: Li Lu <1487442471@qq.com>
+Upstream-Status: Backport [https://github.com/lxc/lxc/commit/5e68a7a633659039d9b114d2b75fdba0df51e52c]
+---
+ meson.build          | 1 +
+ src/lxc/open_utils.h | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index 31f5472c5..637ee9873 100644
+--- a/meson.build
++++ b/meson.build
+@@ -664,6 +664,7 @@ endforeach
+ 
+ ## Types.
+ decl_headers = '''
++#include <fcntl.h>
+ #include <uchar.h>
+ #include <sys/mount.h>
+ #include <sys/stat.h>
+diff --git a/src/lxc/open_utils.h b/src/lxc/open_utils.h
+index 7ff5945c7..c9b978dbf 100644
+--- a/src/lxc/open_utils.h
++++ b/src/lxc/open_utils.h
+@@ -25,6 +25,8 @@ struct open_how {
+ 	__u64 mode;
+ 	__u64 resolve;
+ };
++#else
++#include <fcntl.h>
+ #endif
+ 
+ /* how->resolve flags for openat2(2). */
+-- 
+2.34.1
+
diff --git a/recipes-containers/lxc/files/0001-meson.build-fix-openat2-include-typo-fix-with-glibc-.patch b/recipes-containers/lxc/files/0001-meson.build-fix-openat2-include-typo-fix-with-glibc-.patch
new file mode 100644
index 00000000..d84f17c7
--- /dev/null
+++ b/recipes-containers/lxc/files/0001-meson.build-fix-openat2-include-typo-fix-with-glibc-.patch
@@ -0,0 +1,29 @@
+From 66ca3b2dee22d2d256e74ec55de2e5b0c975037c Mon Sep 17 00:00:00 2001
+From: Joonas Niilola <juippis@gentoo.org>
+Date: Sun, 15 Feb 2026 17:42:39 +0200
+Subject: [PATCH] meson.build: fix openat2 include typo, fix with glibc-2.43
+ +FORTIFY
+
+Closes: https://github.com/lxc/lxc/issues/4641
+Signed-off-by: Joonas Niilola <juippis@gentoo.org>
+Upstream-Status: Backport [https://github.com/lxc/lxc/commit/511e4db8f2a5b47cdd41eef482647492ce5b0f77]
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 637ee9873..a6bb21a94 100644
+--- a/meson.build
++++ b/meson.build
+@@ -557,7 +557,7 @@ foreach ident: [
+     ['move_mount',        '''#include <sys/mount.h>'''],
+     ['openat2',           '''#include <sys/types.h>
+                              #include <sys/stat.h>
+-                             #include <fctnl.h>'''],
++                             #include <fcntl.h>'''],
+     ['open_tree',         '''#include <sys/mount.h>'''],
+     ['personality',       '''#include <sys/personality.h>'''],
+     ['pidfd_open',        '''#include <stdlib.h>
+-- 
+2.34.1
+
diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
index 04db2ac0..0b6cbb75 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -46,6 +46,8 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=stable-6.0;protocol=https \
 	file://tests-our-init-is-not-busybox.patch \
 	file://0001-template-if-busybox-contains-init-use-it-in-containe.patch \
 	file://0001-build-Check-if-P_PIDFD-is-defined.patch \
+        file://0001-meson.build-fix-openat2-include-typo-fix-with-glibc-.patch \
+        file://0001-meson.build-fix-open_how-include-with-glibc-2.43.patch \
 	file://dnsmasq.conf \
 	file://lxc-net \
 	"

