Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B79C2D0CD
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:59:58 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.37856.1670831988598671637
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 23:59:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aFN9yTjJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id bj12so25753907ejb.13
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkTRfSMUdDPPr1TBkQ8TSr9xOv4ad66+M3H83ndc2tM=;
        b=aFN9yTjJONKxna58r3Ui5wZgDgQLrbsXy5ePim/yxA/gdBX243RPWO/hhczpfU8iDf
         zR6l6/47Il5l1W43dSkT0WkUeOP5JW6OFgm649WIENspHwRTgM9nf0CtGSiUgrN4H9kF
         kpZNuF6K/sovCtiK2Hn6KwR8HRwLD4Q24X3m34zN5XQeYuDYz5oJn/dabzDpxgsDCvbT
         7iB80kk3JD6umRt15tNUbgAUodO7NixYtX6AP5+kDC64Neww6aUilxLZ/iM97dcsO16i
         26PFKHM6uqDadCf92cBFBjxZQVbCVTfFCGebMS89Ca9HncwcvLRij+40s3lmOl096f2s
         Q4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkTRfSMUdDPPr1TBkQ8TSr9xOv4ad66+M3H83ndc2tM=;
        b=KHdPbGVlSb8TpsUw+eLSBXnfaNwFcxxrG9mSvx91VjessyEPqkpiQJ55l+0W2uc4qs
         isS2e0P9wZlaDvXsnjH0dL94a40T+rRr1/yIb3vFGt1jeXtAsbLPh16UOp8zVoEYuINg
         jwenYCSci0A8iPNv6Y+WcB7oEoEJuo+HUmX8Jo7L4+5b7tOMG2EAGQ6z1SJiCMnhEciF
         KUs8SzpgPlkwH2SZtQJ6+Hwr0n2I6xMVtfZhalqG1//VI3CvJZsWqHhlPIGZwz6HdEO8
         Qf5IAfEf3w2zmYFR/5+t+/k6XM4f2d/PdbRvcgV9n0zuXdpfUFJThbATyVQisR4JBctb
         zVxQ==
X-Gm-Message-State: ANoB5pnMl1jW8TXAyb09ZaAeFTZRuzSzIp0tELI1s883waKxZY3H2NC/
	7DMlVi7mzcDA0IxSVliJNeWuXPYs8Aw=
X-Google-Smtp-Source: AA0mqf4Q02KrBGGewVHVCFLBrnuONUjJUw10rRqpt8OU3WMix2QMLVTSSn73eGDGwNuvjmThF2FoMw==
X-Received: by 2002:a17:906:838f:b0:7c1:7372:83ed with SMTP id p15-20020a170906838f00b007c1737283edmr1646396ejx.47.1670831991053;
        Sun, 11 Dec 2022 23:59:51 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm2952278ejc.48.2022.12.11.23.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:59:50 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][kirkstone][PATCHv2 09/21] docker: ensure that sysvinit and systemd are exclusive
Date: Mon, 12 Dec 2022 08:58:45 +0100
Message-Id: <20221212075857.1065221-10-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
References: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 07:59:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7761

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The sysvinit functionality conflicts with the docker daemon
settings required for the systemd docker.socket.

Ensure that the sysvinit capabilities are only enabled if
systemd is not present.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/docker/README     | 7 +++++++
 recipes-containers/docker/docker.inc | 9 +++++----
 2 files changed, 12 insertions(+), 4 deletions(-)
 create mode 100644 recipes-containers/docker/README

diff --git a/recipes-containers/docker/README b/recipes-containers/docker/README
new file mode 100644
index 0000000..565e350
--- /dev/null
+++ b/recipes-containers/docker/README
@@ -0,0 +1,7 @@
+if containerd is starting docker, and it is interfering with standalone
+docker operation, you may need to kill the running daemon and restart
+it:
+
+  % ps axf | grep docker | grep -v grep | awk '{print "kill -9 " $1}' | sh
+  % systemctl stop docker
+  % systemctl start docker
diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index 40a3642..b0bee4f 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -120,8 +120,7 @@ do_install() {
 		# replaces one copied from above with one that uses the local registry for a mirror
 		install -m 644 ${S}/src/import/contrib/init/systemd/docker.service ${D}/${systemd_unitdir}/system
 		rm -f ${D}/${systemd_unitdir}/system/docker.service.rpm
-	fi
-	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+	else
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.d/docker.init
 	fi
@@ -142,8 +141,10 @@ SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',
 SYSTEMD_SERVICE:${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','docker.socket','',d)}"
 SYSTEMD_AUTO_ENABLE:${PN} = "enable"
 
-INITSCRIPT_PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','${PN}','',d)}"
-INITSCRIPT_NAME:${PN} = "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','docker.init','',d)}"
+# inverted logic warning. We ony want the sysvinit init to be installed if systemd
+# is NOT in the distro features
+INITSCRIPT_PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES','systemd','', '${PN}',d)}"
+INITSCRIPT_NAME:${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','', 'docker.init',d)}"
 INITSCRIPT_PARAMS:${PN} = "defaults"
 
 inherit useradd
-- 
2.38.1


