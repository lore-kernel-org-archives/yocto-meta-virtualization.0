Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 72267E00595; Sat, 21 Jan 2017 19:51:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.194 listed in dnsbl.sorbs.net]
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C49B1E0043F
	for <meta-virtualization@yoctoproject.org>;
	Sat, 21 Jan 2017 19:51:37 -0800 (PST)
Received: by mail-yw0-f194.google.com with SMTP id u68so14506747ywg.0
	for <meta-virtualization@yoctoproject.org>;
	Sat, 21 Jan 2017 19:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=l+HSgXiXmoiVnEwLfO9I8smPuD0FzulEeIP5Iy4x7Ac=;
	b=cFeZir6JkyPC3kUaQaUcZ1hG7jG4EruiYJu8k/PbfIKCio6F8u1+mILKn/lI6Es0M+
	pSetMR5n8BKwNkdd+Is17HYyT5p26A4WQb9yeG8CgS5owX6A1+VdX90+S98HS8P6mcfo
	a3tZlR3sYsVuZcFiznHQyf7BzOYD1YmzDKsh9VIAkmqleyRTpcaj5Ll6jywBcVDjUsIj
	13y20Ks7ACjDNi2Lv4LGflfdtginOXKkkO/9tQvEN491tBTh6jhS5CM318oBShkejnFi
	0NB1wCkeocR6nWKoFyTbNOSsAV4no8PlWOoloAKsjnnTDKDB3S+76oHdTIPpz1NqiwS0
	5MdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=l+HSgXiXmoiVnEwLfO9I8smPuD0FzulEeIP5Iy4x7Ac=;
	b=Sl1OTLhNX2QNDmkq/ObppqLfbF+spo3R8OuBqFEntv7R0adqVaq/Ny9s5PTBeQHSYR
	L3j8wV5lVWgMCGfjXhXU8alZXTel6MfdpKdjUlysomGZeSexR0xyriZ30K0Sc2MTVtLq
	URZTvBVTfmEREhHCTFczl+f9VoKdH4xl+Zwrj9Whal1257eydCotd6L5V9cWg1s+IzOZ
	mppAzD6/nGHT8f8n73K29uRGF/fQFQv4qoKg+UCD8adlUv3oL7NJAVZqghfFPzgXihRG
	+sATGs+Bt95s4K2d+kqjqlUvNSqkVuJPN2/O+1e7ogIa4Ny6fq1u7oSwySK2Npfi1z02
	J2Mg==
X-Gm-Message-State: AIkVDXL1jAkZx3SzYfu/blYukglPgLGLLw/TRTAikePl3uJmRlyvLU9KHkvV/IrIxkLwp+9Nb6R9ITXNu2fGRg==
X-Received: by 10.129.68.8 with SMTP id r8mr18310255ywa.169.1485057096075;
	Sat, 21 Jan 2017 19:51:36 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.174.99 with HTTP; Sat, 21 Jan 2017 19:51:35 -0800 (PST)
In-Reply-To: <1485056928-21697-1-git-send-email-mark.asselstine@windriver.com>
References: <1485056928-21697-1-git-send-email-mark.asselstine@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Sat, 21 Jan 2017 22:51:35 -0500
X-Google-Sender-Auth: LendIw9K-yDrZclTuZvCLYVnBz8
Message-ID: <CAPuovEKwbb78xLsmBu+iPh-CtQpkwCAjN=f_nfM02GUW9DM9KQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH 1/4] python-futurist: uprev to v0.21.0
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 22 Jan 2017 03:51:39 -0000
Content-Type: text/plain; charset=UTF-8

Bruce, I know there are a bunch of commits now queued up. If you want
me to put them in a repo so you can pull instead of merging from email
let me know and I will set something up.

Mark

On Sat, Jan 21, 2017 at 10:48 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> This version is required to support python-oslo.messaging. Other than
> the typical version and checksum updates, minor updates to the runtime
> dependencies were required.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../{python-futurist_0.8.0.bb => python-futurist_0.21.0.bb}   | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-futurist_0.8.0.bb => python-futurist_0.21.0.bb} (56%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-futurist_0.8.0.bb b/meta-openstack/recipes-devtools/python/python-futurist_0.21.0.bb
> similarity index 56%
> rename from meta-openstack/recipes-devtools/python/python-futurist_0.8.0.bb
> rename to meta-openstack/recipes-devtools/python/python-futurist_0.21.0.bb
> index 3ad3993..27f2860 100644
> --- a/meta-openstack/recipes-devtools/python/python-futurist_0.8.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-futurist_0.21.0.bb
> @@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
>
>  SRCNAME = "futurist"
>
> -SRC_URI = "https://pypi.python.org/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +SRC_URI = "https://pypi.io/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "ccef2f5a651fffcfe13c71d91262be4d"
> -SRC_URI[sha256sum] = "36f48b56af54c44db848fe4a23c2cb70bd334237e11212a16885a55aca881ddd"
> +SRC_URI[md5sum] = "da7e87d273f1982c24e9fe8a24f81259"
> +SRC_URI[sha256sum] = "086dd646c067d4ef6dc9c04000828acfbdc00842bd37c64825b596a6976509b4"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> @@ -17,10 +17,15 @@ inherit setuptools
>
>  DEPENDS += " \
>          python-pip \
> +        python-pbr-native \
>          "
>
>  RDEPENDS_${PN} += " \
> +        python-pbr \
> +        python-six \
> +        python-monotonic \
>          python-futures \
>          python-contextlib2 \
> +        python-prettytable \
>          "
>
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

