Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 75B90E00C00; Tue, 26 Jan 2016 11:09:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.193 listed in list.dnswl.org]
Received: from mail-yk0-f193.google.com (mail-yk0-f193.google.com
	[209.85.160.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9186FE00BFD
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 11:09:46 -0800 (PST)
Received: by mail-yk0-f193.google.com with SMTP id v14so15389400ykd.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 11:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ecKYOlpyzzfN+6RGSRDXxoPSRwjMn8lePL+eMGHbo/c=;
	b=gOZQ5vRvG5Iqqew0YfciecVAiAGkblfP1++qxMi13mA625R5S9kPaDKqeVTgrGiZuS
	rvBNW0oyqF9WZeReo2TiEvR9tSm0ofUaiLyDCpQbrRgkta8wcVDaEKw64Te61rnOPKxx
	2r1xW4hCuaYoxfh1gNrSgEzng5raeDlnt37UybbeUoCjqVERILejzZ+4mOxe3V1Dt8oq
	6OWy1v9ufY+AJf095KOVpY9nf8GQWHMWCLhIfnXJ9FbIkd8U7hfVINNI/Pl3lkRPdcAQ
	ogOg5x+ZO4udKDfexEHMkgtpH/UVwtUD++nS+AcmxvgLw8t1Us0KJ4zkTtqugQojJ8QK
	rRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ecKYOlpyzzfN+6RGSRDXxoPSRwjMn8lePL+eMGHbo/c=;
	b=dmqCdR9FdpvI6c4G+b9117EyXZarOFs8banzF7RdksXRAciqdxokpcFSPHremMClKQ
	xAi65mQrF770QIxSjWVAspzzXRibPYd/JtFvHWoQbbzPlFhtfOGaeYcgjtwSAZWPhPQ2
	twLiaE6OMzUeskip/OxkmmKXvHm2Z3udW8Blzu2ND5A23n+s2G4bQZmy/iAdr84nzXZU
	OyUEL2l+VjzdwFK+2fKrHjG23eLbsLXJtfdUxnIwBle7PLR8p1PuufFEaWZrKyH8PUMA
	IWnkJ+EZpT14qq3HDDSrQ5GH78nimCii9h8PalgT0pWOxCJpT4xH7iGlDwDKmZ/PJq9P
	WvHg==
X-Gm-Message-State: AG10YOQLTFVDx8mgK+B0r4SVkvCJO07tnXkHM0/qmTEGDDF2svl9F5iRpVvmgb9RuY8pBw==
X-Received: by 10.13.240.69 with SMTP id z66mr13899474ywe.330.1453835385678;
	Tue, 26 Jan 2016 11:09:45 -0800 (PST)
Received: from swanson.lan (c-68-46-196-185.hsd1.al.comcast.net.
	[68.46.196.185]) by smtp.gmail.com with ESMTPSA id
	h187sm1899502ywc.0.2016.01.26.11.09.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jan 2016 11:09:44 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 26 Jan 2016 13:09:17 -0600
Message-Id: <1453835364-6473-2-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.4.10
In-Reply-To: <1453835364-6473-1-git-send-email-cardoe@cardoe.com>
References: <1453835364-6473-1-git-send-email-cardoe@cardoe.com>
Subject: [PATCH v2 1/8] xen: update git version to 4.6.x
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
X-List-Received-Date: Tue, 26 Jan 2016 19:09:49 -0000

Since xen.inc has been updated to support only Xen 4.6.x, the xen_git.bb
should be updated to a revision in the 4.6.x stable series.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen_git.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
index 88145a3..a86a501 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -1,13 +1,15 @@
 require xen.inc
 
-SRCREV = "68bd172e6fa565899c846eb72755c8ffd8562c8a"
+SRCREV = "1fd615aa0108490ffc558d27627f509183cbfdaf"
 
-PV = "4.4.0+git${SRCPV}"
+XEN_REL="4.6"
+
+PV = "${XEN_REL}.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
 SRC_URI = " \
-    git://xenbits.xen.org/xen.git \
+    git://xenbits.xen.org/xen.git;branch=staging-${XEN_REL} \
     "
 
 DEFAULT_PREFERENCE = "-1"
-- 
2.4.10


