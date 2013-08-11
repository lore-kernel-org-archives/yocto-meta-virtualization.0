Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3BC5BE01431
	for <meta-virtualization@yoctoproject.org>;
	Sat, 10 Aug 2013 21:16:55 -0700 (PDT)
Received: by mail-ee0-f44.google.com with SMTP id b47so2868058eek.3
	for <meta-virtualization@yoctoproject.org>;
	Sat, 10 Aug 2013 21:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=WgRx2t/93Y3VcO7gNAEK9l0+BGb2bnt9fv7SV0lsNTM=;
	b=fA25iEeOdVFoYSVzz4PNKZWs8BP3TK9s6h4i76MPG1oFR1XF3DufZnTIxQtma83mQX
	4zxHJuw2z6fWQgVL/I+zfaouBh3l7J0DzgN6qJHOiYHDKFHVv/MqRsMmV00/vcXlqca5
	T+oEPqAKypof4MDAWT1aAXo1CpEmMHZvyl6mgudCoumFUiIJOuTFncCl+DyLkhjjL/4/
	SwttxMBO5lmibqrYrvdaTjL1PWzjRqg7vsFeVIPzEQhVthjrpoYNfkLcp4xk/dPMHQec
	afz1Nsc2xef9eI6LUI4AQSrj9pSX3Wu2H+hD4TfO/9NTDe47StBADhoQ6rDvB9CasUd2
	unPA==
X-Received: by 10.14.9.129 with SMTP id 1mr19830446eet.59.1376194614173;
	Sat, 10 Aug 2013 21:16:54 -0700 (PDT)
Received: from yow-bashfiel-d2.wrs.com ([128.224.252.2])
	by mx.google.com with ESMTPSA id f49sm38830324eec.7.2013.08.10.21.16.52
	for <meta-virtualization@yoctoproject.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 10 Aug 2013 21:16:53 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: meta-virtualization@yoctoproject.org
Date: Sun, 11 Aug 2013 00:16:58 -0400
Message-Id: <1376194618-25627-3-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1376194618-25627-1-git-send-email-bruce.ashfield@windriver.com>
References: <1376194618-25627-1-git-send-email-bruce.ashfield@windriver.com>
Subject: [PATCH 2/2] libvirt: move python PACKAGECONFIG into main recipe
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
X-List-Received-Date: Sun, 11 Aug 2013 04:16:56 -0000

The libvirt-python.inc manipulation of PACKAGECONFIG meant that the default
configuration options of the libvirt recipe never fired, since the variable
had an assignment and the lazy set of the configuration values never
applied to the build.

Moving the python PACKAGE_CONFIG options into the main recipe, and ensuring
that PACKAGE_CONFIG_${PN} is used for libvirt-python means that most builds
will now use the default configuration.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 recipes-extended/libvirt/libvirt-python.inc |    2 --
 recipes-extended/libvirt/libvirt_1.1.1.bb   |    7 ++++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index d4cc5f3..3d09d09 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -5,8 +5,6 @@ export STAGING_LIBDIR
 export BUILD_SYS 
 export HOST_SYS
 
-PACKAGECONFIG += "python"
-PACKAGECONFIG[python] = "--with-python,--without-python,python,"
 RDEPENDS_${PN}-python += "python"
 PACKAGECONFIG_${PN}-python[xen] = ",,,xen-python"
 
diff --git a/recipes-extended/libvirt/libvirt_1.1.1.bb b/recipes-extended/libvirt/libvirt_1.1.1.bb
index 4502e85..2b971df 100644
--- a/recipes-extended/libvirt/libvirt_1.1.1.bb
+++ b/recipes-extended/libvirt/libvirt_1.1.1.bb
@@ -112,9 +112,9 @@ INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
 
 # full config
 PACKAGECONFIG ??= "qemu yajl xen libxl xen-inotify uml openvz vmware vbox esx \
-	          polkit lxc test remote macvtap libvirtd netcf udev python \
-	          ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
-	          ebtables"
+                   polkit lxc test remote macvtap libvirtd netcf udev python ebtables \
+                   {@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+                  "
 
 # enable,disable,depends,rdepends
 #
@@ -142,6 +142,7 @@ PACKAGECONFIG[dtrace] = "--with-dtrace,--without-dtrace,,"
 PACKAGECONFIG[udev] = "--with-udev --with-pciaccess,--without-udev,udev libpciaccess,"
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux,"
 PACKAGECONFIG[ebtables] = "ac_cv_path_EBTABLES_PATH=/sbin/ebtables,ac_cv_path_EBTABLES_PATH=,ebtables,ebtables"
+PACKAGECONFIG[python] = "--with-python,--without-python,python,"
 
 # Enable the Python tool support
 require libvirt-python.inc
-- 
1.7.10.4


