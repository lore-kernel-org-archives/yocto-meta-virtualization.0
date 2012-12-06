Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A863BE0144D
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 09:06:48 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4182732eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 09:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=CJ+fuY+okh5LXIvx0OVAgmLHM+eB6FjWOax7CDvDWS4=;
	b=rwc1G7ZRCj0p/oQQzCcmRXQ//PeZJ9GDI1KfyYpzau2THPKeq0bRr8wPXTaIyNDoBm
	+Zz+N4Kosqy+0CF0ZLJ24HcBkIL5QYsphuA+Ydl/4nZb+B1dHi+xBvP8+Fm0byqixfkC
	FYJe/xxToAwKtB/GVNYhMLxs5wFBbG2C8f1OYFzPIIUd+EZM11xjJ9BxlnL+ZCv1RGEJ
	b4k4jdG76ebm0Nb8kmxSR/kfQbDAVniDrkX4Xv2bRe2nrauorHeo1eZULcgVXK+aykKJ
	QufyWNp0xjeJNOeRvElcVQT6K0wMLLvYKK0Nx/ycN4CtqvX1kwVCW9Eh9Mqx83jaiT2Z
	o8HQ==
Received: by 10.14.177.1 with SMTP id c1mr7693958eem.8.1354813608399;
	Thu, 06 Dec 2012 09:06:48 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id d3sm16964152eeo.13.2012.12.06.09.06.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 09:06:47 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 3D4D1400DC1; Thu,  6 Dec 2012 18:06:40 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 18:06:29 +0100
Message-Id: <1354813596-8233-9-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
References: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCHv4 08/15] Added .gitignore file
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
X-List-Received-Date: Thu, 06 Dec 2012 17:06:49 -0000
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


