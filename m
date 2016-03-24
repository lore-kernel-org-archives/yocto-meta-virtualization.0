Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CB8FEE00B70; Thu, 24 Mar 2016 08:01:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C20FAE00AEA
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 08:01:26 -0700 (PDT)
Received: by mail-qk0-f196.google.com with SMTP id u128so2138776qkh.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 08:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8JZnYgbKsXhkjKRAypgVhad371pkONrLlq1AFgyZmTs=;
	b=O74tmOGOaUB2Y1y3HdvEJxTwRAn2R/+5yr5+ygV79dBy+cQ/QFh9fJYL5jyNgoB1I0
	1glyAjG53xMu2wEDY+sd/c1QRAGOpFYNWdmazPaN+hdkUk4dDks/XJNGHv0QQu0Ts1Ds
	R3ODxxgCtQ1i+9cRRo5SUW8QrZTjDuZymT+zFbRSE6WtSljCDu1y/o4t4mN+PTAM3VsM
	jO/QzLyQJyjWbktYZceU6DPbJyLvFvxaTBn4X/Bb9cwsRQlhqVkikUsFPlTIa73K1jVP
	o0QIdEiAsECkbKtfOzUWOaCn7mu48+/eILjdtiBTZcSchffAJ5Tro3XRtsxGAAp9akGy
	Xymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8JZnYgbKsXhkjKRAypgVhad371pkONrLlq1AFgyZmTs=;
	b=OfdUOXG9q+sDUe4IJ1Qxlfoh7MlcxLkDI9kdSv/ZNXQRyc8cQ9+535ZANmmxkEF6da
	f8Lb1k/IE2DSE++w3hEB6dUdj1hsZtnPdUQCDG8QmZfUh0mBcb17In+9LmiwKLglRuEu
	2Za9TVFfkUyWDRgtjS8MBprSQyEstC8+stJVSm/Jf+yMy2Ft7ROVkkM24WH9D+MVx0GL
	xraVBK6iCYkidVNzs98FG+kdNmuKCsKXZlnAzA9Ng6ul3jtQMrZ54Vz1InkUw+xE3bBM
	yGQNndXIkh7y0C2huu/dTxsMI1uHqbfAul2Mez3Y6q8Oi9dKOvh2j45IeD4HpE8ZaR00
	3PTw==
X-Gm-Message-State: AD7BkJJft7ZqPhXE9ophi/fc17TjgLbXClaVe866cWi+YcOOwOuZo3dRmktfrg2H8OxKrg==
X-Received: by 10.55.81.87 with SMTP id f84mr11091107qkb.10.1458831685628;
	Thu, 24 Mar 2016 08:01:25 -0700 (PDT)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	w187sm3415044qhc.5.2016.03.24.08.01.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Mar 2016 08:01:24 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 24 Mar 2016 11:01:14 -0400
Message-Id: <1458831674-12779-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Chris Patterson <pattersonc@ainfosec.com>
Subject: [PATCH] xen: add curl and gnutls to depends
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
X-List-Received-Date: Thu, 24 Mar 2016 15:01:27 -0000

From: Chris Patterson <pattersonc@ainfosec.com>

Addresses QA warnings with regards to rdepends for xen-qemu.

Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
---
 recipes-extended/xen/xen.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 2eba012..c30988e 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -31,9 +31,11 @@ DEPENDS = " \
     util-linux-native \
     xz-native \
     bridge-utils \
+    curl \
     dtc \
     gettext \
     glib-2.0 \
+    gnutls \
     iproute2 \
     libnl \
     ncurses \
-- 
2.1.4


