Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33407E00C65; Thu, 12 Oct 2017 09:50:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.53 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.53 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4822DE00C82
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 09:50:30 -0700 (PDT)
Received: by mail-wm0-f53.google.com with SMTP id i124so15029911wmf.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 09:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=l9zwn+qIqlfMentC5UpLfE+1swv5VoVgw2x17S+z0ts=;
	b=Af7oXyMr86175I6mtLrircCVM0TVSdrtNl29NjC9biK1D4EMY5FVLPha8wMd6+pzZt
	Uer80K4q1YFDJi6yXSoqNCKbzKtuUO78lajdPZM2vzJ8zLudbitMJ523yS77BUUOuUMH
	9Y4CanmGxqDOFNIJpDhk8q+R1vJpmSiNniYkzsn2IMxNhQl70whzTG63C6LXwUvY6g3E
	K8Wh/vF+7jVMct6FBZW/26X1zSDycbWbkxUz1J5IVCl+H7Z1BBcwqsEUPxhEIvpGoHvY
	KHAz95Odw/JtGgKkVM3vhVzZVo8Bn3NJhrQ66DwiBS3bVk/dsu8rniUzKtGe5GGFrs+s
	U91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=l9zwn+qIqlfMentC5UpLfE+1swv5VoVgw2x17S+z0ts=;
	b=ZxQQqiS30Qo2VAt24H/OLWxoIceeWdIJ3vwsRPUiuQUqfAEGE/2okAQb6u0UtRCKLo
	jMzMz0VOsEkf8HQH8Jloq7EWEmXqmgT0pkJdXODWzG94ttAmUALa9Yh+29mnXK/H4Gff
	ceT5QV5wVipw46uY5NCsRJxnjmLE4Z1d4d/Z7lqmREv5KVy8q0wTUwGpkfPyFgBHjqJe
	YgX0wjNq976MfdG4gn0QxUiPuedh9ThEM3noBUy9jq2dREMxcws7DnINP8wwPYeLqVdO
	JvYzkQUnDweghVZ2BTJ6OOiIIvfaVVP1RoehsI0NxybuhxzhxivcgIqllnP7Ku0hQjGB
	zyfg==
X-Gm-Message-State: AMCzsaUu9xypBKaZl9QwivTfjlddtzXLD5faqMxzKzerbm9kptVl+Vds
	QMKXEfdCAcewjOXHo7R94zqZOeP3
X-Google-Smtp-Source: AOwi7QC2nDrJD9XFHh6zN0Ri7zH05dRZvIXrV1p79WRF/IpNtwG45rUO1/9H1eMoWDreFlcUGqb4IA==
X-Received: by 10.223.173.175 with SMTP id w44mr2849224wrc.19.1507827030042;
	Thu, 12 Oct 2017 09:50:30 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id
	h201sm756969wmd.27.2017.10.12.09.50.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Oct 2017 09:50:29 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 12 Oct 2017 16:49:55 +0000
Message-Id: <1507826997-28383-3-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507826997-28383-1-git-send-email-pbarker@toganlabs.com>
References: <1507826997-28383-1-git-send-email-pbarker@toganlabs.com>
Subject: [PATCH 2/4] sanity-meta-virt: Watch for SanityCheck event
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
X-List-Received-Date: Thu, 12 Oct 2017 16:50:34 -0000

The ConfigParsed event is raised multiple times during a build which resulted
in the sanity warning appearing up to 4 times per build. Instead we should be
watching for the SanityCheck event (this is what the sanity checks in oe-core
watch for).

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 classes/sanity-meta-virt.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/sanity-meta-virt.bbclass b/classes/sanity-meta-virt.bbclass
index 417ab6f..b4ed082 100644
--- a/classes/sanity-meta-virt.bbclass
+++ b/classes/sanity-meta-virt.bbclass
@@ -1,5 +1,5 @@
 addhandler virt_bbappend_distrocheck
-virt_bbappend_distrocheck[eventmask] = "bb.event.ConfigParsed"
+virt_bbappend_distrocheck[eventmask] = "bb.event.SanityCheck"
 python virt_bbappend_distrocheck() {
     skip_check = e.data.getVar('SKIP_META_VIRT_SANITY_CHECK') == "1"
     if 'virtualization' not in e.data.getVar('DISTRO_FEATURES').split() and not skip_check:
-- 
2.7.4


