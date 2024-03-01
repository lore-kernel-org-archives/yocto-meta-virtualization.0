Return-Path: <paul.leguendekerneizon@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80726C54E4A
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 13:07:24 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.22127.1709298439966995494
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 01 Mar 2024 05:07:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=PsuutO98;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: paul.leguendekerneizon@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 549519C52B1
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  1 Mar 2024 08:07:19 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 12sZyT1GiUsK; Fri,  1 Mar 2024 08:07:18 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id EB1E29C43DE;
	Fri,  1 Mar 2024 08:07:17 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com EB1E29C43DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1709298438; bh=g0rcHn/40fuwgpz2fR+vYivAzC5crPPhscNj3XPrMNY=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=PsuutO98g4JkLxxFX9v88zXAOgC8dtgH+3PL1uEDt83mJBVkpXFYjlY4FWcc7ERaR
	 IvgZw24yxyg37evjvf8fF2N8ZSyn2vmbqjs327dRqslsBeF50uOOoAFurzNLMLZ1VJ
	 zqT7xu9wzErQM3wDbOaNbEXFOmVotzFhyCtgr9NrpDmdqBGyTP++Sq803uKzrQ484M
	 pIc5M6zbN7XcdiTfBBlTwpUMc68tgueTVc9KLYsxI3VMbKl+1wE9/5G3xVent+8A7l
	 1rai5L8Eewmsr1hEKY33eQI43tGsOVa9EIkS4PIvUGPrQ5yMqvsegELsbipdFukiur
	 h1K54hJQeixfw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id pDmFBeRrJRRJ; Fri,  1 Mar 2024 08:07:17 -0500 (EST)
Received: from pleguen-ThinkPad-P14s-Gen-2a.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 82A679C52B1;
	Fri,  1 Mar 2024 08:07:17 -0500 (EST)
From: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Subject: [meta-virtualization][PATCH 1/1] virt-manager: add package
Date: Fri,  1 Mar 2024 14:07:04 +0100
Message-Id: <20240301130704.28605-2-paul.leguendekerneizon@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301130704.28605-1-paul.leguendekerneizon@savoirfairelinux.com>
References: <20240301130704.28605-1-paul.leguendekerneizon@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 01 Mar 2024 13:07:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8601

virt-manager is a graphical tool for managing virtual machines via
libvirt. By default, virt-manager is compiled with GUI dependency using
`gui` flag.
Build tested on aarch64 and x86-64 machines, with both with and without
gui PACKAGECONFIG flag.

Signed-off-by: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfa=
irelinux.com>
---
 ....py-move-global-args-to-install-args.patch | 76 +++++++++++++++++++
 .../virt-manager/virt-manager_4.1.0.bb        | 54 +++++++++++++
 2 files changed, 130 insertions(+)
 create mode 100644 recipes-extended/virt-manager/virt-manager/0001-setup=
.py-move-global-args-to-install-args.patch
 create mode 100644 recipes-extended/virt-manager/virt-manager_4.1.0.bb

