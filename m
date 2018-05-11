Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2398FE010B0; Fri, 11 May 2018 05:32:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E520E01088
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 May 2018 05:32:56 -0700 (PDT)
Received: by mail-qt0-f194.google.com with SMTP id q6-v6so6794493qtn.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 May 2018 05:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wkZtQL23tsxMTBPBB9dACWaKnqKQjdiKmyCBJpsuKVQ=;
	b=vAWy6YS4BeiuzSV4ksKKYwrmuSroCdPa8q1Yx8Gh2en4xFE+Lp9Mq5mw43dp52rXgr
	sYDKDjSFUJGtVex4750Ml9HBPJ44CmXqHYgZwrB2xchQgGYilvINnkARWUGkWNLi/E22
	VfrA2JHFUDXyZAlhqS5XxEQfh0mUcuDxlmcz0HbT5c73iXiqEZRKqAkyhMlL0dxWugaY
	TcVz4Hb5V97zNxWKZoisR6GNq0FHa1RwiK2iBKJWniy47JMgnAIZLMO4IkMz4CpTb1a7
	/UHP61f7tp0WtT4g047yUYBULYWA6v1+K4K4yM+Z65tvsKKTaAaZEeqcTCvGrcUdnbQG
	uE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wkZtQL23tsxMTBPBB9dACWaKnqKQjdiKmyCBJpsuKVQ=;
	b=POPUBXKknqe6XMrNuRUhX8hg0E28u8W4IUpTRccDGeAj3C66bcrRH2xN60TlELJ7HJ
	OfHJoFOAR7kUYEVTZJR0geGpgJvpwaQKF8TvWVp6zUigGtWhHofQ7Y1izUByf7Db+mq3
	WUaAy94mHEZsyffFwFBNUnX3XWFwTNFjKOyd6mMmTsiVD14wNDtgRTk2VAJKVyt3zeHz
	QeLUDk9K17CW5McJQxpZqHqBM/2/3qpN7UvZnFL3kQbtj5ZMt/KJbwGqGkLRQMyxYqGz
	ixcqtqAdND/gPLpTeuLelANzzl85QvV/N94vJP8VB+QNa3SIAXqMcjPl0gfWYt7BP7BP
	8WLw==
X-Gm-Message-State: ALKqPwenNsnIVucwqiyFbinPzMsvhLKLv/GqOUhH1PQT8quokJqEQOae
	I7q3QnfilQ9bFh2i5/H1sHNMu/nL
X-Google-Smtp-Source: AB8JxZrarmJK19fBpdrEZ2l7Tp4yUzzo+DFb9Ac9ELsnIJmNp1FTAnDNgoe9V4whfek53wIDx3f2aw==
X-Received: by 2002:aed:2d43:: with SMTP id
	h61-v6mr5074480qtd.31.1526041975996; 
	Fri, 11 May 2018 05:32:55 -0700 (PDT)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	t47-v6sm2546510qtc.1.2018.05.11.05.32.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 May 2018 05:32:55 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 11 May 2018 08:32:52 -0400
Message-Id: <1526041972-30695-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Chris Patterson <pattersonc@ainfosec.com>
Subject: [PATCH] xen: add xendriverdomain systemd unit to devd
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
X-List-Received-Date: Fri, 11 May 2018 12:32:58 -0000

From: Chris Patterson <pattersonc@ainfosec.com>

Matches sysvinit packaging.

Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
---
 recipes-extended/xen/xen.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 8dfe589..cadbd78 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -438,6 +438,7 @@ FILES_${PN}-cpuid = "\
 
 FILES_${PN}-devd = "\
     ${sysconfdir}/init.d/xendriverdomain \
+    ${systemd_unitdir}/system/xendriverdomain.service \
     "
 
 FILES_${PN}-flask = "\
@@ -778,7 +779,8 @@ INITSCRIPT_NAME_${PN}-devd = "xendriverdomain"
 INITSCRIPT_PARAMS_${PN}-devd = "defaults 82"
 
 # systemd packages
-SYSTEMD_PACKAGES = "${PN}-xen-watchdog ${PN}-xencommons ${PN}-xendomains"
+SYSTEMD_PACKAGES = "${PN}-xen-watchdog ${PN}-xencommons ${PN}-xendomains ${PN}-devd"
+SYSTEMD_SERVICE_${PN}-devd = "xendriverdomain.service"
 SYSTEMD_SERVICE_${PN}-xen-watchdog = "xen-watchdog.service"
 SYSTEMD_SERVICE_${PN}-xencommons = " \
     proc-xen.mount \
-- 
2.1.4


