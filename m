Return-Path: <jed.openxt@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BE344E00C41; Fri,  7 Dec 2018 06:53:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (jed.openxt[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.160.169 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39348E00C29
	for <meta-virtualization@yoctoproject.org>;
	Fri,  7 Dec 2018 06:53:46 -0800 (PST)
Received: by mail-qt1-f169.google.com with SMTP id k12so4705479qtf.7
	for <meta-virtualization@yoctoproject.org>;
	Fri, 07 Dec 2018 06:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=49ijBGd8U/Qpt1RDgD+acHmIay8d3DjpnKMwZVDY6/U=;
	b=hL0vr1DyBGcCbWoW2WXHgDxMK61BRKTkM3+o2BktYxqG5Wn3KC0xJlFqlJwZ2oU1GY
	PkHg6Tk5jL2Ts71RQpeb/7mDMZBhlVmAMjm9oyUuI0KuLcpqf2Ii/tWBPPN8RkrenB+u
	irHifbeDKLTNI5Ek7MwfXhvpIYRLuqkkROSgYTqeq6lrB6sx+qkkyIIQveG54BcKj6U2
	MQQIKNe1PdL2D3BiEU1TOpe+pkYZW41u0a1l+5Zn+MPDXy1NQZz8fQ82CRr7H8bSQY0x
	CHY/KIbhKVXYtTXjQMxvJiHt9LZTv5hI1APhBifbKlTagjhXDy2zGcktjUhP5GhABr3I
	Iaww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=49ijBGd8U/Qpt1RDgD+acHmIay8d3DjpnKMwZVDY6/U=;
	b=luOJWXy3gEEfhBfG/qXa6nzF/MqUtNUv5KocKlS8/iP90LJ8ZCUevwIu0yoW2EoPMg
	EsrG/OHgXFywO7FrLguulZFxYRfmupaXvtL9RBEHfwGrk5aDtwDf2NO+WXh5ewnGgAAE
	OvDr8xC0bI3sT9K7jI7elmHP1ai2RALrp/yUC3vTdS/l4dEU7j57RBK595IG1Rjd5zs+
	PbArXYW6sJqtCyCE+Z83s738u1Zi75S/APtXb+NwpWH/sAElrRtAbhtf62gFuFRmUoBo
	duENCWo2de7nc+7JJ0ktbYSiwIjiWGL6fhnlW0oNZttw7d8M36unAWAXglTeOIWaRe7C
	+1Dw==
X-Gm-Message-State: AA+aEWahcegN0OWZ6Zp7NQxoiBfk/QpWAawLZ4tHRTS6qcwDUW0y2uSO
	kKphemn/eLFDzgYHL0tNDhYPptS0
X-Google-Smtp-Source: AFSGD/XsWXpBofNmOtMTO9lfxi2N+NPY1bgY1CNbvEnm7NL/TvZ28zX/8L4i6+bAtUqTuAWkkj1lKw==
X-Received: by 2002:a0c:d4a7:: with SMTP id u36mr2251550qvh.38.1544194425611; 
	Fri, 07 Dec 2018 06:53:45 -0800 (PST)
Received: from jed.securext.net (50-205-235-218-static.hfc.comcastbusiness.net.
	[50.205.235.218]) by smtp.gmail.com with ESMTPSA id
	z23sm3387961qkg.50.2018.12.07.06.53.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Dec 2018 06:53:45 -0800 (PST)
From: Jed <jed.openxt@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  7 Dec 2018 09:53:22 -0500
Message-Id: <20181207145322.20280-1-jed.openxt@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] xen: upgrade from 4.11.0 to 4.11.1
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
X-List-Received-Date: Fri, 07 Dec 2018 14:53:46 -0000

Signed-off-by: Jed <jed.openxt@gmail.com>
---
 recipes-extended/xen/{xen_4.11.0.bb => xen_4.11.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-extended/xen/{xen_4.11.0.bb => xen_4.11.1.bb} (76%)

diff --git a/recipes-extended/xen/xen_4.11.0.bb b/recipes-extended/xen/xen_4.11.1.bb
similarity index 76%
rename from recipes-extended/xen/xen_4.11.0.bb
rename to recipes-extended/xen/xen_4.11.1.bb
index 870caa7..fea17a7 100644
--- a/recipes-extended/xen/xen_4.11.0.bb
+++ b/recipes-extended/xen/xen_4.11.1.bb
@@ -10,7 +10,7 @@ SRC_URI = " \
     file://0001-python-pygrub-pass-DISTUTILS-env-vars-as-setup.py-ar.patch \
     "
 
-SRC_URI[md5sum] = "cbec0600284921744bc14119f4ed3fff"
-SRC_URI[sha256sum] = "826e3a9f6d0eac94a825d272cc2c1294e22640ae75af906eb13920f9ad667643"
+SRC_URI[md5sum] = "0c72b97432465e7f81113630fcd6e460"
+SRC_URI[sha256sum] = "be88cb2443761990efc1070d9718016561fe19066af232f9bfae572922897e59"
 
 S = "${WORKDIR}/xen-${PV}"
-- 
2.11.0


