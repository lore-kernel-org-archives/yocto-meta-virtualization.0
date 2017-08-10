Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 59E9CE00C78; Wed,  9 Aug 2017 18:29:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.83.65 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.65 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F22DE00C25
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 Aug 2017 18:28:59 -0700 (PDT)
Received: by mail-pg0-f65.google.com with SMTP id y129so7186543pgy.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 09 Aug 2017 18:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uQbUtYEOhJY1pbRZYm0njB9kgGH2bWzoB+JoRw5RUeY=;
	b=SWSTV4wyGCb3LZxjoT5f2v0LOqrwSSconTlDL7RKeADLGC0oVRK4DexPWaQnGgjrsh
	9BIdrY43LjQil6Jt6AEtgRTbU+MXkeFJa3LzsknN2De1YYsIqlUgrxPYAt5y7bz9DT4n
	BbihiLOgI5LVOBxjypIEOt9m4JRYgeCULv6EkCySL4v248OdDCDcdZjOiDqy8LvHawoh
	ylKw76toov6pKtnhekVVjLw8Dzu4NBzmsf2cL8DOqa2Gol+PJyN/FOq3boVG48lvYc2l
	PXjXZ340pWNie6g/2SoaWIiOV4taxK7WDExel+v8+musxXFBYKvY3PSrDfP22wATxa0G
	rTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uQbUtYEOhJY1pbRZYm0njB9kgGH2bWzoB+JoRw5RUeY=;
	b=RuuCPAqJXPEK+455hFg4cNWo1snm78+oOmQXC3ZM0bKRQ4Ku2zLyQCSsFR5xiqmJoO
	x7EUTNCOHG25oj1sVYYcKF83du36iiZ98Rh0GVdzA1/2sFn6iQpJAezye3guPaEUPoPB
	fTQKcrqZwkuW5fE4djIVXJmn+JYy0s/G04ISQDH7XiWOQlbIYxy5cM89EqIDLA6v+1IW
	q2lY7EhIwPNynSJH5K8KLnhcCvI7FgOEZSx3zjQFryjvqBHfkkMnPxyCFbZ3Uei1g0hl
	1xKGu8SlceAFv2Nsde3Plm/bjPbC52bD4PH2JJUvPr2ST+ZvQNyzFu1tAkxjRjathb6b
	oSFg==
X-Gm-Message-State: AHYfb5gmyP/BAghAX4PF3v1U/sK0RYUsOBd9TXbW5YXEsFtBtiD/gXug
	IA8cA9i3yXzDzVYHUW4=
X-Received: by 10.98.206.194 with SMTP id y185mr10352723pfg.312.1502328539355; 
	Wed, 09 Aug 2017 18:28:59 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	o17sm8642348pgn.52.2017.08.09.18.28.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Aug 2017 18:28:58 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Wed,  9 Aug 2017 18:28:44 -0700
Message-Id: <1502328524-4230-4-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502328524-4230-1-git-send-email-christopher.w.clark@gmail.com>
References: <1502328524-4230-1-git-send-email-christopher.w.clark@gmail.com>
Cc: Christopher Clark <christopher.clark6@baesystems.com>, cardoe@gentoo.org
Subject: [PATCH 3/3] xen: add recipe for Xen 4.9.0
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
X-List-Received-Date: Thu, 10 Aug 2017 01:29:04 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen_4.9.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 recipes-extended/xen/xen_4.9.0.bb

diff --git a/recipes-extended/xen/xen_4.9.0.bb b/recipes-extended/xen/xen_4.9.0.bb
new file mode 100644
index 0000000..0b20936
--- /dev/null
+++ b/recipes-extended/xen/xen_4.9.0.bb
@@ -0,0 +1,10 @@
+require xen.inc
+
+SRC_URI = " \
+    https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
+    "
+
+SRC_URI[md5sum] = "f0a753637630f982dfbdb64121fd71e1"
+SRC_URI[sha256sum] = "cade643fe3310d4d6f97d0c215c6fa323bc1130d7e64d7e2043ffaa73a96f33b"
+
+S = "${WORKDIR}/xen-${PV}"
-- 
2.7.4


