Return-Path: <dariusz.pelowski@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C1D6E00D14; Tue, 17 Oct 2017 09:13:34 -0700 (PDT)
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
	*      [209.85.215.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.67 listed in dnsbl.sorbs.net]
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 16B7AE00B83
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 09:13:32 -0700 (PDT)
Received: by mail-lf0-f67.google.com with SMTP id l23so2624283lfk.10
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 09:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=iuyvtAIKmaXyi4+Fd/8d7WlbwsO0DuENDr/EVi48dHQ=;
	b=cvIipNAY8oZXxb9TOkx0gkmj7v0ZjvPTH3wSwyrHRbF0SYkJ9ISyT89Loq91qkdwEa
	m2gpiOeWXExiiybVRfjMzBWAB4NuXpamNQ+6z/aRcEAqdzE0akMXsUHP32j4bsTSDAfi
	/3/VAX95GtD5PENMfbRuLHwdk1wa7YA/gLehArqJG3JpNM/5sCytZThy/EMh24A8OEN1
	5PdfrRazrdAbsrU1ZGPysS6+PlOOgrUCPk6A03GsodGEggZsNg8Wso7xYdG66McDlpNs
	P+hxYW8mze31Xw6+F0ibuk4qPo1MyA9qlUrhIFK04FFLYMdBJILKQJpba2yLfLbNbv+S
	8FWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iuyvtAIKmaXyi4+Fd/8d7WlbwsO0DuENDr/EVi48dHQ=;
	b=bzOU0XQyK7ILTsjWI1Z/P9oya5mnQSME4c+fODI9gqfwYDXlkLx5B4PEeIGEfEdt+q
	COoX6PTw5DsVAbbvmaTMpCTWGbHvC9r1jPm0pzGMezYiNdwa3ohMUjZj6Yd/eKXu+beR
	843QfGZgFJUV6kZ8k4JeTIW9GmDua/j00DuQZv5KtQahIJErVqjX9J+ry8B/EJGUIXlc
	L1SKN60DRPuwq9aI/6OVeHa/wEvPJsSungHBaoKiovVgkcAHGKMvTOti3B4NVynugpVw
	0zPCC0ne+KSQfDQAM3iCdA/BXSRHdF2n9LKLkMVvxWzCazKBGuUFkC84LcbVh0sA/Hop
	lo4A==
X-Gm-Message-State: AMCzsaWp8ZVOdPn0inFp5kztCvwENH2ePPw5BSBIwiI+ziqjXUDEYSi5
	z0FjcPLZBKS6axsvn3E45Iyvxp5d
X-Google-Smtp-Source: ABhQp+TLfGkx6B2oTlbkenThzhEG+YFzSkIcNaTKCSAnhHkYKGQRfBat2rNe4eo1KVrAecvggR4hog==
X-Received: by 10.25.56.26 with SMTP id f26mr4784420lfa.17.1508256811502;
	Tue, 17 Oct 2017 09:13:31 -0700 (PDT)
Received: from localhost.localdomain (user-188-33-218-82.play-internet.pl.
	[188.33.218.82]) by smtp.gmail.com with ESMTPSA id
	j75sm2557694lje.63.2017.10.17.09.13.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Oct 2017 09:13:30 -0700 (PDT)
From: Dariusz Pelowski <dariusz.pelowski@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 17 Oct 2017 18:13:24 +0200
Message-Id: <1508256804-4341-1-git-send-email-dariusz.pelowski@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] vgabios: don't override the compiler ldflags
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
X-List-Received-Date: Tue, 17 Oct 2017 16:13:34 -0000

---
 recipes-extended/vgabios/biossums_0.7a.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/vgabios/biossums_0.7a.bb b/recipes-extended/vgabios/biossums_0.7a.bb
index 10bd014..e66bade 100644
--- a/recipes-extended/vgabios/biossums_0.7a.bb
+++ b/recipes-extended/vgabios/biossums_0.7a.bb
@@ -20,6 +20,7 @@ do_configure() {
     # Don't override the compiler or its flags:
     sed 's,^CC,DISABLED_CC,' -i Makefile
     sed 's,^CFLAGS,DISABLED_CFLAGS,' -i Makefile
+    sed 's,^LDFLAGS,DISABLED_LDFLAGS,' -i Makefile
     # Supply the C flags to the compiler:
     sed 's,-o biossums,$(CFLAGS) -o biossums,' -i Makefile
 }
-- 
2.7.4


