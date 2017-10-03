Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2FF87E00D53; Tue,  3 Oct 2017 12:04:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.83.65 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (christopher.w.clark[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.65 listed in dnsbl.sorbs.net]
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24B3EE00D48
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Oct 2017 12:03:37 -0700 (PDT)
Received: by mail-pg0-f65.google.com with SMTP id o1so9511271pga.4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Oct 2017 12:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9ZQ9U3fyKPejqHBrrB+hSQm51I9mj0H8gb2EEjc4xcM=;
	b=I3PMZtUnkPebiSipBDXKXXUOLYOc5rai4VbYZ5KHlswq8C/QFFb8LRyrnnXLyo6Y0k
	TqPYweqiTsfKwBmv+KiqQs4g0d/oBAqUuqdyKDXt2vLW6CqijZDMKhXGjYRekC4u71Zi
	sg+87O7ZW3AcGqZqN+Hsk8VZ6Ae6NSUWHqS1WT8On7VLFdLwUrEUjhn/zGGWixqwhJ44
	y2rL7ERz5NRR7EiKFFMK+Jh6wBWWTntt0mFH1mFQbAeUSVJGJJ8DiI/zficPIq20z2Cq
	T3owy/ApRFImU9t4DS6iDVcj5RDzOQCq55G/H4X4mZ/WrocargsQs26Ng5ggv332vB96
	ba9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9ZQ9U3fyKPejqHBrrB+hSQm51I9mj0H8gb2EEjc4xcM=;
	b=Cw7LI3sEt3TTdEPbn5oIldf+HNISAfScSOXrXpLyqT/0ljc+vEs5apUGK0NOJ+2UBy
	pItphJU9x2Q0R3uk4DCA+bKTKvU1Vrz8pxAE9Ez0RBPviiQBDZB8OPskwAhd8QmdKCg0
	jbHmbH9KMy79MnPeDtLEGnqzqMdgZo80EnjyI8biwDcPY/dG8bKmsv22jCzBbYBV9Fy4
	ihEsjFHqWfGewYUdaWcGedVnKYgvKiLTVrRegKpMb4fXTKzK42JW3eFhPSP4pK5McIT9
	D7mlb8TGu342dHK3A4mQSPi0pb6LqGIvaEbQJ7Ua6JbkpkvPWoppR+7IYGYlxtwoQOmc
	B05g==
X-Gm-Message-State: AHPjjUgLjM631cv4YrT5uzKkRBkXxwNxv7HBO5M172Ba4dIqeIinn8+L
	vvStFtJ+eI+EIKftRyz6geQc34+s
X-Google-Smtp-Source: AOwi7QBJ0VkQivUqbEKOTxCkR1tddbXqORw1duwpjkCvl1oMcsxkSzOH74na6PhJI1NqN3PFMItlAg==
X-Received: by 10.84.235.198 with SMTP id m6mr17580923plt.57.1507057416915;
	Tue, 03 Oct 2017 12:03:36 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	z126sm10651589pfz.70.2017.10.03.12.03.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Oct 2017 12:03:36 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Tue,  3 Oct 2017 12:03:26 -0700
Message-Id: <1507057406-19771-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: cardoe@gentoo.org
Subject: [PATCH] xen-guest-image-minimal: remove lines modifying DISTRO_FEATURES
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
X-List-Received-Date: Tue, 03 Oct 2017 19:04:02 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Remove recipe lines modifying DISTRO_FEATURES that were intended to
simplify the non-x86 x11 image dependencies, but did not.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
Reported-by: Mark Hatle <mark.hatle@windriver.com>
---

 recipes-extended/images/xen-guest-image-minimal.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/recipes-extended/images/xen-guest-image-minimal.bb b/recipes-extended/images/xen-guest-image-minimal.bb
index bca6017..d311eae 100644
--- a/recipes-extended/images/xen-guest-image-minimal.bb
+++ b/recipes-extended/images/xen-guest-image-minimal.bb
@@ -13,11 +13,6 @@ IMAGE_INSTALL += "${@bb.utils.contains('IMAGE_FEATURES', 'x11', ' xf86-video-fbd
 IMAGE_INSTALL_append_x86-64 = "${@bb.utils.contains('IMAGE_FEATURES', 'x11', ' xf86-video-vesa', '', d)}"
 IMAGE_INSTALL_append_x86    = "${@bb.utils.contains('IMAGE_FEATURES', 'x11', ' xf86-video-vesa', '', d)}"
 
-# When xf86-video-vesa is not present, add opengl and don't require wayland:
-DISTRO_FEATURES_append = "${@bb.utils.contains('IMAGE_FEATURES', 'x11', \
-                             bb.utils.contains('IMAGE_INSTALL', 'xf86-video-vesa', '', ' opengl', d), '', d)}"
-DISTRO_FEATURES_remove = "${@bb.utils.contains('IMAGE_INSTALL', 'xf86-video-vesa', '', 'wayland', d)}"
-
 REQUIRED_DISTRO_FEATURES += "${@bb.utils.contains('IMAGE_FEATURES', 'x11', ' x11', '', d)} xen"
 
 LICENSE = "MIT"
-- 
2.7.4


