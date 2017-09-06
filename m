Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3CE0CE00D81; Wed,  6 Sep 2017 16:09:15 -0700 (PDT)
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
	*      [74.125.83.47 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.47 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CDCABE00BB7
	for <meta-virtualization@yoctoproject.org>;
	Wed,  6 Sep 2017 16:09:14 -0700 (PDT)
Received: by mail-pg0-f47.google.com with SMTP id t3so17814196pgt.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 06 Sep 2017 16:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=KsIHUZPhfE30MSNIV3c3chXl+/5SMBQz/+Ogn1x9PSk=;
	b=Tm3A452IXOqraqv4mfjrJX/WvHyO9850ORHRqb/A6NLLzUlT2jRoOubDsLtXnGVskF
	2hURjOX5GDa+1fvQNUfdWN9rvrpO2ox+7v3dQAaoZKuCqo0Ua1lUEFsEEVQHHdxrHQeb
	J8Mfpa4y4toDgAZnbhbMtt4csM2Z6AqITx4AFVqTDM33D1FOZ7m3FPeRM2tWqlgiAtVB
	RKYfNoop5rvo7BWteHPmOceXWi/bjpG4XdGqH7DwW8DD6GU8pLoRvD4lcuQCRcZRaFXG
	O7b17ehV9BCRhiQU+chYfj+xIW7IU8QIxdIO3/1WlfIy3E/u8llPsWhtf3MAz983weaZ
	kp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KsIHUZPhfE30MSNIV3c3chXl+/5SMBQz/+Ogn1x9PSk=;
	b=mt2LXCEf6YBHmYEDE+H1RwurQGOLy+1fKLe0MWtWiFWXzLu2zBvD+1ddeFqiklz8Lj
	po3TgNQjKBYT6MBMszsRqkO8DDfDFPsq9eyM2XwbvRNq/bs0pmmgZntSCaVlIFYCU+sX
	HZS8Bap1Ugp7qBZpLaxZ9cSVZhyz87d/NUOiI+CyD+dNn7uE6kcmXIc+5K/THmmZ7ZKo
	quluuo+r3ktgzaY6E1akVEamKYEK+Xv1pdq3+nHvWaabWlzO5EKglc1Uwy+BpoDpArRO
	xB/o6DAuxZNPKcwhZNBWVIsBbqToPymkiU9YbMlHYFzb28B7ocgJD5SRMMptQnoQcfH+
	8iZw==
X-Gm-Message-State: AHPjjUiNiCh+45cq0FhGun31Km4+UM/YY1J2pR8s3G3PRvNC138HV/fy
	eHL32OO4ejvOjZyql4U=
X-Google-Smtp-Source: ADKCNb6bNUXU2QVccXIuQApGr7Ita32uhLCM8qeCNg1bQvr+ip6XxgA8UojlWamX6hCJ1HAwarJ8cg==
X-Received: by 10.99.126.23 with SMTP id z23mr760482pgc.156.1504739353886;
	Wed, 06 Sep 2017 16:09:13 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	i186sm1030487pfg.84.2017.09.06.16.09.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Sep 2017 16:09:13 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Wed,  6 Sep 2017 16:09:00 -0700
Message-Id: <1504739341-28234-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: cardoe@gentoo.org, nathan.studer@dornerworks.com
Subject: RFC [PATCH] fix non-x86 xen-guest-image-minimal
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
X-List-Received-Date: Wed, 06 Sep 2017 23:09:15 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

This RFC patch aims to fix xen-guest-image-minimal for non-x86 builds,
whilst preserving compatibility with x86.

x11 package inclusion is optional for both x86 and non-x86.

Re: May 2017 thread:
"[meta-virtualization] [meta-xilinx] Trying to build xen-guest-image-minimal"
https://lists.yoctoproject.org/pipermail/meta-virtualization/2017-May/002556.html

Feedback would be appreciated, especially on:

1) Whether this addresses the needs of meta-xzd, enabling replacement of
   xzd-domu-image-minimal.bb with a bbappend of this recipe.

2) The correctness of aspects of the patch:

* It switches to use IMAGE_FEATURES rather than DISTRO_FEATURES for
  specifying the inclusion of x11 packages in the image; this seems more
  correct for an image recipe.
  DISTRO_FEATURES appears to default to x11 enabled, IMAGE_FEATURES does not.

* It introduces a bbappend for xserver-xorg to modify the default
  Xserver configuration for non-x86 builds where DISTRO_FEATURES
  includes 'xen', to drop dependencies on egl. In build tests, this has
  simplified satisfying dependencies for building x11 for domU.

* Compatibility with Xilinx hardware profiles and software layers.
  I have not verified this. I have build tested x86 with
  MACHINE=genericx86-64 and ARM with MACHINE=cubietruck, using meta-sunxi.

Thanks for your interest and attention.

Christopher Clark (1):
  xen-guest-image-minimal: Fix non-x86. Select x11 via IMAGE_FEATURES.

 recipes-extended/images/xen-guest-image-minimal.bb    | 16 +++++++++++++---
 recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend | 14 ++++++++++++++
 2 files changed, 27 insertions(+), 3 deletions(-)
 create mode 100644 recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend

-- 
2.7.4


