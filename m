Return-Path: <jpuhlman@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2690CE0110C; Fri,  6 Jul 2018 14:25:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.218.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B814BE010E4
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Jul 2018 14:25:37 -0700 (PDT)
Received: by mail-oi0-f54.google.com with SMTP id r16-v6so25950033oie.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 06 Jul 2018 14:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CuOFd3sepgaxlQGd5zIhB1t9YZAJian4IXPLb4gNIqI=;
	b=vG8aZeWlFV2n8/gwK8A7WaXYYqbBy+av+0484jkFWW8jmIZSkQbnJbdCaCDav6xVHD
	DNPpqI94LM4tSQS0JmhXDw/hPRYvSvUprxnj+8rHlzj8l6OIR2F0KPT7A5n89tmThbQR
	C2uQTZJEv1igThhydRSsQUU7C02Qd4G15M/rQH0uE9z0TNVYQW/21HkVzOfjwk/fTqKs
	LrYG/arN0kohf4Zq+baqB2pE0Af1HBiW4ERTEeJf4U5TKs+VkppxSA1uwDPlW2XXo0yx
	g0IaNx89QdL8iogmT0oRLD/OCfXCJ/caNKoK/uj8q8TKZvltBPju2tBwip8RO0gE1atp
	8jiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CuOFd3sepgaxlQGd5zIhB1t9YZAJian4IXPLb4gNIqI=;
	b=DNlSWM5xanb/NxMOtw+bpaT7GxsHTo7+VcSQoqv1k7+F8cDqhHp9VXWX3D1fCbOp6T
	9+optsqDLXBMdZ7/1yqOkVmFaXNMa8BRK/OEkK10FSaFqfDUaskji9Y0OdcJjMhm0hcT
	vdDZIW7BMYAc7KW54f/l4vtH0pJQtbyUI6oAzSShvR+eRJx25ICnMUW5XGhsbIQNMk11
	WL3bGCzH5F1SOfsaeKrOFMRcMTYBGSC9Qwo4F7yaQfXTwW2e1EDP8KCX1JEPt+nyfNxo
	3p7zERmGnFzzY0BUt1IJqeh+FUaNu5qJZpW8HTRzdgFYpUCNl4A1YKcTDJvE29sLjblL
	FkLg==
X-Gm-Message-State: APt69E2ze5XjX45963FofJGs9B7YqwPP8i/gz2mA++09aXSQ0k1yr+Au
	A2PzwcYLcxvEq/8SK0PygQwOJK1BrHo=
X-Google-Smtp-Source: AAOMgpcGjWMyDvMaxheTfXhqNLSU0OSa2/lzqrsDSsPpERI4INylfDSUXP3jD0kQJNzCXjX+xtcB6Q==
X-Received: by 2002:aca:b455:: with SMTP id
	d82-v6mr12631682oif.234.1530912336842; 
	Fri, 06 Jul 2018 14:25:36 -0700 (PDT)
Received: from jptest02.mvista.com (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	d8-v6sm8820944oif.39.2018.07.06.14.25.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jul 2018 14:25:36 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  6 Jul 2018 14:23:20 -0700
Message-Id: <20180706212320.6023-2-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <20180706212320.6023-1-jpuhlman@mvista.com>
References: <20180706212320.6023-1-jpuhlman@mvista.com>
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [m-c-s][PATCH 2/2] libvirt: Update bbappend to match latest version
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
X-List-Received-Date: Fri, 06 Jul 2018 21:25:41 -0000

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 .../libvirt/{libvirt_1.%.bbappend => libvirt_4.%.bbappend}                | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-openstack/recipes-extended/libvirt/{libvirt_1.%.bbappend => libvirt_4.%.bbappend} (100%)

diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend b/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
similarity index 100%
rename from meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend
rename to meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
-- 
2.11.1


