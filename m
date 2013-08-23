Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23A79E00747
	for <meta-virtualization@yoctoproject.org>;
	Fri, 23 Aug 2013 00:34:37 -0700 (PDT)
Received: by mail-lb0-f173.google.com with SMTP id 10so215440lbf.32
	for <meta-virtualization@yoctoproject.org>;
	Fri, 23 Aug 2013 00:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=yHlL0BVBluiP6+wm6iQ+HxOxLEvWesq2WvgNTMjcrQ4=;
	b=RjQuSwxPoNknaj8CRR+3IR6MrrdAvEe9yZGzyH1PUujfu0imXF3FCVjdNhRr2hJmIa
	qy3FuKUK3lYI83BywKJQqfPfEM0amY6D4B5Sbm/uEcoqyK/upAbRQYCLBg+XvcuSjWdX
	YfxbJl2SC5sl5qWtioP9CFu1oc3MO1GYOd28iV2l7Nqe8fv4KvaMvsY4bmTwzAFvqF6i
	wP38FqfB8KgnmqJD7UeyiSu9FDDjm51jhxpk9vkhVWUQUbjP9LBegwIGJvUUldTYUIbi
	2vfPhyG36rhk/7J3gE9cC6Z24nkeXF0jkW7UtJvAcGFTViY8eZIEP1MVVHq4Lo7B/R+6
	akhQ==
X-Received: by 10.152.28.105 with SMTP id a9mr6160lah.41.1377243275813;
	Fri, 23 Aug 2013 00:34:35 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id k9sm6245830lbe.6.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 00:34:34 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 62F08403EAA; Fri, 23 Aug 2013 09:34:23 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 23 Aug 2013 09:34:21 +0200
Message-Id: <1377243261-11976-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] Add kernel config fragment to allow OVS QoS service
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
X-List-Received-Date: Fri, 23 Aug 2013 07:34:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 recipes-kernel/linux/linux-yocto/vswitch.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-yocto/vswitch.cfg b/recipes-kernel/linux/linux-yocto/vswitch.cfg
index fcc0ca6..0067504 100644
--- a/recipes-kernel/linux/linux-yocto/vswitch.cfg
+++ b/recipes-kernel/linux/linux-yocto/vswitch.cfg
@@ -1,2 +1,2 @@
 CONFIG_OPENVSWITCH=m
-
+CONFIG_NET_SCH_INGRESS=m
-- 
1.8.3.2


