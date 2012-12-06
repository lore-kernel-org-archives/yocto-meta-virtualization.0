Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3224E0146B
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 06:03:55 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4044027eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 06:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=CJ+fuY+okh5LXIvx0OVAgmLHM+eB6FjWOax7CDvDWS4=;
	b=S+NF1DHceLXVR+2WQ5NEz83LaSb5MEKUFHjrhdBxjM09pTzm+F7t28U0aSHRzJPSAN
	aeeqd+JhRFqzI3APdn1fZHsIC/cUfe9NCol4dEln9Oey2QjpWyTbuVznyi4ujUJReuhr
	NaLkL+RGB/JQqz8+2FviLlrfik7iWGo+p8kSH8mgGfJaNQtqntbAhx4Gbk/Lax71pjvm
	jZdsISHRLKq8M1KCyUDA6FqeI6oic2acPBbg3SsNAzm4HkbsG4WDhejTYaffwxHqoQRX
	s6NAmbkRKuzkH6TioDK7BZy5vUO7hgLEfzPDZtqwfTJFL7DQhqSpGM8x6JKLycf32vcD
	qLCQ==
Received: by 10.14.194.195 with SMTP id m43mr5912810een.44.1354802635653;
	Thu, 06 Dec 2012 06:03:55 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id 44sm16115558eek.0.2012.12.06.06.03.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 06:03:54 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id AEEF2400DC1; Thu,  6 Dec 2012 15:03:48 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 15:03:16 +0100
Message-Id: <1354802601-10840-10-git-send-email-david.c.nystrom@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
References: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
MIME-Version: 1.0
Subject: [PATCHv3 09/14] Added .gitignore file
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
X-List-Received-Date: Thu, 06 Dec 2012 14:03:56 -0000
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


