Return-Path: <iurii.mykhalskyi@globallogic.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 59943E009AA; Fri, 28 Apr 2017 08:43:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.50 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AAC2CE00992
	for <meta-virtualization@yoctoproject.org>;
	Fri, 28 Apr 2017 08:43:35 -0700 (PDT)
Received: by mail-wm0-f50.google.com with SMTP id m123so50564327wma.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 28 Apr 2017 08:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=z0zDjJ/WtH2fGJhKkV8TlIoT0yAyQRoO/RlxKAXUJfY=;
	b=gN5cbUwb/pHsUb9glTyETxeeXHogYy+3QlRPik8Ds6F0EUApRbyapzVju8QX5GmlBR
	f6qRLAbMr6Ip2riKIImgYz+tGxs8cwxSGFkF0LyPTi4Tol9LAbywhy58FfKFil8bx05/
	Xir1jTfSSuye3RcmEik2aW195Rt34Wm/sub84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=z0zDjJ/WtH2fGJhKkV8TlIoT0yAyQRoO/RlxKAXUJfY=;
	b=TyGqbsT4FgzKO8wVvFf0apA+TipymD/Ks/Ye60euYyoheaLF/abe1cNlcPgsiYEFkB
	RWANGjoaNQtnIwnjNQU0sPim2oHBUwn6aooB+8W2HqCfrErRr8epTQdE2+ickF6E7WuI
	5e3Par+zetQjYzT7ga/ZeSHjA+HUv/4FuBK+2e6TW0/ruTj6dS1v3/mASeLj3OadTsn+
	ukymHUhpn6tP0k1ZK6/oX0y+GcwcNmhn48cm+UbLv4ln2Y2BjobY2OVNTTAZ+0byFIAv
	Jy7IGBWJLL4wpAHASy3FE2+1raIyJUj5KzPMAqP0NxsdGINf+C1kfv40nsoCJ2VLuLKO
	NcJg==
X-Gm-Message-State: AN3rC/4C14aMx8WjlUp4xcAugp+bH5aEDrlHZ1oC5nmqLldlagFHkWs5
	R+oYtRfBq9SJLda7
X-Received: by 10.28.133.70 with SMTP id h67mr5922718wmd.136.1493394214442;
	Fri, 28 Apr 2017 08:43:34 -0700 (PDT)
Received: from kbp1-lhp-f55441.synapse.com ([2001:67c:2e5c:2011::1ca1])
	by smtp.gmail.com with ESMTPSA id
	w96sm5706905wrc.14.2017.04.28.08.43.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Apr 2017 08:43:33 -0700 (PDT)
From: Iurii Mykhalskyi <iurii.mykhalskyi@globallogic.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 28 Apr 2017 18:43:19 +0300
Message-Id: <1493394199-23296-1-git-send-email-iurii.mykhalskyi@globallogic.com>
X-Mailer: git-send-email 2.7.4
Cc: bruce.ashfield@windriver.com, mark.asselstine@windriver.com
Subject: [PATCH] xen: Fix mistype error in xen-watchdog systemd service
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
X-List-Received-Date: Fri, 28 Apr 2017 15:43:37 -0000

Due to error in naming this service will not be autoenabled in
systems with systemd init manager

Signed-off-by: Iurii Mykhalskyi <iurii.mykhalskyi@globallogic.com>
---
 recipes-extended/xen/xen.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 0084274..a28d474 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -720,7 +720,7 @@ INITSCRIPT_PARAMS_${PN}-devd = "defaults 82"
 
 # systemd packages
 SYSTEMD_PACKAGES = "${PN}-xen-watchdog ${PN}-xencommons ${PN}-xendomains"
-SYSTEMD_SERVICE_${PN}-watchdog = "xen-watchdog.service"
+SYSTEMD_SERVICE_${PN}-xen-watchdog = "xen-watchdog.service"
 SYSTEMD_SERVICE_${PN}-xencommons = " \
     proc-xen.mount \
     var-lib-xenstored.mount \
-- 
2.7.4


