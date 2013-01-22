Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4465CE00724
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Jan 2013 04:47:47 -0800 (PST)
Received: by mail-ee0-f52.google.com with SMTP id b15so3353367eek.39
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Jan 2013 04:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=cL+c+lebdn9B7grJ2UvLb4Fb5jmLn2EEojIphpCDLq0=;
	b=b3WGPJq7fztyqqm2CkXXJVlDT/ZMnOS3HBLQd/MHZPQ0Ig1fjHmzD8ObO8YA74WAp7
	fqyNbApdlSme2ZtraL6tbAmTzhkfVXOhl/sFrdjdTrwoKo9BpVJO3K78PldI61tTSGkO
	UBD7JoZkCnj7uTKnt/b7rE+cw3UsAIqrwD56ob++y604NSawgljgYSfMIkir3DBv1kuu
	8jbh5tQNTeh5uIcgRoVwttvrTza44Cq2BVH4yKassUxZjrGRiBbqZqJ5j6cFld29EJF+
	/3Ct6BbflfXsLHpCZHOXwKAvq3TVajDSEov6S/lqsUVB3KOtBP0BZamkt+ZHvUtgS76a
	a9Uw==
X-Received: by 10.14.219.72 with SMTP id l48mr72599318eep.37.1358858865129;
	Tue, 22 Jan 2013 04:47:45 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id g2sm4079632eep.16.2013.01.22.04.47.43
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 04:47:44 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id D943A40075E; Tue, 22 Jan 2013 13:47:31 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 22 Jan 2013 13:47:16 +0100
Message-Id: <1358858841-13339-2-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1358858841-13339-1-git-send-email-david.nystrom@enea.com>
References: <1358858841-13339-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] Added meta-networking dependency
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
X-List-Received-Date: Tue, 22 Jan 2013 12:47:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 README |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/README b/README
index c630494..e8c5252 100644
--- a/README
+++ b/README
@@ -17,6 +17,8 @@ URI: git://github.com/openembedded/meta-oe.git
 branch: master
 revision: HEAD
 layers: meta-oe
+	meta-networking
+
 BBFILE_PRIORITY_openembedded-layer = "4"
 
 Maintenance
-- 
1.7.9.5


