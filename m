Return-Path: <akuster@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 824B0E00978; Fri, 15 Jan 2016 13:31:51 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.192.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AEC9BE00928
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Jan 2016 13:31:50 -0800 (PST)
Received: by mail-pf0-f175.google.com with SMTP id n128so123533353pfn.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Jan 2016 13:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=9xwm8uSfkdlBuRQNelQ3egXlXAn3XyC5bSwTRvzXpE0=;
	b=cuHr+rvbxvm9skU86zKNpZOAsMSrLo1/t/lAR80vSJBl6ItgwUdL68jHNVVkM5CfVh
	zXyXOm+p6oQWbMbodeU61p3xa5J2/6C4i3e/JgLwDC1Z9ljyPGcd8eMrZkSXViowh9/Z
	4L7H1votYr7SRHIX1N2YiJcOcBzKKIgPD56pfl31I7yF93ErY4p65tabaxbGjo9jCm9M
	nGUEOP/CFprnkk2qMiiMnuN5YTu/ksZMWnbos5lridafc67W19LX7Jvbe+yBaufK6uN3
	wrUYmxqi7WbZuLdQN+8zk/pCXVmzwy3Jp2IQhdJUcx7McU3kkGCHiusgDeZ1Q2s6L4ee
	TpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=9xwm8uSfkdlBuRQNelQ3egXlXAn3XyC5bSwTRvzXpE0=;
	b=P85bGNT7U7TKN7XqhyZLDZqhRqRmqX9do+779BK+eQP4zs/GZb63Nf9yCXxfsycSYv
	0NuVHaq5GpIvTNiJXh02vHUNekd3BRlohZYJKAlkyrFtOXUqXoyyNKggBS2UrP9ZSX7M
	xED6tqs3xwQGr3FiHacHngYnsaG/sQdAs6LVTBGp1EkVbjBA8eekiKY2mm8om2BRKvMy
	MYPsKzfFPYlrouceWbMgekTm/EHTJcvaM7dNqP7B9zqOC0fMa7qpDeavo93yvtvsFM6U
	nJyCoqRHKKa8Y3euylZtF+p8q9kt7QGbTSC3mQ4OR1nmeNuRakSSpLBnjTsjaPkkaZDg
	M6mQ==
X-Gm-Message-State: ALoCoQnCluRoiK8aXXnzAN5xogKn4d4t2Uwsm7/aIXyJD78RvhafrZe5xO9YmNzTw0HWslxJhTvSaQlpcIS2PnXsmT8ofs/LRQ==
X-Received: by 10.98.87.20 with SMTP id l20mr18110937pfb.70.1452893510043;
	Fri, 15 Jan 2016 13:31:50 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:c87d:914e:5b9d:f901?
	([2601:202:4000:1239:c87d:914e:5b9d:f901])
	by smtp.googlemail.com with ESMTPSA id
	yl1sm17453937pac.35.2016.01.15.13.31.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jan 2016 13:31:48 -0800 (PST)
To: "M. Gregory" <mbgrego@tycho.nsa.gov>, meta-virtualization@yoctoproject.org
References: <569962FB.8070601@tycho.nsa.gov>
From: akuster <akuster@mvista.com>
Message-ID: <56996543.9070709@mvista.com>
Date: Fri, 15 Jan 2016 13:31:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <569962FB.8070601@tycho.nsa.gov>
Subject: Re: Error building xen-image-minimal
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
X-List-Received-Date: Fri, 15 Jan 2016 21:31:51 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Machon,


On 01/15/2016 01:22 PM, M. Gregory wrote:
> I am still new to openembedded and I have not encountered the error
> below before. It is occurring when building the xen-image-minimal
> recipe. I added {PN}-devd, which contains xendriverdomain, to the
> PACKAGE variable which solved the problem. Is that the correct solution?
> -Machon

You might need to add something like:

FILES_${PN}-devd += "${sysconfdir}/init.d/xendriverdomain"

regards,
Armin

> ERROR: QA Issue: xen: Files/directories were installed but not shipped
> in any package:
>   /etc/init.d/xendriverdomain
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within do_install.
> xen: 1 installed and not shipped files. [installed-vs-shipped]
> ERROR: Fatal QA errors found, failing task.
> ERROR: Function failed: do_package
> ERROR: Logfile of failure stored in:
> /home/mbgrego/work/yocto/poky/build/tmp/work/core2-64-poky-linux/xen/4.6.0-r0/temp/log.do_package.3354
> ERROR: Task 337
> (/home/mbgrego/work/yocto/poky/meta-virtualization/recipes-extended/xen/xen_4.6.0.bb,
> do_package) failed with exit code '1'
> 

