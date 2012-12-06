Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F2C1E01465
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 05:13:55 -0800 (PST)
Received: by mail-ea0-f176.google.com with SMTP id d13so2757058eaa.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 05:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Uo4zdijIif8SJ7+F5FJq3nBKrdKEmCLvHzD9gKChY9A=;
	b=TGyGBsou4ymlV1bdKVN6YpTSgr5XgKN4Q+FVZo663fkx5KJOqw6pt4uAuMHnAXyNQP
	qKfdyH+RWYdWm+AJeeA9yM7wHDqpCZCBsNn3/XXBgY4i/qMl0Nnyw6cp5Dlk4yrc2qKM
	mLc6xj1yYFpF5VLLWU8k/aQcnbC2VfzNu68PYfwTuy9LstbphcGW6W1OnRiFyMfLIVp4
	8WOnEMOflWy/k7ZPzUpJTJEPD6zSnuKSUdwmHbN+XzZh3HPjbqp3hUkPdUPe8y2Xjvsf
	2bRTxP7wzu/TIbXlNzAVAIAgKfHQdormUUidYXiv3Pe6zJ7SSoF1nTlaID7qoqWBDBM/
	FdpQ==
Received: by 10.14.177.1 with SMTP id c1mr5778799eem.8.1354799634604;
	Thu, 06 Dec 2012 05:13:54 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id k4sm9435609eep.15.2012.12.06.05.13.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 05:13:53 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 6A914400DF7; Thu,  6 Dec 2012 14:13:49 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 14:13:41 +0100
Message-Id: <1354799626-6911-11-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354799626-6911-1-git-send-email-david.nystrom@enea.com>
References: <1354799626-6911-1-git-send-email-david.nystrom@enea.com>
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
X-List-Received-Date: Thu, 06 Dec 2012 13:13:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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


