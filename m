Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93F1E6C611
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 07:36:32 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.14244.1733211384811416438
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Dec 2024 23:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WiDkTCEQ;
 spf=pass (domain: mvista.com, ip: 209.85.167.175, mailfrom: vanusuri@mvista.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3ea78529de1so2044534b6e.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Dec 2024 23:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1733211383; x=1733816183; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6+DEMto475N6EnTmEqczY11n8+saoLpU4ATX+6GWFHw=;
        b=WiDkTCEQuKoBy/CoXZOiBQ3LV1JykLAqrOmP683aERCDnqYpMnQnb1/QwAvgFkG9sJ
         NANX/T1d1ATrdgXAwSfAWdVUz9ZrmPqAajdbJ5Lx98bSuMEdEMaMgK9wxgIRzbHlGkqP
         HlKvqWkisqLyBjDq99KE+Bopy3vVIf5fxdlA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733211383; x=1733816183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+DEMto475N6EnTmEqczY11n8+saoLpU4ATX+6GWFHw=;
        b=nyYW/xg1vjRuyonLPHFViN4ceiDLG/PWIxwHF3eGQUHL702iQVfuJiyaiLZ5lNSj8X
         oMn9f9ln9HEl9jOnGKKsbaSodnjDzkvK1+t4s+FugMJ6HgYW19o8HQNjSREBOmvRZRUw
         VKizYT1q6XaBWRdXlxgxbKh5sH3DBd0uH1IJPEHsV9ka/PEQ+L7CsC2L859ORVprQvFu
         8pIG/nkKBb4BKGajhzWryCfwOFyh1u5iSHaB+wHcY1GB7s3ozCLdh+rOTnineIZ5i/2U
         iisiMhXAdjdBxOksed5aA6GLh0qtxMDnYANuJoqdCnvgVSYyGJu9WDx2r9XSH2dkccsv
         eK5w==
X-Gm-Message-State: AOJu0YwH0mG+Woe70sLI676SS4DwBCmSlYlS5+NmVdgGU+S7lKLW0FCS
	GyMgYG8YnUJGDRvI2YDl82gD4jDQ5Ax2ClMcnuy0WVQfGgXffehuW5M3G4RI6FBGjD2Y1IogLno
	Y
X-Gm-Gg: ASbGncupcTcwfnugDyC1rMUS4bKqt42rbbk9FD75ajGr00f0M9+J3Tedo8rfi6/u2Ao
	CgUoVDxxuaaiJVySr5etHXhczncU27HEysn50h/lENbEC7fQPds3ArM4Lyve1zQRQyRt5Sqio7p
	HxS8By0lzzFZ9M9zMIjSFoP2m+bh+t2Sigt9vG0k+mKjTrAOp0C9NGcZpZytDOpa8trk239HH5e
	PMThh8YY87opFYEpDS074PNT77YqnOVo4iKYsfByc4b262Y5aNXevlx9ELhQA==
X-Google-Smtp-Source: AGHT+IFd+TgpdFTN62GRkdH4nWOo7WMFhwFfyaZo0/07JrUX/KBoKtEPV7wZG1qrLrdGpFWEY+VsgA==
X-Received: by 2002:a05:6808:201e:b0:3e9:1750:426d with SMTP id 5614622812f47-3eae4f32d4amr1293650b6e.13.1733211383518;
        Mon, 02 Dec 2024 23:36:23 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.198.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725417fbae3sm10044267b3a.102.2024.12.02.23.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 23:36:22 -0800 (PST)
From: vanusuri@mvista.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Vijay Anusuri <vanusuri@mvista.com>,
	Anand Je Sypureddy <anandje@mvista.com>
Subject: [meta-virtualization][m-c-s][master][PATCH] mod-wsgi: upgrade 4.9.0 -> 5.0.2
Date: Tue,  3 Dec 2024 13:06:12 +0530
Message-Id: <20241203073612.1333327-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Dec 2024 07:36:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9033

From: Vijay Anusuri <vanusuri@mvista.com>

mod-wsgi version 4.9.0 doesn't build against python 3.13
update it to 5.0.2 which does build.

Refreshed configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch for 5.0.2 version.

Signed-off-by: Anand Je Sypureddy <anandje@mvista.com>
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...ow-PYTHON-values-to-be-passed-via-en.patch | 22 ++++++++++---------
 .../recipes-support/mod-wsgi/mod-wsgi_git.bb  |  4 ++--
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/meta-openstack/recipes-support/mod-wsgi/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch b/meta-openstack/recipes-support/mod-wsgi/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
index 79aedffd..6718a4a2 100644
--- a/meta-openstack/recipes-support/mod-wsgi/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
+++ b/meta-openstack/recipes-support/mod-wsgi/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
@@ -9,14 +9,14 @@ issues.
 
 Updated for 4.9.0: Jeremy Puhlman
 
+Upstream-Status: Pending
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
-----
- configure.ac | 41 +++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 41 insertions(+)
-
+---
+ configure.ac | 40 ++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 40 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 37a0f86..9b77c7f 100644
+index f994dd7..8774010 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -106,26 +106,38 @@ fi
@@ -58,7 +58,7 @@ index 37a0f86..9b77c7f 100644
  
  if test "${ENABLE_EMBEDDED}" != "yes"; then
  CPPFLAGS3="-DMOD_WSGI_DISABLE_EMBEDDED"
-@@ -137,22 +149,42 @@ CPPFLAGS="${CPPFLAGS} ${CPPFLAGS1} ${CPPFLAGS2} ${CPPFLAGS3}"
+@@ -137,21 +149,41 @@ CPPFLAGS="${CPPFLAGS} ${CPPFLAGS1} ${CPPFLAGS2} ${CPPFLAGS3}"
  
  AC_SUBST(CPPFLAGS)
  
@@ -71,9 +71,8 @@ index 37a0f86..9b77c7f 100644
 +fi
 +if test -z "${PYTHON_CFGDIR}"; then
  PYTHONCFGDIR=`${PYTHON} -c 'from sys import stdout; \
-     import distutils.sysconfig; \
-     stdout.write(distutils.sysconfig.get_python_lib(plat_specific=1, \
-     standard_lib=1) +"/config")'`
+     import sysconfig; \
+     stdout.write(sysconfig.get_path("platstdlib") +"/config")'`
 +else
 +PYTHONCFGDIR="${PYTHON_CFGDIR}"
 +fi
@@ -101,7 +100,7 @@ index 37a0f86..9b77c7f 100644
  
  if test "${PYTHON_LDVERSION}" != "${PYTHON_VERSION}"; then
      PYTHONCFGDIR="${PYTHONCFGDIR}-${PYTHON_LDVERSION}"
-@@ -180,12 +212,20 @@ if test "${PYTHONFRAMEWORKDIR}" = "no-framework" -o \
+@@ -179,12 +211,20 @@ if test "${PYTHONFRAMEWORKDIR}" = "no-framework" -o \
          LDLIBS1="-lpython${PYTHON_VERSION}"
      fi
  
@@ -122,3 +121,6 @@ index 37a0f86..9b77c7f 100644
  else
      LDFLAGS1="-Wl,-F${PYTHONFRAMEWORKPREFIX} -framework ${PYTHONFRAMEWORK}"
  
+-- 
+2.25.1
+
diff --git a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb b/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
index b0daf54d..f22a2426 100644
--- a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
+++ b/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
@@ -9,8 +9,8 @@ HOMEPAGE = "https://github.com/GrahamDumpleton/mod_wsgi"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "df9faf954a1ab6208f45ba6fde90f0b41f605483"
-PV = "4.9.0+git${SRCPV}"
+SRCREV = "1b645ebd7d87f7a27d23690c19e97dbf8dafe6b4"
+PV = "5.0.2+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


