Return-Path: <yan.yankovskyi@globallogic.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5DE49E00C78; Thu, 23 Nov 2017 06:24:33 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.128.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9F0EE00A62
	for <meta-virtualization@yoctoproject.org>;
	Thu, 23 Nov 2017 06:24:31 -0800 (PST)
Received: by mail-wr0-f195.google.com with SMTP id a63so17738047wrc.12
	for <meta-virtualization@yoctoproject.org>;
	Thu, 23 Nov 2017 06:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=gk5tJ6rrXx+99DPrv+lpUTWNrqwj6eQyEJ0OlwkEra4=;
	b=Pw7/HGJMDX7Eg/hQX4GqL2xBAc5DbI9Q9QJzTY1u/zn7IjCZZRfGjiHxHUjNkEDqqq
	Xj31f9YfWV/HGWMHWD50X+VYdM8bmKSjIMDtvO52VAnPY0+rkhy+7XIWEa8/9uDPwMRl
	txZzTKTzNfyG6ruBWAEVQex1XKKhPhDEJGbNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gk5tJ6rrXx+99DPrv+lpUTWNrqwj6eQyEJ0OlwkEra4=;
	b=mhQ8W6zKDZXbwG7AjrBFCCDH15pcFhX7QvRi9HwMjQHYiWWibKJVL7BUrB5sP8p1a1
	iLKO1aLyatY5ZIGiKEnan+B8iV1S4k/hFz7vfatGumwhApuDRmdyDc3Qzyfr2c58Hyxs
	sSmVkJQNra42gScfD959hXk0LRM7YfBFh2yGAliu9/tUoRRH//LYfVbkhgtHk2IY6DD1
	tm5IkZ8+w0RK3wfu9KhQmsjSA3TKuBenO6hGAdwQcMPS9hHRjpkQj2BxVJ1rJn/YRoDP
	1ovpMU04JQpdfNpOAyfMQx3nUxyWbtLrhuqL7wL/qMR3MS0Z7Gf9DNw4GR+mIyfQfimy
	DtVA==
X-Gm-Message-State: AJaThX7zc76wPZRaOenoDaLDGjmNxIlYVoXaH8OnM27ceUGgjYC1wB1h
	51PlbZEBxff6WpzIZEVCA9qG7v9/
X-Google-Smtp-Source: AGs4zMY1oWJlVSePAgpvJ8nW3lBGDQQhdEH70Le2Z6yfFq0kC4r/lRDIXLpitn9SfsRvIbYUmbViWw==
X-Received: by 10.223.138.182 with SMTP id y51mr13162411wry.273.1511447070299; 
	Thu, 23 Nov 2017 06:24:30 -0800 (PST)
Received: from administrator-HP-Z230-Tower-Workstation.europe.delphiauto.net
	([195.238.92.249])
	by smtp.gmail.com with ESMTPSA id y99sm4181755wmh.0.2017.11.23.06.24.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Nov 2017 06:24:29 -0800 (PST)
From: Yan Yankovskyi <yan.yankovskyi@globallogic.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 23 Nov 2017 16:24:04 +0200
Message-Id: <1511447044-22828-1-git-send-email-yan.yankovskyi@globallogic.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] xen: delete references to xenstored.socket and xenstored_ro.socket in xen.inc
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
X-List-Received-Date: Thu, 23 Nov 2017 14:24:33 -0000

These files were removed since the followine patch
http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=976ce01e103fc03bb3336cdbc6c951a709e285fe
and are absent in xen 4.8.0 and further, which leads to
the following error during the Xen build process:
do_package: SYSTEMD_SERVICE_xen-xencommons value xenstored.socket does not exist

Signed-off-by: Yan Yankovskyi <yan.yankovskyi@globallogic.com>
---
 recipes-extended/xen/xen.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index cb314f8..4d56de9 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -739,8 +739,6 @@ FILES_${PN}-xencommons += "\
     ${systemd_unitdir}/system/xenconsoled.service \
     ${systemd_unitdir}/system/xen-init-dom0.service \
     ${systemd_unitdir}/system/xenstored.service \
-    ${systemd_unitdir}/system/xenstored.socket \
-    ${systemd_unitdir}/system/xenstored_ro.socket \
     ${systemd_unitdir}/system/var-lib-xenstored.mount \
     "
 
@@ -780,8 +778,6 @@ SYSTEMD_SERVICE_${PN}-xencommons = " \
     xenconsoled.service \
     xen-init-dom0.service \
     xenstored.service \
-    xenstored.socket \
-    xenstored_ro.socket \
     "
 SYSTEMD_SERVICE_${PN}-xendomains = "xendomains.service"
 
-- 
1.9.1


