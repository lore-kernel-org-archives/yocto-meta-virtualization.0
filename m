Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A1047E009AD; Fri, 11 Dec 2015 13:59:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW,URIBL_BLACK autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.7 URIBL_BLACK Contains an URL listed in the URIBL
	blacklist *      [URIs: cardoe.com]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9203BE00BDC
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Dec 2015 13:58:57 -0800 (PST)
Received: by qkdp187 with SMTP id p187so59704825qkd.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Dec 2015 13:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KOUpT6uXH/YHlLhyVyG7/8Zas2JWjaX5HCy6CMsjJNY=;
	b=CdZpP7UMtHCmlcEyOEubdZrAyxe6bLD7Be7oEyFdYho0PJVktov5F7e5f0ux5xq8/n
	X1EyAmfQh9PnNoBsBbvRGk4hgaSrOBpkEMn3v/Z0S8QhWcJFLQrxiAIOD4FFcXkgzGxU
	eiuLhuhjVvlTRte38BfY4ac+gFRn5MZPV6WXHUYo5LzTn3jh5OD+LK0wI/XbsqYBXYpj
	0sFuGfkHn+vHhnAKzk53Eq/lMJBm45yMOv2dWS+28cWvZlt78Ffnv+NSSR+UMC/Q94W+
	w1/a+fpVrsrRfZs88zhDk5hDBv6PtBzv4DqfSyqmvG7jirgOvL5rc/RBkYJcJsePhDN4
	rpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KOUpT6uXH/YHlLhyVyG7/8Zas2JWjaX5HCy6CMsjJNY=;
	b=I8ZGhSsRFBiTsDKjgQn85Zbg68CoAIsmKIe0MiquR9Usmk4F15TkrLpXcpRZbCWBC7
	Qce6fS2EK+stCqeWag5OZWjdBDT5l1rE1rSIYt4VKToweXOwllpp+78yxCa+Pk91YEO6
	m+TnhPjgrpkdQZIJLDqKo1y0iSllzB9LkaVUzuq6e4+pxxK/mudc/hozbFAAz8Zsl15s
	quTtqCVZTv6zQXmEZHShHJFhXFDdijArsTLQ02k9yaDsdAHEROzUbiUXmazneNjz17Z8
	mLpnUCrhDgmoU4495MxEn+EHubgNOLObF1ogcVRtMZvFWALA1UX8cFeTP5KAa9LTJ3Lm
	cXUQ==
X-Gm-Message-State: ALoCoQlzpQnsIW+nLKxDqtho3Vi29189FfhlZCN6pLSjftKv86ftieeXzlUV6w97Wlndarv0pmYEoxhWDjk5MAvhlKpbd1yufA==
X-Received: by 10.129.33.65 with SMTP id h62mr10520020ywh.139.1449871137187;
	Fri, 11 Dec 2015 13:58:57 -0800 (PST)
Received: from swanson.lan (c-68-46-196-185.hsd1.al.comcast.net.
	[68.46.196.185]) by smtp.gmail.com with ESMTPSA id
	e64sm14070336ywb.25.2015.12.11.13.58.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Dec 2015 13:58:56 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 11 Dec 2015 15:58:32 -0600
Message-Id: <1449871112-12401-4-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.4.10
In-Reply-To: <1449871112-12401-1-git-send-email-cardoe@cardoe.com>
References: <1449871112-12401-1-git-send-email-cardoe@cardoe.com>
Subject: [PATCH 4/4] xen: move PR variable from include file
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
X-List-Received-Date: Fri, 11 Dec 2015 21:59:03 -0000

It appears inapporpriate to have this variable in the include file and
should live within the bitbake files themselves.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen.inc      | 1 -
 recipes-extended/xen/xen_4.5.0.bb | 1 +
 recipes-extended/xen/xen_git.bb   | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 1bb0e6a..00f1823 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -2,7 +2,6 @@ DESCRIPTION = "Xen hypervisor"
 HOMEPAGE = "http://xen.org"
 LICENSE = "GPLv2"
 SECTION = "console/tools"
-PR = "r0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e0f0f3ac55608719a82394cc353928df"
 
diff --git a/recipes-extended/xen/xen_4.5.0.bb b/recipes-extended/xen/xen_4.5.0.bb
index 6c17b90..73d01c4 100644
--- a/recipes-extended/xen/xen_4.5.0.bb
+++ b/recipes-extended/xen/xen_4.5.0.bb
@@ -1,4 +1,5 @@
 require xen.inc
+PR = "r0"
 
 SRC_URI = " \
     http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
index 88145a3..4def3bf 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -1,4 +1,5 @@
 require xen.inc
+PR = "r0"
 
 SRCREV = "68bd172e6fa565899c846eb72755c8ffd8562c8a"
 
-- 
2.4.10


