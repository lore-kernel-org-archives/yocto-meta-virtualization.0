Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 76A05E00D06; Thu, 12 Oct 2017 09:50:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.54 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.54 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58666E00C65
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 09:50:29 -0700 (PDT)
Received: by mail-wm0-f54.google.com with SMTP id k4so15060421wmc.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 09:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8YtnRckWQqwkN7Bz/nA4f/GbqvMdVXR5EzzzBAwJkTg=;
	b=c3Fx5auOplpdUa3xJGNLKzr3RQPKZF4Vo/ubx9EFtKKo7o+10HVE6ovLI0SMWOH1Sa
	ZCDGilEUEaRxtgWQtGmMCb6+8PynJ2OgKQaQ21Sk/W4t+7eGmA/2UUnLI4tLki3EGToL
	N5l7c9+sS/fACtkM3K6OPy+njeRCDLR99rMhDT1znZe2YTelQCOv1YrkuqySUMpK4O5J
	NyC/mv+3OJDJ8OTcrc0hP14I+Kg2Ih/OSdOjrs4stJQKKKKVnw6ng0mDymFvX/qt5rVx
	DwDGYPaCAXBLfnQrg9IBBenXtnl62DktPhrjCrZdd5YMOWddzj3hL0I9PAchKw7nMw4X
	V/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8YtnRckWQqwkN7Bz/nA4f/GbqvMdVXR5EzzzBAwJkTg=;
	b=ALC3a16If1+aKJ6X5RKglCR1BYd715vNJMvcfgbo9PklbdqcNOgJcDExSKAtor9kvW
	GHM0P5FTVSQhwKyjSTPHcGlYLqyYc35HytBQO3phW0DWub2yc0NzGy+/8U1OuVS9gTe2
	8d2gYTrfflaAJZzICg9VX5qjg4OdEdl+PVO5vumFmqn2dWJJ/xGE+WR4ok510ZfpbUUc
	q5S4wgG21Pk2VRzyzw8vkehtptvZrw4y3jwBkWG0B8cFveSEav1Al9VFk8I/BITs6aQB
	1XW7SJps4A4kiN3KtD+rFGyDzRTVOVPlF3DClIKk0vrNivVq5QptSTALL8eyUquZ+prR
	VC6A==
X-Gm-Message-State: AMCzsaWkq3Qtap9IDSk/VswPzYf+t84UeFKd54764isC33EEdepWgX4n
	Hjwimk1ONoAz8lAAjzMYlayWYfnb
X-Google-Smtp-Source: AOwi7QCE0Orl7SEgnv5GR9ObdER0tXWiAB/J2NEQxYo9X2OWR4VainjeMLg+H8afDsRt7bMYz/yXEA==
X-Received: by 10.223.155.203 with SMTP id e11mr2519622wrc.104.1507827029131; 
	Thu, 12 Oct 2017 09:50:29 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id
	h201sm756969wmd.27.2017.10.12.09.50.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Oct 2017 09:50:28 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 12 Oct 2017 16:49:54 +0000
Message-Id: <1507826997-28383-2-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507826997-28383-1-git-send-email-pbarker@toganlabs.com>
References: <1507826997-28383-1-git-send-email-pbarker@toganlabs.com>
Subject: [PATCH 1/4] sanity-meta-virt: Make skip variable name layer specific
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
X-List-Received-Date: Thu, 12 Oct 2017 16:50:32 -0000

The variable used to skip the sanity check should be named in a layer specific
way. This will ensure there is no confusion if other layers use a similar sanity
check.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 classes/sanity-meta-virt.bbclass | 2 +-
 conf/layer.conf                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/sanity-meta-virt.bbclass b/classes/sanity-meta-virt.bbclass
index bd2b717..417ab6f 100644
--- a/classes/sanity-meta-virt.bbclass
+++ b/classes/sanity-meta-virt.bbclass
@@ -1,7 +1,7 @@
 addhandler virt_bbappend_distrocheck
 virt_bbappend_distrocheck[eventmask] = "bb.event.ConfigParsed"
 python virt_bbappend_distrocheck() {
-    skip_check = e.data.getVar('SKIP_SANITY_BBAPPEND_CHECK') == "1"
+    skip_check = e.data.getVar('SKIP_META_VIRT_SANITY_CHECK') == "1"
     if 'virtualization' not in e.data.getVar('DISTRO_FEATURES').split() and not skip_check:
         bb.warn("You have included the meta-virtualization layer, but \
 'virtualization' has not been enabled in your DISTRO_FEATURES. Some bbappend files \
diff --git a/conf/layer.conf b/conf/layer.conf
index 51ca8ee..f71c117 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -24,5 +24,5 @@ PREFERRED_PROVIDER_virtual/runc ?= "runc-docker"
 PREFERRED_PROVIDER_virtual/containerd ?= "containerd-docker"
 
 # Sanity check for meta-virtualization layer.
-# Setting SKIP_SANITY_BBAPPEND_CHECK to "1" would skip the bbappend files check.
+# Setting SKIP_META_VIRT_SANITY_CHECK to "1" would skip the bbappend files check.
 INHERIT += "sanity-meta-virt"
-- 
2.7.4


