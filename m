Return-Path: <erik.boto@pelagicore.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 04CC1E009CA; Mon,  8 Jun 2015 22:14:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.212.174 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E665EE00960
	for <meta-virtualization@yoctoproject.org>;
	Mon,  8 Jun 2015 22:14:14 -0700 (PDT)
Received: by wigg3 with SMTP id g3so4717461wig.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 08 Jun 2015 22:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=KAAxcGzf+wHlO8u5BdExbV/4RYrtMvhiex3AhA0bn58=;
	b=Ho246VzzPDuXtUfixT7dgtCANORoeHWLe0KU55vN6OjaWXVCNuywNRgs5lLXVqLvDZ
	uUGff2f0k8Od2lYl0mPQAjIP3p1Oh1oMVhJFkQv0AyCrpKaVMiM4/uRQkZ2/4Y7YUYcq
	pvWOG0QBg9dKtXWhb6wTNLotzPJ7wIhiiGDor+fS8Xh7A3cbIlD7ezQLXDUIkkNUpHNv
	JFTxfA7go71lV+7OKDT/GUiu1dfCUgBg1xtjmDAuFOv+LjdsbUC5Px8wbCbrXNIdFGAj
	r4fEdWsaGzQ8NgNS6EsVnYEKv7ofrM36yy2ZYbTwlsglfr9VIC9HFRsHHEIZxifW7ox/
	cr2g==
X-Gm-Message-State: ALoCoQmnaoRYUvugd6J0ft1pueBfHGTS5F0v5ruD0PL2JW8Et3/UJA2s7NCLmB2i37eHxqciqsLL
X-Received: by 10.194.185.236 with SMTP id ff12mr34444753wjc.134.1433826852958;
	Mon, 08 Jun 2015 22:14:12 -0700 (PDT)
Received: from build1.office.pelagicore.net ([83.218.80.242])
	by mx.google.com with ESMTPSA id yz3sm7457139wjc.19.2015.06.08.22.14.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Jun 2015 22:14:12 -0700 (PDT)
From: =?UTF-8?q?Erik=20Bot=C3=B6?= <erik.boto@pelagicore.com>
To: meta-virtualization@yoctoproject.org
Date: Tue,  9 Jun 2015 07:14:06 +0200
Message-Id: <1433826846-6684-1-git-send-email-erik.boto@pelagicore.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] lxc: install lxc.service if DISTRO_FEATURES contains systemd
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
X-List-Received-Date: Tue, 09 Jun 2015 05:14:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
---
 recipes-containers/lxc/lxc_1.0.7.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-containers/lxc/lxc_1.0.7.bb b/recipes-containers/lxc/lxc_1.0.7.bb
index f79ba76..948dd0f 100644
--- a/recipes-containers/lxc/lxc_1.0.7.bb
+++ b/recipes-containers/lxc/lxc_1.0.7.bb
@@ -94,6 +94,11 @@ do_install_append() {
 	for i in `grep -l "#! */bin/bash" ${D}${datadir}/lxc/hooks/*`; do \
 	    sed -e 's|#! */bin/bash|#!/bin/sh|' -i $i; done
 
+	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+	    install -d ${D}${systemd_unitdir}/system/
+	    cp ${S}/config/init/systemd/lxc.service ${D}${systemd_unitdir}/system/
+	fi
+
 	if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
 	    install -d ${D}${sysconfdir}/init.d
 	    cp ${S}/config/init/sysvinit/lxc ${D}${sysconfdir}/init.d
-- 
1.9.1


