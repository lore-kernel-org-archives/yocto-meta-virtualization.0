Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2899FC433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 19:27:18 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.1339.1640028437253641486
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 11:27:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LpqCm9Nv;
 spf=pass (domain: mvista.com, ip: 209.85.167.177,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-oi1-f177.google.com with SMTP id w64so17263356oif.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 11:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/20GGrC9ynnwwdopaVtd2G8Jh8kCivodP5ASpAiVRaU=;
        b=LpqCm9Nvg4DI4v2gLeXgrEbxbniD4qyV99hjHTw1Bti+sm9y4Shxiz1RNdkKQ/MmmH
         YFwBtOT6ewIgk9iDOPZwXdTQ6k5DlctQEnrUFbrGn99eWC+E5jfXHwxSGhsHr/nTsNs4
         Zmb41U0DY23dUPtSmcLLTfJjgFm6rNu/dG3WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/20GGrC9ynnwwdopaVtd2G8Jh8kCivodP5ASpAiVRaU=;
        b=UFjLT0UilnGI+QVwjUx1re2UNMMUAz7P8Ld4C2cTiTc/4Zlg1PRuSuiA30anDDx0jG
         6F9p+sSvjwmRZAXWsp5zSGwDuxmD5aCf2y139d6gGDTR9VYko0iYk1sa2af7VS0PMhJA
         l6McA2TN2unqOJn8GcfVeq+LJmNqEbj7gvG2Kz6qwgPsh7oOC8yuT528BMAZ0f+ZCaOh
         Tw5w8p9fNhxzXH8R0kQgZLvipWRXNOUVFIPl3rANShrcFht5mC0suD+IBV35QOgWdGDy
         Rz80zC9JVOLRXnj4lujiVpQhPSljQFywzhbDkLVI3W8q0Jh4vJ1aNlq5ndL+CrbpXwEA
         hCFw==
X-Gm-Message-State: AOAM531gRKQ5UUN4+zPkTEXxt6xZgSrU3WAaM3ChG9n8juJnh4YjDTp/
	eaWX+MPup0TM9L+JZKdt0/dLfRApCv5s+w==
X-Google-Smtp-Source: 
 ABdhPJweZVCDYcKOxDQs1ZBc1v/IdhhYYIKVrkvqEvk6fz+UJ+3aRosxEn2i4pNhvNdHFsbPE2imuw==
X-Received: by 2002:aca:1811:: with SMTP id h17mr404597oih.178.1640028436213;
        Mon, 20 Dec 2021 11:27:16 -0800 (PST)
Received: from blue (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id k8sm3265047oon.2.2021.12.20.11.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 11:27:15 -0800 (PST)
Received: by blue (sSMTP sendmail emulation); Mon, 20 Dec 2021 11:27:13 -0800
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-virtualization][m-c-s][PATCH] mod-wsgi: move to 4.9.0
Date: Mon, 20 Dec 2021 11:27:06 -0800
Message-Id: <20211220192706.4002841-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Dec 2021 19:27:18 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/6981

Older version of mod-wsgi no longer builds against python 3.10

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 ...ow-PYTHON-values-to-be-passed-via-en.patch | 37 +++++++++----------
 .../recipes-support/mod-wsgi/mod-wsgi_git.bb  |  4 +-
 2 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/meta-openstack/recipes-support/mod-wsgi/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch b/meta-openstack/recipes-support/mod-wsgi/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
index 4683db0a..79aedffd 100644
--- a/meta-openstack/recipes-support/mod-wsgi/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
+++ b/meta-openstack/recipes-support/mod-wsgi/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
@@ -7,28 +7,31 @@ This allows the recipe to specify specific values instead of them
 being 'discovered' which may lead to host contamination or similar
 issues.
 
+Updated for 4.9.0: Jeremy Puhlman
+
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
----
+----
  configure.ac | 41 +++++++++++++++++++++++++++++++++++++++++
  1 file changed, 41 insertions(+)
 
+
 diff --git a/configure.ac b/configure.ac
-index 25afe44..b5a9e03 100644
+index 37a0f86..9b77c7f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -100,26 +100,38 @@ fi
+@@ -106,26 +106,38 @@ fi
  
  AC_SUBST(PYTHON)
  
 +if test -z "${PYTHON_VERSION}"; then
  PYTHON_VERSION=`${PYTHON} -c 'from sys import stdout; \
-     from distutils import sysconfig; \
+     import sysconfig; \
      stdout.write(sysconfig.get_config_var("VERSION"))'`
 +fi
  
 +if test -z "${PYTHON_LDVERSION}"; then
  PYTHON_LDVERSION=`${PYTHON} -c 'from sys import stdout; \
-     from distutils import sysconfig; \
+     import sysconfig; \
      stdout.write(sysconfig.get_config_var("LDVERSION") or "")'`
 +fi
  
@@ -38,7 +41,7 @@ index 25afe44..b5a9e03 100644
  
 +if test -z "${PYTHON_INCLUDEPY}"; then
  CPPFLAGS1=`${PYTHON} -c 'from sys import stdout; \
-     from distutils import sysconfig; \
+     import sysconfig; \
      stdout.write("-I" + sysconfig.get_config_var("INCLUDEPY"))'`
 +else
 +CPPFLAGS1="${PYTHON_INCLUDEPY}"
@@ -46,7 +49,7 @@ index 25afe44..b5a9e03 100644
  
 +if test -z "${PYTHON_CFLAGS}"; then
  CPPFLAGS2=`${PYTHON} -c 'from sys import stdout; \
-     from distutils import sysconfig; \
+     import sysconfig; \
      stdout.write(" ".join(filter(lambda x: x.startswith("-D"), \
      sysconfig.get_config_var("CFLAGS").split())))'`
 +else
@@ -55,13 +58,13 @@ index 25afe44..b5a9e03 100644
  
  if test "${ENABLE_EMBEDDED}" != "yes"; then
  CPPFLAGS3="-DMOD_WSGI_DISABLE_EMBEDDED"
-@@ -131,22 +143,43 @@ CPPFLAGS="${CPPFLAGS} ${CPPFLAGS1} ${CPPFLAGS2} ${CPPFLAGS3}"
+@@ -137,22 +149,42 @@ CPPFLAGS="${CPPFLAGS} ${CPPFLAGS1} ${CPPFLAGS2} ${CPPFLAGS3}"
  
  AC_SUBST(CPPFLAGS)
  
 +if test -z "${PYTHON_LIBDIR}"; then
  PYTHONLIBDIR=`${PYTHON} -c 'from sys import stdout; \
-     from distutils import sysconfig; \
+     import sysconfig; \
      stdout.write(sysconfig.get_config_var("LIBDIR"))'`
 +else
 +PYTHONLIBDIR="${PYTHON_LIBDIR}"
@@ -76,22 +79,21 @@ index 25afe44..b5a9e03 100644
 +fi
 +if test -z "${PYTHON_FRAMEWORKDIR}"; then
  PYTHONFRAMEWORKDIR=`${PYTHON} -c 'from sys import stdout; \
-     from distutils import sysconfig; \
+     import sysconfig; \
      stdout.write(sysconfig.get_config_var("PYTHONFRAMEWORKDIR"))'`
 +else
 +PYTHONFRAMEWORKDIR="${PYTHON_FRAMEWORKDIR}"
 +fi
-+
 +if test -z "${PYTHON_FRAMEWORKPREFIX}"; then
  PYTHONFRAMEWORKPREFIX=`${PYTHON} -c 'from sys import stdout; \
-     from distutils import sysconfig; \
+     import sysconfig; \
      stdout.write(sysconfig.get_config_var("PYTHONFRAMEWORKPREFIX"))'`
 +else
 +PYTHONFRAMEWORKPREFIX="${PYTHON_FRAMEWORKPREFIX}"
 +fi
 +if test -z "${PYTHON_FRAMEWORK}"; then
  PYTHONFRAMEWORK=`${PYTHON} -c 'from sys import stdout; \
-     from distutils import sysconfig; \
+     import sysconfig; \
      stdout.write(sysconfig.get_config_var("PYTHONFRAMEWORK"))'`
 +else
 +PYTHONFRAMEWORK="${PYTHON_FRAMEWORK}"
@@ -99,20 +101,20 @@ index 25afe44..b5a9e03 100644
  
  if test "${PYTHON_LDVERSION}" != "${PYTHON_VERSION}"; then
      PYTHONCFGDIR="${PYTHONCFGDIR}-${PYTHON_LDVERSION}"
-@@ -170,12 +203,20 @@ if test "${PYTHONFRAMEWORKDIR}" = "no-framework" -o \
+@@ -180,12 +212,20 @@ if test "${PYTHONFRAMEWORKDIR}" = "no-framework" -o \
          LDLIBS1="-lpython${PYTHON_VERSION}"
      fi
  
 +    if test -z "${PYTHON_LIBS}"; then
      LDLIBS2=`${PYTHON} -c 'from sys import stdout; \
-         from distutils import sysconfig; \
+         import sysconfig; \
          stdout.write(sysconfig.get_config_var("LIBS"))'`
 +    else
 +    LDLIBS2="${PYTHON_LIBS}"
 +    fi
 +    if test -z "${PYTHON_SYSLIBS}"; then
      LDLIBS3=`${PYTHON} -c 'from sys import stdout; \
-         from distutils import sysconfig; \
+         import sysconfig; \
          stdout.write(sysconfig.get_config_var("SYSLIBS"))'`
 +    else
 +    LDLIBS3="${PYTHON_SYSLIBS}"
@@ -120,6 +122,3 @@ index 25afe44..b5a9e03 100644
  else
      LDFLAGS1="-Wl,-F${PYTHONFRAMEWORKPREFIX} -framework ${PYTHONFRAMEWORK}"
  
--- 
-2.7.4
-
diff --git a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb b/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
index 79afba81..910bba1b 100644
--- a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
+++ b/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
@@ -9,8 +9,8 @@ HOMEPAGE = "https://github.com/GrahamDumpleton/mod_wsgi"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "217e80b7436035723b80ff02ee349365e8553dfc"
-PV = "4.6.8+git${SRCPV}"
+SRCREV = "df9faf954a1ab6208f45ba6fde90f0b41f605483"
+PV = "4.9.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1


