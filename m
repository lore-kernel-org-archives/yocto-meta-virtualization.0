Return-Path: <erik.boto@pelagicore.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 065BAE009A1; Tue,  9 Jun 2015 06:33:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.212.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D025E00974
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Jun 2015 06:33:53 -0700 (PDT)
Received: by wibdq8 with SMTP id dq8so17068191wib.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 09 Jun 2015 06:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=lPap44PvZZEg2gTjsZa9znsDETZ1Vada1AjX1mKfeyQ=;
	b=Y2tbrXKZDaTcG7XExjaigC+Py9FfEH2Tr8PiFnZx/4tuE2CRpfIYNV//xpGqMNAAk4
	BEK0KSLS+8SuP1N3jWhbT6ZuGV+EhipYtoeum97sMIWuf7t+FbENW+WSY27qK/CQnj+1
	rpZdEzE4WdIdVJsnqKCTE5CsL3HloBe473Tg7Tx8CL9lTcnxD0hRMZOAFgo4Q/pj2TV1
	uELPIXlWfNfYkxrf768afS5WPz/1SdLJ/wDPu4ukwA8zEurUDY853C+ecKAY5ulwVE6Z
	MKEPPoJHt+IR0SNbEjmroaBszu9iktWZ+BPbSRQw+KHozZIFc2b9KYJ18y7UY5V3OZIr
	bpTQ==
X-Gm-Message-State: ALoCoQm9pe3uBEmdx+kUOqlaoy4aVdmXtY0HVxkF0sHthaUc+GUFQorImK+E99IEQnJZObJQSb26
X-Received: by 10.180.9.7 with SMTP id v7mr32398094wia.60.1433856832938;
	Tue, 09 Jun 2015 06:33:52 -0700 (PDT)
Received: from build1.office.pelagicore.net ([83.218.80.242])
	by mx.google.com with ESMTPSA id js3sm9459136wjc.5.2015.06.09.06.33.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Jun 2015 06:33:52 -0700 (PDT)
From: =?UTF-8?q?Erik=20Bot=C3=B6?= <erik.boto@pelagicore.com>
To: meta-virtualization@yoctoproject.org
Date: Tue,  9 Jun 2015 15:33:47 +0200
Message-Id: <1433856827-25796-1-git-send-email-erik.boto@pelagicore.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] lxc: allow multiple init systems in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 09 Jun 2015 13:33:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add handling for distros with both systemd and sysvinit by passing
multiple init systems to configure with --with-init-script=

Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
---
 recipes-containers/lxc/lxc_1.0.7.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_1.0.7.bb b/recipes-containers/lxc/lxc_1.0.7.bb
index f79ba76..faa31b7 100644
--- a/recipes-containers/lxc/lxc_1.0.7.bb
+++ b/recipes-containers/lxc/lxc_1.0.7.bb
@@ -46,7 +46,9 @@ S = "${WORKDIR}/${BPN}-${PV}"
 PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-tests', '', d)}"
 EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
 
-EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '--with-init-script=sysvinit', '--with-init-script=systemd', d)}"
+EXTRA_OECONF += "--with-init-script=\
+${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit,', '', d)}\
+${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 PACKAGECONFIG ??= "templates \
     ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
-- 
1.9.1


