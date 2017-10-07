Return-Path: <dariusz.pelowski@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 32FDCE00C82; Sat,  7 Oct 2017 10:53:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (dariusz.pelowski[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.66 listed in dnsbl.sorbs.net]
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B45EE008A4
	for <meta-virtualization@yoctoproject.org>;
	Sat,  7 Oct 2017 10:53:11 -0700 (PDT)
Received: by mail-lf0-f66.google.com with SMTP id b127so23375468lfe.9
	for <meta-virtualization@yoctoproject.org>;
	Sat, 07 Oct 2017 10:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=vt/hfT/UKqUom5SFnl44cLE0b2B5cOXexASXHnlviZA=;
	b=H5UfwzRRdRVeP2jhzRtK3Iab8znyJJC9/xngQ6Sd1R9muxsjJnF6kbueLGZCxoduqB
	i8fLzjfPOASV6P1FKGSBPwQmy4ZVyzagSzU+a1xTFdCTVjSen3UivK7oMW+uUEvayw2J
	AiCAQu37v4u11pPI3ANtEFx+SmR1r7GIhINxBW61Ym7N65He6/kRx3z16lCP8jSZRhF2
	rJuhcAqBoRJ06WsNK3yEjQ/uS2uiTY3lZQIZfVw3t3m2mJcqbjnJ9PHgZq6XOO8Vdoh6
	Tg4cLebA8cW05EN1qQgssTczNzRdrheh7GGlPgg0hov5IK0f4rfRCg4CTcLKAxOfNigb
	uM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vt/hfT/UKqUom5SFnl44cLE0b2B5cOXexASXHnlviZA=;
	b=WOuY2m0dtAp+gf3dFgouJiWMOYLQHZYU35qKF12qFQbFUJ6hy5S8+U9eP46RVvPump
	5EEn3XO9R9Bx/5aMEJX8koOQOiFUx1K9wF9Y4bh3B/mGsCF/fo2bnpI7VS2SoWTnw1r6
	QSvwkd9mrw7PZAH55XnD8LGW8BHFhqxHUIE5RSY1BNvkUfgerazQyVjmJR3kP4zZxFNC
	ciyMmQdLpoJKbd6SrxuwAymKzZ3civjmL/gy/+nvpqEbFzkaIHerb5ILgbWGeU8DK0Yn
	Y+ksIhcBrtOsZ4XA+g2mXDKDz9nKpv7dSuNiS5Y/5SwVWPbz9P18FKw7eS4EoS2BCs2Y
	w5Xg==
X-Gm-Message-State: AMCzsaU3Rb9kXbQOsunzTPPhRa8cT6Oa4n0aJWx4oqb6rGz1slXJPast
	fjChRAZovMGPuCR3tbe4o/js+Pff
X-Google-Smtp-Source: AOwi7QCp4F9Acqc7V68CDnzc70/rA9H7Z5q0o49+TvyX8kEst4plF57VvEV6CS1WZGd2Wpv8KHyJ/Q==
X-Received: by 10.25.234.195 with SMTP id y64mr2046170lfi.36.1507398789875;
	Sat, 07 Oct 2017 10:53:09 -0700 (PDT)
Received: from localhost.localdomain (user-5-173-14-53.play-internet.pl.
	[5.173.14.53])
	by smtp.gmail.com with ESMTPSA id f1sm978015ljf.62.2017.10.07.10.53.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Oct 2017 10:53:08 -0700 (PDT)
From: Dariusz Pelowski <dariusz.pelowski@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Sat,  7 Oct 2017 19:52:35 +0200
Message-Id: <1507398755-15398-1-git-send-email-dariusz.pelowski@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] xen-image-minimal: corrected popoulation xen.gz for syslinux
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
X-List-Received-Date: Sat, 07 Oct 2017 17:53:12 -0000

syslinux images cannot boot because they're missing of xen.gz
file. Current poky doesn't use populate() function, instead
syslinux_populate() can be used.

Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
---
 recipes-extended/images/xen-image-minimal.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index 827cc87..c39d378 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -47,7 +47,7 @@ grubefi_populate_append() {
 	install -m 0644 ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz ${DEST}${EFIDIR}/xen.gz
 }
 
-populate_append() {
+syslinux_populate_append() {
 	install -m 0644 ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz ${DEST}/xen.gz
 }
 
-- 
2.7.4


