Return-Path: <kergoth@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 296D8E01206
	for <meta-virtualization@yoctoproject.org>;
	Tue,  2 Jul 2013 09:10:07 -0700 (PDT)
Received: by mail-ie0-f175.google.com with SMTP id a13so12970337iee.34
	for <meta-virtualization@yoctoproject.org>;
	Tue, 02 Jul 2013 09:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=NaVULFpTh5hXlP+w585a32NhpequPXUUVIy5PYDxMmA=;
	b=zteOY3vwsw7QuwP/dek44JCSdqcVAQ7y4ki/zqCABdE/A81Cjxhu7VyHYtew7eX347
	Dc81Lvei02pFTSaqKi7G9JJV57dYxtilUYyPLWFHuUGPrFE21FGYpn1CLWtfBMSOZYVp
	NAlZGcwXA2G0Zd+fsMmUjdnr3sbQGshbXfsR4dSn6l9WTqfL/psM6RwGEfoiZsnxHZOp
	SAVxKU4FbIs1YwRLAu3edkpHVq9Gh6sGdCsdABH2lINR5tZUPSm6YfP0HUuYGoIbIkuj
	dGDlxwTK4cA4Ocwd6Ja37p6NP0fd2pRJ1e5XcZcR5nQ6NpTPU402+kWDzGw5Dg+UbvFk
	ECNA==
X-Received: by 10.50.11.72 with SMTP id o8mr21235615igb.44.1372781407008;
	Tue, 02 Jul 2013 09:10:07 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	wn10sm19042669igb.2.2013.07.02.09.10.05 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Jul 2013 09:10:06 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: meta-virtualization@yoctoproject.org
Message-Id: <1372781400-19837-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.2
X-Mailman-Approved-At: Thu, 29 Aug 2013 06:02:43 -0700
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] iptables: update bbappend to match oe-core
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
Date: Tue, 02 Jul 2013 16:10:10 -0000
X-Original-Date: Tue,  2 Jul 2013 09:10:00 -0700
X-List-Received-Date: Tue, 02 Jul 2013 16:10:10 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../iptables/{iptables_1.4.18.bbappend => iptables_1.4.19.1.bbappend}     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-extended/iptables/{iptables_1.4.18.bbappend => iptables_1.4.19.1.bbappend} (100%)

diff --git a/recipes-extended/iptables/iptables_1.4.18.bbappend b/recipes-extended/iptables/iptables_1.4.19.1.bbappend
similarity index 100%
rename from recipes-extended/iptables/iptables_1.4.18.bbappend
rename to recipes-extended/iptables/iptables_1.4.19.1.bbappend
-- 
1.8.3.2


