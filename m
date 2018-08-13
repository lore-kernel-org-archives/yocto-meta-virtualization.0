Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D208EE00887; Sun, 12 Aug 2018 18:55:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.223.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ECC38E0083D
	for <meta-virtualization@yoctoproject.org>;
	Sun, 12 Aug 2018 18:55:41 -0700 (PDT)
Received: by mail-io0-f195.google.com with SMTP id p6-v6so3941724iom.12
	for <meta-virtualization@yoctoproject.org>;
	Sun, 12 Aug 2018 18:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4KVpoChnG6H6bkmBz+Gqua1C3Z7RWUYPls8XXOKGIBo=;
	b=EFFQzT2h6I+C+sv9SuAB8PRJ2VKISS4yd/8sSg0N7+R7gdwfid8yX7hDTttJj9cU+D
	dMxOIxQuDYkpH2guRwWSMu4CavcF9VPCE8D3FDri15pXT1pMrl33nyROj34O50ChBvSg
	wwBQqqUuaVgq24RzhvtfQKDxdT/5kMTh+UVmXT5+/E7sFHx7cYdUa4irN0+/9GD9rpGH
	wzlFPNpFqX5C7/ecsrAW999qsNp3LrmoDaL/9nAMvAPnqfhJGG9qXMgSIBXNPJ5p3tBI
	L4gbVHCmzN5P8e1DB70kEX4qw7McTKwdMJ7W51EmPxrw60Abt3ByUL8UdgtkPUCQH1P1
	8COA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4KVpoChnG6H6bkmBz+Gqua1C3Z7RWUYPls8XXOKGIBo=;
	b=ep4QGe9BltkiCMv2dV1zph4VXkR+ACUScQ+xdtGlcrnnCBRXww9p/wd3f7wUc+j/29
	ilCFDYiCoVKpNrlZPRZKn9COOx7rNVbZhJN697dtjboRDh/na7wjJlhmOTErX7nzcdZD
	pVJtGScuzrBaGA5tbNnEdO7upf1Xa+v+6/ZB87rFJUx/Z+5XgK1PuH0+mIDSFl3cU+6n
	mVs7UuE0Pz5w5ktrIov9VJtkYtFOh4yxjnEUAd2S3Aemif+GAeoCeLcT4zBfv3cEkjRt
	SbEPOD48I/G7ItdB2lNUMoKxEye36Zqo4q9Lrs4bbPMXLoCOW6SpLrNhHuPIjNA1aS+x
	TYpQ==
X-Gm-Message-State: AOUpUlHl11l1WX22g6MUHb1NeNrNft3JCAzY1WNOY26BAD/w8IYjJI3e
	uB0/5D3pIMIvMVzeZv3CZXg3N++e
X-Google-Smtp-Source: AA+uWPygXP8Amtbi5N4XPjZALUN430kgHueSj8vcAYlwCKI2MLLeUtP3E2LRrOpYltPamOJR/g3yuA==
X-Received: by 2002:a6b:1c07:: with SMTP id
	c7-v6mr13870169ioc.298.1534125340765; 
	Sun, 12 Aug 2018 18:55:40 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	m47-v6sm4402065iti.1.2018.08.12.18.55.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Aug 2018 18:55:39 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Sun, 12 Aug 2018 18:55:26 -0700
Message-Id: <1534125326-21302-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: cardoe@gentoo.org
Subject: [PATCH] Xen: improve build reproducibility
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
X-List-Received-Date: Mon, 13 Aug 2018 01:55:42 -0000

Enable reproducible builds of the hypervisor binaries by defining
build variables and setting compiler flags to support this.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 4894c77..38cecd1 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -870,6 +870,24 @@ EXTRA_OEMAKE += "ETHERBOOT_ROMS=${STAGING_DIR_HOST}/usr/share/firmware/rtl8139.r
 EXTRA_OEMAKE += "WGET=/bin/false"
 EXTRA_OEMAKE += "GIT=/bin/false"
 
+# Improve build reproducibility: provide values for build variables.
+def get_build_time_vars(d):
+    source_date_epoch = d.getVar('SOURCE_DATE_EPOCH')
+    if source_date_epoch is not None:
+        import datetime
+        utc_datetime = datetime.datetime.utcfromtimestamp(float(source_date_epoch))
+        return " XEN_BUILD_DATE=" + utc_datetime.strftime("%Y-%m-%d") + \
+               " XEN_BUILD_TIME=" + utc_datetime.strftime("%H:%M:%S")
+    return ""
+EXTRA_OEMAKE += "${@['', 'XEN_WHOAMI=${PF} XEN_DOMAIN=${DISTRO} XEN_BUILD_HOST=${PN}-buildhost'] \
+                    [d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1']}${@get_build_time_vars(d)}"
+
+# Improve build reproducibility: compiler flags to remove filesystem differences.
+# Suppress __FILE__ via an alternative builtin.
+CC += "${@['', '-gno-record-gcc-switches -Wno-builtin-macro-redefined -D__FILE__=__VERSION__ ' + \
+               '-fdebug-prefix-map=${WORKDIR}=${PN}'] \
+          [d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1']}"
+
 # check for XSM in package config to allow XSM_ENABLE to be set
 python () {
     pkgconfig = d.getVar('PACKAGECONFIG')
@@ -889,6 +907,15 @@ do_post_patch() {
 
     # libsystemd-daemon -> libsystemd for newer systemd versions
     sed -i 's#libsystemd-daemon#libsystemd#' ${S}/tools/configure
+
+    # Improve build reproducibility: disable insertion of the build timestamp
+    # into the x86 EFI hypervisor binary.
+    # binutils should allow a user-supplied timestamp or use SOURCE_DATE_EPOCH
+    # for PE but currently does not.
+    if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ] ; then
+        sed '/^EFI_LDFLAGS = /{a EFI_LDFLAGS += --no-insert-timestamp
+}' -i "${S}/xen/arch/x86/Makefile"
+    fi
 }
 
 addtask post_patch after do_patch before do_configure
-- 
2.7.4


