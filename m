Return-Path: <jpuhlman@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C582CE00EE3; Fri,  8 Jun 2018 16:08:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.83.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7C13E010B9
	for <meta-virtualization@yoctoproject.org>;
	Fri,  8 Jun 2018 16:08:15 -0700 (PDT)
Received: by mail-pg0-f44.google.com with SMTP id z1-v6so7031902pgv.12
	for <meta-virtualization@yoctoproject.org>;
	Fri, 08 Jun 2018 16:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=wnuO8bk9zReLuV7WHHZpHO6mICSK2azbK6WxjDVhrFE=;
	b=l/kGM8SeIBLdd27atyVimHGek0EL2qKgWz+rVLvxDdzdWsUJGD1bwKcjXZ4QN/zkKO
	Y0F3OILNURkmaUoeCqpaCe8MiHnLTIU+jJnITuAhH5TMJOSsD1p/Rx97C39mVaPHvF+L
	ErA/pPLk14F4+Y9EIAVl0m9VDP7noMF0oETPfSuuS/htlikypYT4rqRAR0hjTyhY5UcV
	G3LdEScxlPA4TlorVm6md0lKo0cD/FHn96VghVuNGXdlnyjNri3RtWdgpXHovKclgMDT
	4t25xvV6tGz0QtokugKNY/SMLE4ZTzbMn4ePsXNoZUXA2eb+E1dAqEKQld87NAecwixq
	Pxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wnuO8bk9zReLuV7WHHZpHO6mICSK2azbK6WxjDVhrFE=;
	b=JIwuhLM9eJkWohci8sPY/jya5R/UCJI5cMdmqKKQvdMJMaWhV6QpNXKnAi/if71/OU
	F+k/81OM8+KwpyM0P8+0CxYJWlzgCVqQXb+I+f9VdIBgmP1cqarnebJw1OChRMIUBn9Z
	vmFZVqnzFli/qB5EIuhjWjvMl95Z+QtBND3z/k2A9SM+3uT9pS1NAJkNhyDU57T1tf+1
	2VJPJ1UNwFY235ax1crE10x/Yt4fe4Q5D07rEUR+as7BZxOr1GpXmYz/cbQcae9hzqFX
	bF6vE+bWVRggDgyVmiW7/bAEBEoDGb4bdlhNOSAFQQjzDEaInsEfmf5fwkiyRVahXRlv
	uGHQ==
X-Gm-Message-State: APt69E3jJncUPa3hh8b+HTYulBeIx1wkoUFgIndfEUh20naM3TfFdzFo
	PqBwPzSTzLupW4ecA3KrR6rwNLpl
X-Google-Smtp-Source: ADUXVKJ3cr+fdbQN2hXYej+2DRVBWCHaG45RTpKhUfSij1h1LydqilZ7Ri3OVMMhO7px/sT0fVxedA==
X-Received: by 2002:a65:4841:: with SMTP id i1-v6mr6719386pgs.75.1528499295124;
	Fri, 08 Jun 2018 16:08:15 -0700 (PDT)
Received: from workhorse.mvista.com
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	10-v6sm68659120pgb.40.2018.06.08.16.08.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 16:08:13 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  8 Jun 2018 16:08:11 -0700
Message-Id: <1528499291-7920-1-git-send-email-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.6.2
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [PATCH] lxc: uprev 3.0.1
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jun 2018 23:08:22 -0000

- Bug fix release
- Fixes gcc8 build failures
- Update patch for fuzz issues.
- remove --disable-python and --disable-lua as they have been removed

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 .../templates-actually-create-DOWNLOAD_TEMP-directory.patch    | 10 +++++-----
 recipes-containers/lxc/{lxc_3.0.0.bb => lxc_3.0.1.bb}          |  6 ++----
 2 files changed, 7 insertions(+), 9 deletions(-)
 rename recipes-containers/lxc/{lxc_3.0.0.bb => lxc_3.0.1.bb} (96%)

diff --git a/recipes-containers/lxc/files/templates-actually-create-DOWNLOAD_TEMP-directory.patch b/recipes-containers/lxc/files/templates-actually-create-DOWNLOAD_TEMP-directory.patch
index 359f662..44959db 100644
--- a/recipes-containers/lxc/files/templates-actually-create-DOWNLOAD_TEMP-directory.patch
+++ b/recipes-containers/lxc/files/templates-actually-create-DOWNLOAD_TEMP-directory.patch
@@ -22,12 +22,12 @@ Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/templates/lxc-download.in b/templates/lxc-download.in
-index f875183..5f1138c 100644
+index 973783b..015a679 100644
 --- a/templates/lxc-download.in
 +++ b/templates/lxc-download.in
-@@ -320,7 +320,7 @@ fi
- if ! command -V mktemp >/dev/null 2>&1; then
-   DOWNLOAD_TEMP="${DOWNLOAD_TEMP}/tmp/lxc-download.$$"
+@@ -323,7 +323,7 @@ elif [ -n "${DOWNLOAD_TEMP}" ]; then
+   mkdir -p "${DOWNLOAD_TEMP}"
+   DOWNLOAD_TEMP="$(mktemp -p ${DOWNLOAD_TEMP} -d)"
  else
 -  DOWNLOAD_TEMP="${DOWNLOAD_TEMP}$(mktemp -d)"
 +  DOWNLOAD_TEMP="$(mktemp -p ${DOWNLOAD_TEMP} -d)"
@@ -35,5 +35,5 @@ index f875183..5f1138c 100644
  
  # Simply list images
 -- 
-2.7.4
+2.11.1
 
diff --git a/recipes-containers/lxc/lxc_3.0.0.bb b/recipes-containers/lxc/lxc_3.0.1.bb
similarity index 96%
rename from recipes-containers/lxc/lxc_3.0.0.bb
rename to recipes-containers/lxc/lxc_3.0.1.bb
index 4f7526b..a77dd09 100644
--- a/recipes-containers/lxc/lxc_3.0.0.bb
+++ b/recipes-containers/lxc/lxc_3.0.1.bb
@@ -47,8 +47,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-net \
 	"
 
-SRC_URI[md5sum] = "ca1db4f9dc35df9203a58ab606cdfb7a"
-SRC_URI[sha256sum] = "6230224c27f050201b372b18a9f39cd220ed584899c5f0cf73c6b313dabc8d8a"
+SRC_URI[md5sum] = "8eb396dde561e5832ba2d505513a1935"
+SRC_URI[sha256sum] = "45986c49be1c048fa127bd3e7ea1bd3347e25765c008a09a2e4c233151a2d5db"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
@@ -76,8 +76,6 @@ PACKAGECONFIG[templates] = ",,, ${PN}-templates"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
 PACKAGECONFIG[seccomp] ="--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd,"
-PACKAGECONFIG[python] = "--enable-python,--disable-python,python3,python3-core"
-PACKAGECONFIG[lua] = "--enable-lua,--disable-lua,lua,lua"
 
 # required by python3 to run setup.py
 export BUILD_SYS
-- 
2.6.2