diff --git a/recipes-extended/virt-manager/virt-manager/0001-setup.py-mov=
e-global-args-to-install-args.patch b/recipes-extended/virt-manager/virt-=
manager/0001-setup.py-move-global-args-to-install-args.patch
new file mode 100644
index 00000000..e9ab0f53
--- /dev/null
+++ b/recipes-extended/virt-manager/virt-manager/0001-setup.py-move-globa=
l-args-to-install-args.patch
@@ -0,0 +1,76 @@
+From bcdb3555b924573e85039b54d63d6173ad99b846 Mon Sep 17 00:00:00 2001
+From: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux=
.com>
+Date: Wed, 28 Feb 2024 10:24:00 +0100
+Subject: [PATCH] setup.py: move global args to install args
+
+Presently, during the installation process, global arguments such as
+`no-update-icon-cache` and `no-compile-schemas` are utilized to
+prevent the installation of specific graphical components. These
+arguments are essential, for instance, when installing virt-manager
+without any GUI dependencies on the target system. However, these
+global arguments must be set before the install command, yet they only
+take effect during the execution of the command.
+
+Since the Yocto `setuptools3_legacy` class parses arguments after the
+command, this commit aims to make these arguments applicable locally to
+the install command.
+
+Signed-off-by: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirf=
airelinux.com>
+---
+ setup.py | 20 ++++++++++++--------
+ 1 file changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index cd6cd83e..faca546a 100755
+--- a/setup.py
++++ b/setup.py
+@@ -242,6 +242,16 @@ class my_egg_info(setuptools.command.install_egg_in=
fo.install_egg_info):
+
+
+ class my_install(setuptools.command.install.install):
++    setuptools.command.install.install.user_options +=3D [
++        ("no-update-icon-cache", None, "Don't run gtk-update-icon-cache=
"),
++        ("no-compile-schemas", None, "Don't compile gsettings schemas")=
,
++    ]
++
++    def initialize_options(self):
++        setuptools.command.install.install.initialize_options(self)
++        self.no_update_icon_cache =3D None
++        self.no_compile_schemas =3D None
++
+     """
+     Error if we weren't 'configure'd with the correct install prefix
+     """
+@@ -266,12 +276,12 @@ class my_install(setuptools.command.install.instal=
l):
+     def run(self):
+         setuptools.command.install.install.run(self)
+
+-        if not self.distribution.no_update_icon_cache:
++        if not self.no_update_icon_cache:
+             print("running gtk-update-icon-cache")
+             icon_path =3D os.path.join(self.install_data, "share/icons/=
hicolor")
+             self.spawn(["gtk-update-icon-cache", "-q", "-t", icon_path]=
)
+
+-        if not self.distribution.no_compile_schemas:
++        if not self.no_compile_schemas:
+             print("compiling gsettings schemas")
+             gschema_install =3D os.path.join(self.install_data,
+                 "share/glib-2.0/schemas")
+@@ -421,14 +431,8 @@ class CheckPylint(setuptools.Command):
+
+
+ class VMMDistribution(setuptools.dist.Distribution):
+-    global_options =3D setuptools.dist.Distribution.global_options + [
+-        ("no-update-icon-cache", None, "Don't run gtk-update-icon-cache=
"),
+-        ("no-compile-schemas", None, "Don't compile gsettings schemas")=
,
+-    ]
+
+     def __init__(self, *args, **kwargs):
+-        self.no_update_icon_cache =3D False
+-        self.no_compile_schemas =3D False
+         setuptools.dist.Distribution.__init__(self, *args, **kwargs)
+
+
+--
+2.34.1
+
diff --git a/recipes-extended/virt-manager/virt-manager_4.1.0.bb b/recipe=
s-extended/virt-manager/virt-manager_4.1.0.bb
new file mode 100644
index 00000000..a2395012
--- /dev/null
+++ b/recipes-extended/virt-manager/virt-manager_4.1.0.bb
@@ -0,0 +1,54 @@
+DESCRIPTION =3D "virt-manager is a graphical tool for managing virtual m=
achines via libvirt"
+HOMEPAGE =3D "https://virt-manager.org/"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
+DEPENDS +=3D "python3-docutils-native"
+SRCREV =3D "6710ca6969b7d9c4e8344acd0fe3d50b24adc8ec"
+
+SRC_URI =3D " \
+  git://github.com/virt-manager/virt-manager;branch=3Dmain;protocol=3Dht=
tps \
+  file://0001-setup.py-move-global-args-to-install-args.patch \
+"
+
+S =3D "${WORKDIR}/git"
+
+PACKAGECONFIG ??=3D "gui"
+PACKAGECONFIG[gui] =3D ",--no-update-icon-cache --no-compile-schemas,pyt=
hon3-pygobject"
+
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'gui', 'gtk-icon-cache', '=
', d)}
+inherit bash-completion gettext pkgconfig setuptools3_legacy
+
+PACKAGES +=3D " \
+  ${PN}-common \
+  ${PN}-install \
+"
+
+RDEPENDS:${PN}-common +=3D " \
+  libvirt-python \
+  libosinfo \
+"
+
+RDEPENDS:${PN} =3D "${PN}-common"
+RDEPENDS:${PN}-install =3D "${PN}-common"
+
+SETUPTOOLS_INSTALL_ARGS +=3D "${PACKAGECONFIG_CONFARGS}"
+
+FILES:${PN} =3D " \
+  ${bindir}/virt-manager \
+  ${datadir}/icons/* \
+"
+
+FILES:${PN}-common =3D " \
+  ${libdir}/* \
+  ${libdir}/python3.10/* \
+  ${datadir}/applications \
+  ${datadir}/virt-manager \
+  ${datadir}/glib-2.0/* \
+  ${datadir}/metainfo/* \
+"
+
+FILES:${PN}-install =3D " \
+  ${bindir}/virt-clone \
+  ${bindir}/virt-install \
+  ${bindir}/virt-xml \
+"
--
2.34.1

