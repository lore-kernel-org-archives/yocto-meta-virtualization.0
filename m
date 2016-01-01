Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DFE33E00AAA; Fri,  1 Jan 2016 07:54:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.192.45 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (cjp256[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 760B9E0033E
	for <meta-virtualization@yoctoproject.org>;
	Fri,  1 Jan 2016 07:54:21 -0800 (PST)
Received: by mail-qg0-f45.google.com with SMTP id o11so216804641qge.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 01 Jan 2016 07:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cj5QRV6FLznat7fV1uNh73UKf6okzBU76v31qkWkFkc=;
	b=XPuccRAtgAGuBIxKzAfkNz986PrUY+7zX85fUN7fnFGvdWe44sSSns/hzIV1BcB8eD
	7U4O8XiNj5kmNAcmMxNxUMxGCHhgg/c1TWtQo317rHjPUj9878QMM1nPuGKgfvjpbp86
	E6FQGI0W4iglpqh/ip8lTpFcAqOV+RcgfGNZjk25oTeO4pZU5CHGDGLzyAbvyw3JM2Px
	SNcQnRsLGEemWEqsIumBOmGPlUhUZsenKQGD1IsNycHMAPi+K7YJhKzrUirdhA+wmsT4
	No8iQHPxOY3pclw9JERVdoaHs7+E9J3dGoPs9+7srFW2MxaFO043P0cgRBNKTrgZROg3
	oWZw==
X-Received: by 10.140.106.69 with SMTP id d63mr96758029qgf.88.1451663661132;
	Fri, 01 Jan 2016 07:54:21 -0800 (PST)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	e134sm34746101qhc.49.2016.01.01.07.54.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jan 2016 07:54:20 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  1 Jan 2016 10:54:17 -0500
Message-Id: <1451663657-25079-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] xen: add libnl to DEPENDS
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
X-List-Received-Date: Fri, 01 Jan 2016 15:54:21 -0000

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/xen/xen.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 6bc85fe..d3a8b10 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -35,6 +35,7 @@ DEPENDS = " \
     gettext \
     glib-2.0 \
     iproute2 \
+    libnl \
     ncurses \
     openssl \
     pciutils \
-- 
1.7.10.4


