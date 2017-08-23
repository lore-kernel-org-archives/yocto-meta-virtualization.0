Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99498E00CAE; Wed, 23 Aug 2017 14:43:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.83.67 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.67 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (christopher.w.clark[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39D06E00C01
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 14:43:50 -0700 (PDT)
Received: by mail-pg0-f67.google.com with SMTP id w27so883184pge.4
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 14:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gVfVPjT3z5OvTjTwpdDF5cu23mF+2s8XArXU2Uy/RBI=;
	b=eThujQHTxMMtDVlh2IzapL8vP8L3P47LOiVGe+IP6is2xXvzZV88+vypFVJ6KsabLz
	hp2yvvV3X/rxn0q9ILKjtRqtAiW1a5X+shhOdVdA2le4ZkJWN4sSASYVCi+YWTdugzR3
	EqEfOLSIEZ6ORqvy7EnnNaASqGCK5tCMM65lVH3TLF3y8yy2Rtb0XoF6ywzW2zVRgrTc
	REmT0E8NvgTV502j8dxZbV39IwLtq6reKu3NY3Hx1fxF8PVaEj+N3lAHd32z5K5fWTXE
	9eTCNPuM6CGsVzJESo2U6pEcUa4EChsPS4E+aRxtNXWvvUbCA6I72KHREiBUWjC27GwJ
	WfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gVfVPjT3z5OvTjTwpdDF5cu23mF+2s8XArXU2Uy/RBI=;
	b=T/YTB5L00PkcfZjvOgQBWvsOoP2CiymKpWGZeGuc0QSjoH7IfxSFd+7iTvsgs9vIW7
	V9pfNz6Fbsfx1+96MkBGz6aHOodVSf2nr3OG67zmEaIT0RvTnUWjfxSn/doHU6yUXoGu
	8aSiKlOVN9R8dStZyZsYLXDMpllaKaCvXFn5p3ooQ/qrngol+slu9A6tMPdTa5YCxtvT
	fK7GnYJk/cLiWaHTPuIWVgSiV6Yqd51LcXikv1w5tbuKLAs+LFnE0C3imscv5VLkcUBc
	nwub7+X9vTeSD/TGMjts6Ljtn8oeBvjBoAOX+nrtlOttVRVLKI6qdecR6a9WIGtDzS5t
	RiWg==
X-Gm-Message-State: AHYfb5jFInFoySRjQ24qMvQTaRLBTZODjNlroHlK3y8+dRs4ZxOMrZ8a
	NR5OLoyadXa1zVQ4fPA=
X-Received: by 10.98.14.91 with SMTP id w88mr4358310pfi.306.1503524629844;
	Wed, 23 Aug 2017 14:43:49 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id j1sm4221243pgs.77.2017.08.23.14.43.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Aug 2017 14:43:49 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Wed, 23 Aug 2017 14:43:33 -0700
Message-Id: <1503524615-27663-3-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503524615-27663-1-git-send-email-christopher.w.clark@gmail.com>
References: <1503524615-27663-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH v2 2/4] ipxe: fetch using https rather than git protocol
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
X-List-Received-Date: Wed, 23 Aug 2017 21:43:50 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

The git protocol isn't responding at the ipxe fetch source;
https is, so use that instead.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
v2: unchanged

 recipes-extended/ipxe/ipxe_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/ipxe_git.bb
index d52c567..c0c8a7b 100644
--- a/recipes-extended/ipxe/ipxe_git.bb
+++ b/recipes-extended/ipxe/ipxe_git.bb
@@ -8,7 +8,7 @@ SRCREV = "8c43891db4eb131d019360ccfb619f235b17eb58"
 PV = "gitr${SRCPV}"
 PR = "r0"
 
-SRC_URI = "git://git.ipxe.org/ipxe.git;protocol=git"
+SRC_URI = "git://git.ipxe.org/ipxe.git;protocol=https"
 
 FILES_${PN} = "/usr/share/firmware/*.rom"
 
-- 
2.1.4


