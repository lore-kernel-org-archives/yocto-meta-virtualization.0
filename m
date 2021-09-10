Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web10.6639.1631265667260396019
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Sep 2021 02:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=ayQ1sCjB;
 spf=pass (domain: pbarker.dev, ip: 64.147.123.19, mailfrom: paul@pbarker.dev)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 003FC3200302
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Sep 2021 05:21:01 -0400 (EDT)
Received: from imap42 ([10.202.2.92])
  by compute4.internal (MEProxy); Fri, 10 Sep 2021 05:21:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm1; bh=zXp1N4ly1pitBe/40M+XeeE79ELYmHr
	DAFNMSMMjnF4=; b=ayQ1sCjBY+Uyd2nFbKVZz3Y9p5WCMUoKoOwtvzbeYhGFm8S
	VmS5Lb1jSehVkAg0SLB6HMdGQEbfUmmygizku3wij+tzXOBGBtgp6vincHSXCRum
	5yZ07QzAPXDW47gE5Wv1PFr4mDYvkOrafemTc1dyssLBghHM5REYJeL9ZeIpn+qY
	iAxRzCKL7TBxRsSwHNsmtjH+KaUAia/D10EwU+/8Fz4eXIuWc0AotNC84PJbIKpg
	TnFLvnyciZT+HebHh+b4JpHP6BLUgF0EUbIcT2CRJ0+333JzjFf22X/7M4Yo0Mwx
	42Mn4UyxhpMVl8bvZGWfvP65kH1OkiO7yBrLgVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zXp1N4
	ly1pitBe/40M+XeeE79ELYmHrDAFNMSMMjnF4=; b=PaseRmpnuiLslc61kCAR1y
	ZeLmxUW/mPxpdxcvp8PaxwFCuLtFGgYdTupPc3BsSf7Gi3G5sjwzfPmyjEh+ztZL
	FQ+LQ5ZWA6rwX+l5gxMME4JGEOzFnmroIjC8hlCFExXA/JaG04VrwFzEwdTeCCA3
	NBHE56mUzuM5SMZXmTDAqJ9+mCkFiSJXxtXsg6hEvBhBuO1ZIHADQzG9kkLsMum6
	1CAwFm5AF98ySj4NKFHXJaclXFURk2tmrkOFCnIVabE0o7WwY6GnIbDpJHoN5rmr
	u9Suc7JCFBbXPoTynHOXlvuOPtqvDDcOJV7x8MLlf12ubflLGIQDUcYe4Spcb8rg
	==
X-ME-Sender: <xms:fSM7YRpkLd2XNEwxeB1qp5Wfnh55cEsxDpiNtcoX1QuHq5KtYNFAXQ>
    <xme:fSM7YToXMRA8jYdHI0EMfFf3LMnxQ3l9FmeCASqr45-a19kyQ9VwLtGtrb6mYSPXh
    iFfD4iDDCpjPUtnTDE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderreejnecuhfhrohhmpedfrfgruhhluceurghrkhgvrhdfuceophgruhhlsehpsggr
    rhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpeeigfejvddtvdeuteevgfffteetke
    efgffgveegteeufeduhfdufeefffevgfeivdenucffohhmrghinhepphgsrghrkhgvrhdr
    uggvvhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:fSM7YeNXnaxdfr-PogmOf-zk7rHI-o4p1nRW-RRXCR7aiGjhzvabog>
    <xmx:fSM7Yc7JGwCTRzj2miXn6_SpV8vdg4T_8p96pV9_C2TDDSzrdOYn9A>
    <xmx:fSM7YQ7FT-1Vwn4oY6IMJ7RdM7gHhKKOnLXpuFabmghYQc_zZ81hTw>
    <xmx:fSM7YSF4GN549vNVkAnTJFRjW-iCq6DpVJrIprb0blYIj_-EKQRGQA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 178B2218006E; Fri, 10 Sep 2021 05:21:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1229-g7ca81dfce5-fm-20210908.005-g7ca81dfc
Mime-Version: 1.0
Message-Id: <d2e925ff-e04b-45c0-a5fc-7fcec9d2118c@www.fastmail.com>
In-Reply-To: <1631262707367.2520628917.514655614@optimcloud.com>
References: <729c3f470eb64e3a8832e3e70c8da768@axis.com>
 <1631262707367.2520628917.514655614@optimcloud.com>
Date: Fri, 10 Sep 2021 10:20:04 +0100
From: "Paul Barker" <paul@pbarker.dev>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] thoughts on k3s and supporting builds of more than one k8s version
Content-Type: text/plain

On Fri, 10 Sep 2021, at 09:34, Yocto wrote:
> 

Please don't use "Yocto" as your name on this list, it may come across to folks who are new to our community as if you're speaking for the project.

-- 
Paul Barker
https://pbarker.dev/
