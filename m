Return-Path: <david.c.nystrom@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 34767E008CC; Fri, 28 Nov 2014 00:38:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (david.c.nystrom[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.43 listed in list.dnswl.org]
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9486E006EF
	for <meta-virtualization@yoctoproject.org>;
	Fri, 28 Nov 2014 00:38:25 -0800 (PST)
Received: by mail-la0-f43.google.com with SMTP id ge10so591025lab.16
	for <meta-virtualization@yoctoproject.org>;
	Fri, 28 Nov 2014 00:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=3TcZbzQWtFwSB6/cCXr4gYNYOR++0EKm4V7pp+xqKqE=;
	b=rdW7E/WzD2Qj56D66lcq8BZ/HoSyQm90Lx3/GZwEA4VgezB0Ur4M5ipzv/ICIq/Lox
	7dtmF/MLkB1Azrz9vk2f5Dv+2AESqWcCmEvkX+eMbAcgnJTGj8PkUsWq2Jv72vcY0eBS
	FGxzx89BIQ3EZCb0qvkJAdYtcfWA/STOdCHGUUj7Xys9AWEhGlOUDfB7BrXWmcyIBrXr
	Ut8ZrCKXgZ6KOjplE6t2qaaEDPTf4wKP+10QFBc8nVkbQyVhFvwb/1slAk7NPQ3GxVA7
	l7QCgniK8xzEpFUe00YgkiuoMimj/IUp6ZzrENKYk+ySjEdXWhOh/ZPg9rZzNJb1+0p7
	d71w==
X-Received: by 10.153.11.133 with SMTP id ei5mr42990976lad.75.1417163904274;
	Fri, 28 Nov 2014 00:38:24 -0800 (PST)
Received: from localhost (host-78-78-134-14.mobileonline.telia.com.
	[78.78.134.14])
	by mx.google.com with ESMTPSA id f7sm2427061lam.26.2014.11.28.00.38.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Nov 2014 00:38:23 -0800 (PST)
Received: by localhost (Postfix, from userid 1000)
	id 01B46B40625; Fri, 28 Nov 2014 09:38:19 +0100 (CET)
From: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 28 Nov 2014 09:38:18 +0100
Message-Id: <1417163898-4587-1-git-send-email-david.c.nystrom@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <CADkTA4MVJkRUeLW-1tdxF03YjbNh-h0CBhh7X0WX7ooqA3EmLg@mail.gmail.com>
References: <CADkTA4MVJkRUeLW-1tdxF03YjbNh-h0CBhh7X0WX7ooqA3EmLg@mail.gmail.com>
MIME-Version: 1.0
Subject: [all][PATCH] Remove david.nystrom from MAINTAINERS
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
X-List-Received-Date: Fri, 28 Nov 2014 08:38:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I've been a ghost on the list for ages, I think its long overdue to
remove me from the maintainers list.

Signed-off-by: David Nyström <david.c.nystrom@gmail.com>
Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 README | 1 -
 1 file changed, 1 deletion(-)

diff --git a/README b/README
index 6a1f2d1..1531ac0 100644
--- a/README
+++ b/README
@@ -34,7 +34,6 @@ Maintenance
 Send pull requests, patches, comments or questions to meta-virtualization@yoctoproject.org
 
 Maintainers: Raymond Danks <ray.danks@se-eng.com>
-             David Nyström <david.nystrom@enea.com>
              Bruce Ashfield <bruce.ashfield@gmail.com>
 
 When sending single patches, please using something like:
-- 
2.1.0


