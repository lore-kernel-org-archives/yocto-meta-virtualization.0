Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70E73E01725
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Oct 2013 03:31:48 -0700 (PDT)
Received: by mail-wi0-f178.google.com with SMTP id hn9so3729211wib.5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Oct 2013 03:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=n+K2hhlSyHMq3ZouA2atOOKiYVfKBi0QAtqi4pwLHxA=;
	b=VOnjSs1DKEU9pVhSh5Sk0TxojH+rKeHY6Z3uP1Ftl6uj3MGJhK/DNb4LL+/SW4BdBM
	4daeuZGw3yhEIPfsFH5+Lj4Z6O3odoYJXoa//m6x6DrGxtglBqcsJ64RuFskxs7D6fwd
	eENJvmq8HwWbIo1Rw17LFuM7mgxge02SyiS7b0hIk5bsOtRF5XFJ0z6h8b2Z88uakkfg
	zOG+j2YCPGAWEl89OAzhAkjK89E2gZpu4K1oqdmw1aF7Bgzhu9h06nHwNrzP36UN5M93
	RFIJbk8wvrMBrDGhix2Oh6f8Ob1EAq41p5euzovkuUv87iq7pUiTg9oySCNCAqh+4eoj
	HOMw==
X-Received: by 10.180.13.174 with SMTP id i14mr9226962wic.49.1382351507688;
	Mon, 21 Oct 2013 03:31:47 -0700 (PDT)
Received: from [172.22.81.31] (ed03490-ge-0-0-0.mgdfwr.lumison.net.
	[212.20.242.100]) by mx.google.com with ESMTPSA id
	gg20sm53234410wic.1.2013.10.21.03.31.46 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Oct 2013 03:31:47 -0700 (PDT)
Message-ID: <5265028F.40506@gmail.com>
Date: Mon, 21 Oct 2013 12:31:43 +0200
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: =?UTF-8?B?Sm9uYXRhbiBQw6Vsc3Nvbg==?= <jonatan.palsson@pelagicore.com>, 
	meta-virtualization@yoctoproject.org
References: <CABYQY==EU9m2OV1LEi2NP6xqed2q0dVb9YnGkZyj20UE9E-5Jw@mail.gmail.com>
In-Reply-To: <CABYQY==EU9m2OV1LEi2NP6xqed2q0dVb9YnGkZyj20UE9E-5Jw@mail.gmail.com>
Subject: Re: PATCH: Fix URL for LXC tarball
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
X-List-Received-Date: Mon, 21 Oct 2013 10:31:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/21/2013 08:37 AM, Jonatan Pålsson wrote:
> Hello,
>
> See the following patch for the correct URL.
>

Hej Jonathan,

That new URL seems to fail for me.

$ wget http://lxc.sourceforge.net/downloads/lxc-0.9.0.tar.gz
--2013-10-21 12:26:35-- 
http://lxc.sourceforge.net/downloads/lxc-0.9.0.tar.gz
Resolving lxc.sourceforge.net (lxc.sourceforge.net)... 216.34.181.96
Connecting to lxc.sourceforge.net 
(lxc.sourceforge.net)|216.34.181.96|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2013-10-21 12:26:35 ERROR 404: Not Found.


The old URL issued a redirect, to an URL which now is 404:ed
wget http://lxc.sourceforge.net/download/lxc/lxc-0.9.0.tar.gz
--2013-10-21 12:24:30-- 
http://lxc.sourceforge.net/download/lxc/lxc-0.9.0.tar.gz
Resolving lxc.sourceforge.net (lxc.sourceforge.net)... 216.34.181.96
Connecting to lxc.sourceforge.net 
(lxc.sourceforge.net)|216.34.181.96|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: http://linuxcontainers.org/downloads/lxc/lxc-0.9.0.tar.gz 
[following]
--2013-10-21 12:24:30-- 
http://linuxcontainers.org/downloads/lxc/lxc-0.9.0.tar.gz
Resolving linuxcontainers.org (linuxcontainers.org)... 204.232.175.78
Connecting to linuxcontainers.org 
(linuxcontainers.org)|204.232.175.78|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2013-10-21 12:24:30 ERROR 404: Not Found.

I suppose you meant to add URL, which seems to be working.
wget http://linuxcontainers.org/downloads/lxc-0.9.0.tar.gz

Please correct the URL, and use git send-email to send further patches.

Br,
David



>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>


