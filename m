Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3E63CE01458
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 05:45:14 -0800 (PST)
Received: by mail-ea0-f176.google.com with SMTP id d13so2770407eaa.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 05:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=5T8dPCbVFqp332DkVjzSlE5EorDNVECyeZeyqysoWFQ=;
	b=R1GahvKvqiOj1AbQFeFJ75iviCA3bbW6I757n/uSYla+c+m6rzzjmB6bLmP5RooQZm
	2DEMp7OSF0/V25F4DkhpDMcCWHznWju43A83JW3wm5J5N+CkwPzxXFDVqb542O3EOI4i
	n8x6umF4J/JXDc3w0vhJC3NrjWoFKZbct+pp/c71DjEpbvIWRgDAsts4hKiske7OCT68
	ymQIDoadFUpNuhuUAur30wYohsQg1GaWJJZVOd0YSHpyUYqiXN6T/FakeNPKOWd8AEOt
	FWXX+7MnSQMjE+fNdlz7HU8N4xxnTO2TvzWB5iVGR79CGE+rQRkBC/z3ryTU6/ksmUwh
	Ou2g==
Received: by 10.14.177.1 with SMTP id c1mr6030958eem.8.1354801514002;
	Thu, 06 Dec 2012 05:45:14 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id v46sm16025128eep.1.2012.12.06.05.45.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 05:45:12 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id DD04B400DF7; Thu,  6 Dec 2012 14:45:06 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 14:44:42 +0100
Message-Id: <1354801486-9482-11-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354801486-9482-1-git-send-email-david.nystrom@enea.com>
References: <1354801486-9482-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: =?UTF-8?B?W1BBVENIIDEwLzE0XSBDaGFuZ2VkIERhdmlkIE55c3Ryw7ZtcyBlbWFpbCBpbiBSRUFETUU=?=
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
X-List-Received-Date: Thu, 06 Dec 2012 13:45:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Nyström <david.nystrom@enea.com>

---
 README |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index 1ab6411..0ee4047 100644
--- a/README
+++ b/README
@@ -26,7 +26,7 @@ Maintenance
 Send pull requests, patches, comments or questions to meta-virtualization@yoctoproject.org
 
 Maintainers: Raymond Danks <ray.danks@se-eng.com>
-             David Nyström <david.c.nystrom@gmail.com>
+             David Nyström <david.nystrom@enea.com>
              Bruce Ashfield <bruce.ashfield@gmail.com>
 
 When sending single patches, please using something like:
-- 
1.7.9.5


