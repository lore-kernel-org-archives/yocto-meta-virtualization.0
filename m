Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88F61E0144E
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 05:45:14 -0800 (PST)
Received: by mail-ea0-f176.google.com with SMTP id d13so2770405eaa.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 05:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=CJ+fuY+okh5LXIvx0OVAgmLHM+eB6FjWOax7CDvDWS4=;
	b=ZGi4shac3iQ40Hi/IGP3UGhJ3z/UR7ar/SKRGMeSyQjEnyb6m4r2BM8LaW3u2DqsvZ
	G3BX9338EiLY6w41PwImmfzBSQELN30Ns0Z3H6GpYK5ZBVaLRWGLUZlU0/VQR0H4cFwS
	NCIPjISnN2SldM9DZXGRr0guGhjDZldlxw+Wdagz+AcajEBnLEqoahupac2168mgCmse
	PNJf2jMVF3lqZxMZ7Z+c8tHfKc8P3yvkLxW2TT8cZLFpDREke6b5UVRLtiSqOiKDMHP3
	e09M5i/CXTOR+24lxO4PZ7/P1ij2FE1VaD7/UvMCXcQPuFBvU8s6a6J+Aqzlw0iumy+H
	ircg==
Received: by 10.14.223.135 with SMTP id v7mr5771039eep.41.1354801513785;
	Thu, 06 Dec 2012 05:45:13 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id b2sm15997729eep.9.2012.12.06.05.45.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 05:45:12 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id D7230400DC1; Thu,  6 Dec 2012 14:45:06 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 14:44:41 +0100
Message-Id: <1354801486-9482-10-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354801486-9482-1-git-send-email-david.nystrom@enea.com>
References: <1354801486-9482-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 09/14] Added .gitignore file
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
X-List-Received-Date: Thu, 06 Dec 2012 13:45:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Nyström <david.nystrom@enea.com>

---
 .gitignore |    6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 .gitignore

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 0000000..65feb82
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,6 @@
+build*/
+pyshtables.py
+*.swp
+*.orig
+*.rej
+*~
-- 
1.7.9.5


