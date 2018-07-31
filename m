Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68E8AE00CDF; Tue, 31 Jul 2018 12:36:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.193 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (christopher.w.clark[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83E26E00D4F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 31 Jul 2018 12:36:21 -0700 (PDT)
Received: by mail-pg1-f193.google.com with SMTP id a11-v6so9579966pgw.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 31 Jul 2018 12:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KBLJP5PRMpblWBN+WUO6dbDDi7NkBVKwumA6+94euUk=;
	b=h+KQLq0QtjOvDa3/bbV0DR/HmjGvswrAr/ZFEIV3atTIwFqbQ34pCbShOUMP4dKmis
	DPhtReKMqLnKKUEBb7AhsASTBZVU1Qqn7fP5CTa2ZxHblSFBeiXHlhQFnkDbFfGpno1E
	8u7Hx+dPVrMj3wNAUKQ5S0BJwlzFvdyGwJO+xIjpKyf+MPUtuzMzlUK3+hONJcRav+c7
	wgN9zGZw5Yo7mcY2K55stHkdCRKiWeDTvm74vekNXWxWJ+fn4SwSu4gdwZWWVJh7K8Zu
	3XbOExyupfS5hhiaXgR6d7wsB7uYu/BVjGRnkjrrDZw5DoShHwRVfWzB+YdedinZq68+
	IzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KBLJP5PRMpblWBN+WUO6dbDDi7NkBVKwumA6+94euUk=;
	b=O+3Pwmpdml+Bw6F+yUaGgHELX60AmFhZ5GopNvQKRPOFD0q3kUqRvCv6oCVR4nqsSt
	eW1dohVpiimGh7Ug10lJ2MgklysllUBLTycOG0UHA4YrugkDA3yZFDrGUWlo2U0CDk0T
	M2tW5zCizy4PALRi2aKdvu0mxuoO2eqlHHejyAJJ0C1X424ylyDly+c65x8/mUKD4mxO
	JaZGgQwvaUveCKSerZ/J6gda4NcLcjpY9L2rb98EYtgTByqwrzuoF6PHK0nXNq5y3v+W
	mj3c75gNyYoNwz7I+SGuINZ7H/uLoQ7ujRE1dreOg1TbTieOLWIbWvR3+Tx31FvS1W5u
	1iNw==
X-Gm-Message-State: AOUpUlFuyn6RBf/WVGweLS+C+bteyM7z8maQgrgVygfivTLDPyXcJrqQ
	X3Qg7svIMmvyPK1/yvYTAqSJaSJs
X-Google-Smtp-Source: AAOMgpfasqHoowiOj8f4ef8EhsioKxzlq+AmxauGUCol2Gev9bY/5Twewgu9A8MNwzGllqfEdrbHkg==
X-Received: by 2002:a63:64c2:: with SMTP id
	y185-v6mr21405398pgb.126.1533065780626; 
	Tue, 31 Jul 2018 12:36:20 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	64-v6sm24758626pfi.89.2018.07.31.12.36.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jul 2018 12:36:19 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Tue, 31 Jul 2018 12:35:49 -0700
Message-Id: <1533065750-25786-9-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533065750-25786-1-git-send-email-christopher.w.clark@gmail.com>
References: <1533065750-25786-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH v2 8/9] xen: package depriv-fd-checker
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
X-List-Received-Date: Tue, 31 Jul 2018 19:36:46 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

A new tool introduced in the Xen 4.12 dev cycle.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 42c93b4..4894c77 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -478,6 +478,7 @@ FILES_${PN}-misc = "\
     ${bindir}/xencov_split \
     ${bindir}/xen-detect \
     ${libdir}/xen/bin/xenpvnetboot \
+    ${libdir}/xen/bin/depriv-fd-checker \
     ${sbindir}/gtracestat \
     ${sbindir}/gtraceview \
     ${sbindir}/xen-bugtool \
-- 
2.7.4


