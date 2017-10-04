Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C57D3E00D5E; Wed,  4 Oct 2017 03:41:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.41 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.41 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 29979E00D54
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Oct 2017 03:41:20 -0700 (PDT)
Received: by mail-wm0-f41.google.com with SMTP id 196so8972111wma.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 04 Oct 2017 03:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=w7FY6zeYfRr1dkud9vAwNWpmT6mcFmxpepySh7Allkg=;
	b=wcko2PuFPw4NrUnisAiWB1qIhbHCcjd7SWMfrY00KKMOZMCgWBjBsjD/mokoUosPNI
	qVxl03eWOzpfab2Z2IinIcRCQJlYKCKPaOGemvXLmJ6V7aXJVrQaJo5I1lWWXKVtjUF2
	a2wIU0JHUSvGHkPy/gckmcO/H6pY9Qo9KkAvbfsZFBQBt7+xS7mzcSlzkWD/uFaDlm8j
	FgyRZwmEwBLgvErxthS1aB158o6KHVmMKVQeLmo9RercpjAdM/jT1NG+BW6s/gG9gm5z
	soX5LhHVdmUY5wuq9Muviczl6quaCkynRvH6RDYYEGCnUNrvBYQMTW1ju9jFDQK2BUvB
	YC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=w7FY6zeYfRr1dkud9vAwNWpmT6mcFmxpepySh7Allkg=;
	b=Q5pZm5ufN11vTsdONdrZ3b7Y1A7OLseJrpMBDcAMt0udOssFBTPbANByFBBlpjrbto
	KelNEWUe+4KNwR15vsCNiXDCQgH2rJ49mtXFaIjancHiXuCN31vsTblkpzF2fRRvdTuF
	Uy5WAHnJwIGYPLyvJk/EmFIdZakM5wzIjza8jr1jcw6e7i96QRnZvazmcEzOTYrICC67
	Cnc9ZAgZkn6e9GbyduO7+7raCNr1vcuHuaNe4hd5kW/vSWg/0Lu8ZEka+s1kdyyZnUTt
	pffNMGfuvZ1y07wupTZZJyRGw1zte3EPgut6sW4xM4ZBt9zuTVXOsRvbGCNZ3/9e/5j2
	jRgg==
X-Gm-Message-State: AMCzsaVNY1VirBZ/42m4PcoRInirJrtZxzuJiT1fLA8zlXNLJAhmsA6r
	BEo40sFgNqSuYLZtCKB5E/lIGF2m6BJW/g==
X-Google-Smtp-Source: AOwi7QD4/eReeuJR3a4On7FzgAr6kAvv0KDmcQ67G5/yrt6EY5sDbt3M0UuMxqlvvgvbq/15MhOKTQ==
X-Received: by 10.28.181.2 with SMTP id e2mr938132wmf.81.1507113679982;
	Wed, 04 Oct 2017 03:41:19 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id v2sm7115456wmf.8.2017.10.04.03.41.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Oct 2017 03:41:19 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Wed,  4 Oct 2017 10:40:26 +0000
Message-Id: <1507113626-3022-3-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507113626-3022-1-git-send-email-pbarker@toganlabs.com>
References: <1507113626-3022-1-git-send-email-pbarker@toganlabs.com>
Subject: [PATCH 2/2] runc-opencontainers: go.bbclass compile fixes
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
X-List-Received-Date: Wed, 04 Oct 2017 10:41:21 -0000

These fixes are needed due to updates to go.bbclass in oe-core. See commit
01a8d4537012ad93dc8510e9b762acdc8c4536c7 for more information.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 recipes-containers/runc/runc-opencontainers_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 940ae95..902a93d 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -6,9 +6,11 @@ RUNC_VERSION = "1.0.0-rc4"
 PROVIDES += "virtual/runc"
 RPROVIDES_${PN} = "virtual/runc"
 
+GO_IMPORT = "import"
+
 do_compile_prepend() {
 	# Go looks in a src directory under any directory in GOPATH but
 	# runc-opencontainers uses 'vendor' instead of 'vendor/src'. We can fix
 	# this with a symlink.
-	ln -sfn . "${S}/vendor/src"
+	ln -sfn . "${S}/src/import/vendor/src"
 }
-- 
2.7.4


