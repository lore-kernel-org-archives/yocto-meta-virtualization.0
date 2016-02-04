Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 91708E00CC7; Thu,  4 Feb 2016 12:52:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 62F2EE00CC4
	for <meta-virtualization@yoctoproject.org>;
	Thu,  4 Feb 2016 12:52:24 -0800 (PST)
Received: by mail-io0-f177.google.com with SMTP id g73so107103221ioe.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 04 Feb 2016 12:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=onQdTP4lQ4iQ1zvKiIJvQ9hYOo7+rMRUsuFIQk0I3Ss=;
	b=Uu5gLd5XFzcbvhRgQ4xi5vvSAWko72mKi12Yvenof7ubqU5DSQwPrcA91Pj3Uec2q0
	LPbxnmt8X3sXeaVN5wUMhMAviP/HA/vDBvB/zsQcFGvWFvc7/QHhpWLD46f8iKTpxPae
	mi4uYUg9R0QaqnTaqGYZ8+pyaHDGPf/Mo9eiMkYoDfGn8C5+azc/t/jA0Wm3UQ/wbF8L
	8uGFHmKcrjt7z2IBGauI7Dx7l9qBFZAowsKqQWy3fJdMG7rJ9h3i9uiCYKpZW69rRoGE
	GKGE1gjCgawAO9NzyNKhDWlJWv+ex4/7jK4YAfIE5J6gDSQ2y9TA7k/+9YqQC5x/w1Mj
	472Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=onQdTP4lQ4iQ1zvKiIJvQ9hYOo7+rMRUsuFIQk0I3Ss=;
	b=ZQAiOny+MHqakI0wZtjmJMW8lIfTVtk4Jm10UUTydSf+lUwjEs2ak/j1cq2n/gKNTE
	s8NI6oOvP6pblwi8351aiphgj7mSXoxsO9SJCZqTSYS2moGZZHISc7UBnxWIMhESpYGo
	0AMwHT9xcPap0oAfgdFjtUwxuO5mKciSzsir8DnnnBQhNnZNq6+GW0mDNIIqIygz8m/v
	tseArIiBQEKRb/Q6qiKqR1O4muthYSDtHzw+skomupt2Bv96OoMuj5ub2yjkcyKqthEv
	ZFlkGgQ3IwCucKUomelapZ/z3XM+yOYg3wtCA6tAjC1Ns1rQOZ732PzCuqrmC9vlLrSL
	pkOw==
X-Gm-Message-State: AG10YOSrNFO3lJI1dRfx5IIFCGVftALAREa183PMlkAkmiJrRjFTwbNBcuL+fZkRe+QwuyIZHn7Uvh4/6QRUGw==
X-Received: by 10.107.33.14 with SMTP id h14mr10265630ioh.108.1454619144401;
	Thu, 04 Feb 2016 12:52:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.125.142 with HTTP; Thu, 4 Feb 2016 12:52:04 -0800 (PST)
In-Reply-To: <56B126BC.3070304@tycho.nsa.gov>
References: <56B10C90.8070709@tycho.nsa.gov> <56B126BC.3070304@tycho.nsa.gov>
From: Chris Patterson <cjp256@gmail.com>
Date: Thu, 4 Feb 2016 15:52:04 -0500
Message-ID: <CABZSBQd+vLUkLi-1MPYN9-frgOeUygDuZsDezQWmktiGhkACMQ@mail.gmail.com>
To: "M. Gregory" <mbgrego@tycho.nsa.gov>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: stubs-32.h not found
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
X-List-Received-Date: Thu, 04 Feb 2016 20:52:26 -0000
Content-Type: text/plain; charset=UTF-8

I repro'd this with a fresh tree.  Instead of the depends approach, I
simply moved the step between do_configure and do_compile, which
should be OK?

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 5555ed3..d35bc3f 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -782,7 +782,7 @@ do_stubs() {
     fi
 }

-addtask stubs after do_patch before do_configure
+addtask stubs after do_configure before do_compile

 do_configure() {

