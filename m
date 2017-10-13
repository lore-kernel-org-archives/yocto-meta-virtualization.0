Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EA593E00D26; Fri, 13 Oct 2017 12:27:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.128.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 13802E00D0E
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Oct 2017 12:27:34 -0700 (PDT)
Received: by mail-wr0-f182.google.com with SMTP id j14so1728784wre.8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Oct 2017 12:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ah2B0k59b5mmSlmNLQOM/HSRnsGRHHY2x9V8VTPsKv4=;
	b=JVu5SZknORzuwxT7+4vLts2XEvFqFDCYEar4efcnr2DJPSy3s5nS60zkjfHDQ5pQdW
	jjChQ43tb6l4dg7NVurw6lZQeLfLgU/TOIn+Bi+NAJ4j4EgUEkOaFHiBwry6UJkZ5DWe
	+oHci0xRkpm7eJ+o0+X+OE02VsBLhnCH8Ww5OObiiPzQoOJ6S0nE5p/fUoDdB/QSLbsV
	gwwamylLBBbwruV/DgKyjPfqvY0NdCgL+XnXxsr9mUlymRmKpzluUB0CKGdFXpxvCmZv
	tSFrYmusBMsayoHa3ZhfbprnbU1jsZ5XFOqMY1BeXOa2otxcHcr2l829sUG0Js4FEBq1
	6RdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ah2B0k59b5mmSlmNLQOM/HSRnsGRHHY2x9V8VTPsKv4=;
	b=h+XyfULW/hQBbwQmHYb7lXynN0cHkH6ffwc3XvEsX6IXu+qj4Uf5yjjc+JAlYbjYD/
	N6mirsiHhgvPq3usyPH+7Yn+KnppSmWvWCRKXvGTjIp2A2Ky0BMy2SJhXJfSSrr9dcKu
	+UAa/dRAFETzobFQOiN7eCHg2UUUrkxUHjM7xm5ck1q7Sy8eLBYG15tVAyXZ7D10PTt1
	LCOKc8Xfu1OcZ9K4oRbYNOhH1oOumKZJtorG/R0BPYQYGQKHoHWnWTtbgmRhIQheMapP
	8gsEoKzL22q8TYkwn19iYhYPzA8s04qoxkFRytMGLJdCgiRQiYIlHVTkeBfhycuU91DK
	E4rQ==
X-Gm-Message-State: AMCzsaWJlb/FyZH5TlraBYG23pAlYPTOnpuaS9mqyBw13xP9dD+xqzqH
	khSCKxnd3G1sJGGKfC3ujsL4fez/
X-Google-Smtp-Source: AOwi7QDUyqldBGYDMnYc5bXLMCYe3W78Q7xYLcu360OK7Bhl780fc21dIrzpY8ekavQnmP0lUBwT1A==
X-Received: by 10.223.151.9 with SMTP id r9mr2456919wrb.238.1507922853989;
	Fri, 13 Oct 2017 12:27:33 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id 69sm1846839wmm.2.2017.10.13.12.27.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Oct 2017 12:27:33 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 13 Oct 2017 19:27:15 +0000
Message-Id: <1507922836-17295-5-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507922836-17295-1-git-send-email-pbarker@toganlabs.com>
References: <1507922836-17295-1-git-send-email-pbarker@toganlabs.com>
Subject: [PATCH 4/5] runc: Drop inherit goarch
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
X-List-Received-Date: Fri, 13 Oct 2017 19:27:37 -0000

The go bbclass already inherits goarch.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 recipes-containers/runc/runc.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/runc.inc
index b1f2ba8..c1ff08f 100644
--- a/recipes-containers/runc/runc.inc
+++ b/recipes-containers/runc/runc.inc
@@ -18,8 +18,6 @@ LIBCONTAINER_PACKAGE="github.com/opencontainers/runc/libcontainer"
 do_configure[noexec] = "1"
 EXTRA_OEMAKE="BUILDTAGS=''"
 
-inherit goarch
-
 do_compile() {
 	# Set GOPATH. See 'PACKAGERS.md'. Don't rely on
 	# docker to download its dependencies but rather
-- 
2.7.4


