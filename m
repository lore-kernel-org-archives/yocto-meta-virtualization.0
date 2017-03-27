Return-Path: <jonatan.palsson@pelagicore.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F007E00B01; Sun, 26 Mar 2017 23:43:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.51 listed in list.dnswl.org]
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17751E00A9A
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 Mar 2017 23:43:44 -0700 (PDT)
Received: by mail-lf0-f51.google.com with SMTP id j90so15140886lfk.2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 Mar 2017 23:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7bdX8ljruROoawm2nacxsFyjN4vGynn/9BlHoF/YYNg=;
	b=Q8L/xNcpDG130FVKYSWjQ20u4+3DMZYGY5KDj6F5F9MxwXWVFkVl0lVXpfIPPJzcn6
	q4Vyj0X0VNAqnEDbE0FnuoH1xeEpaoELKPWCtMxDWjMeuA3GDTnMK7/jsQxh+inF7Gzk
	TrANtNgb/HhX/I8Mw0CfbXReDcm/5IgP+StrDOQbmM0IHPaPNvkwa5BmBACucqec63Uu
	XAkuvu4pN4pO7DZGb4LMvY6UejJHO6hRxZHwLfeF2GqYCLCPF8pZAgJUa14rzIQ0fh0d
	qyeLtOTwDXtiszuDhLx2O1icbZQPo5L2A7vTCfwI0zhIBPpZjulMVmWXQbjO1TG1Ic5T
	vaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7bdX8ljruROoawm2nacxsFyjN4vGynn/9BlHoF/YYNg=;
	b=SBzj8UhUzmMLmtMApEnQVBgBvCz6BotEAmPsfGFFy68p0fZN9xwv3xz0cEgrjg5ofg
	+dA0lOBtB1l3qBLFaFTAAzhfUDShUigOhAyR3XwkS3nYhLuUzwOFaf2Oaq3TeNEYKpP8
	tCxPyKyZUjmZGRdxtPAbeMIr6x9ICRZsdefC2CZuUJL2jAecVPmuS38hgVFNhsW7JXn1
	EiJ5NZFLxJhrqaNYv6WGyfVLHtKAIUDYsW6DSc/U2RdgAxKLjfm6w9UQQuSlKcUI5Zqg
	5fkmeIv8R/YPx4Fd1S1I14/QQmFh+oVdGgIHwlJbbOGxCJnV2ljlDBR3EazvUJetEQMW
	FLOw==
X-Gm-Message-State: AFeK/H00KnMFxEKNEa07NvBvxLu2Tu82yDbClGDmoxieCqDj2AsWD8bxyP6GQHhmE0mcmriK
X-Received: by 10.25.79.15 with SMTP id d15mr8819146lfb.14.1490597023822;
	Sun, 26 Mar 2017 23:43:43 -0700 (PDT)
Received: from wheezy6.office.pelagicore.net ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	h23sm1777436lji.21.2017.03.26.23.43.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 26 Mar 2017 23:43:42 -0700 (PDT)
From: =?UTF-8?q?Jonatan=20P=C3=A5lsson?= <jonatan.palsson@pelagicore.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 27 Mar 2017 08:43:30 +0200
Message-Id: <20170327064330.20815-1-jonatan.palsson@pelagicore.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] lxc: Add lua to PACKAGECONFIG
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
X-List-Received-Date: Mon, 27 Mar 2017 06:43:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Lua support is automatically enabled when configuring LXC if lua is
available in the sysroot. The packaging step will fail since the lua
related files are not in FILES.

This patch explicitly enables/disables lua support using PACKAGECONFIG,
and also adds lua-related files to FILES.

Signed-off-by: Jonatan Pålsson <jonatan.palsson@pelagicore.com>
---
 recipes-containers/lxc/lxc_2.0.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-containers/lxc/lxc_2.0.0.bb b/recipes-containers/lxc/lxc_2.0.0.bb
index 250ac4d..c98d1a7 100644
--- a/recipes-containers/lxc/lxc_2.0.0.bb
+++ b/recipes-containers/lxc/lxc_2.0.0.bb
@@ -65,6 +65,7 @@ PACKAGECONFIG[templates] = ",,, ${PN}-templates"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
 PACKAGECONFIG[seccomp] ="--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
 PACKAGECONFIG[python] = "--enable-python,--disable-python,python3,python3-core"
+PACKAGECONFIG[lua] = "--enable-lua,--disable-lua,lua,lua"
 
 # required by python3 to run setup.py
 export BUILD_SYS
@@ -86,6 +87,9 @@ FILES_${PN}-doc = "${mandir} ${infodir}"
 # For LXC the docdir only contains example configuration files and should be included in the lxc package
 FILES_${PN} += "${docdir}"
 FILES_${PN} += "${libdir}/python3*"
+FILES_${PN} += "${datadir}/lua/*"
+FILES_${PN} += "${libdir}/lua/lxc/*"
+FILES_${PN}-dbg += "${libdir}/lua/lxc/.debug"
 FILES_${PN}-dbg += "${libexecdir}/lxc/.debug ${libexecdir}/lxc/hooks/.debug"
 PACKAGES =+ "${PN}-templates ${PN}-setup ${PN}-networking"
 FILES_${PN}-templates += "${datadir}/lxc/templates"
-- 
2.10.2


