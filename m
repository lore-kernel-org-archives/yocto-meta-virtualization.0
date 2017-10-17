Return-Path: <dariusz.pelowski@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85662E00D14; Tue, 17 Oct 2017 09:13:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (dariusz.pelowski[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.68 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.68 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E12E5E00B83
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 09:13:58 -0700 (PDT)
Received: by mail-lf0-f68.google.com with SMTP id a69so2637059lfe.5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 09:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0LRQoqA5jUKDTNlO5lt7q7e+cNcFa3stZoHry4B7N60=;
	b=n8pebdMguWdelDCfS68CzR60xDkjnAlABwHrIdvZ1ve6l9zEX7CzwFgD+n0WgxnaE3
	Np8B87IQBghI3Gdqt/Cydry+oe5Pug8qLSTauazzHpG6U6+qEv6rA2rcsBN67bgnrT+J
	eReBSM94WcicKN9az323C3dTl3pcPd7QvNY5oznf88MDERDzOuPClEI3vAXeDmXX5/BF
	BTG6o/t7snAJY6VIsWfYA41tMcYjqyT6t8+JRwUM0Hpbw/2fFTEEG7C9ZH1uU+gnrz1r
	9EFyQOcW9K2FaMO0RGflHjolx0SSpd2wjTRfNZK53d8moLDpjpadJeZS7ShByOpBPc/z
	s7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0LRQoqA5jUKDTNlO5lt7q7e+cNcFa3stZoHry4B7N60=;
	b=UmxPwWVd8S5/kFrHO36GoOVPs49fZ7eY8bSnyBLvppqgwBdLK2YJT7xVmO/cBGxiNq
	68F85rqLfC4ESH9pPe7JwJcd/PIIWhcFZBTDPc+0dkdsGLydUAej+DR6XPRigBVkZKSS
	SnhS29GDvSlhSIkMlAUPj90/4Vj4Q//QsypId9re6Ut6aCsQraucDXmoeMw4iPAUrwTD
	n1+EofsoB7KlWKrnr4G08SL3fO+tt7QsXqIpxOLuLhhbxiwGvAlNVxl/hudBEbenjTLS
	AKqCl2EWgOnL4py7riPRWck9I9GgUVLWhYdr4yLn2f83XqjHr6oxzTCu8GEPnC5v1JN3
	2uTg==
X-Gm-Message-State: AMCzsaU6j7oy8V4XPmu5cuqLN3e45NwqxCtg/7iFN3jug8pI6FeVVKtX
	FFXKkKv271QvKuhwCl67FE3EA67T
X-Google-Smtp-Source: ABhQp+SBUEncSedV833fbThHFQRO94qfsRr6UBBdnIZlj2XNNWO/WzAoTxhxP11dJU3CHGUrJlyQzA==
X-Received: by 10.25.229.135 with SMTP id i7mr4682090lfk.87.1508256837310;
	Tue, 17 Oct 2017 09:13:57 -0700 (PDT)
Received: from localhost.localdomain (user-188-33-218-82.play-internet.pl.
	[188.33.218.82]) by smtp.gmail.com with ESMTPSA id
	l194sm990103lfl.11.2017.10.17.09.13.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Oct 2017 09:13:56 -0700 (PDT)
From: Dariusz Pelowski <dariusz.pelowski@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 17 Oct 2017 18:13:48 +0200
Message-Id: <1508256828-4392-1-git-send-email-dariusz.pelowski@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] containers: corrected install path
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
X-List-Received-Date: Tue, 17 Oct 2017 16:13:59 -0000

---
 recipes-containers/kubernetes/kubernetes_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index f574a3e..2c7161e 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -76,7 +76,7 @@ do_install() {
     install -d ${D}${systemd_unitdir}/system/
     install -d ${D}${systemd_unitdir}/system/kubelet.service.d/
 
-    install -d ${sysconfdir}/kubernetes/manifests/
+    install -d ${D}${sysconfdir}/kubernetes/manifests/
 
     install -m 755 -D ${S}/src/import/_output/bin/kube* ${D}/${bindir}
 
-- 
2.7.4


