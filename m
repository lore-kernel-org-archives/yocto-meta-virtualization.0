Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E177DE0106F; Tue, 22 Sep 2015 11:39:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B8B4E00A73
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Sep 2015 11:39:26 -0700 (PDT)
Received: by ykdg206 with SMTP id g206so18690499ykd.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Sep 2015 11:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wG4UvHK/OEQmZXzAI6QN9slTfEhZdn0e6Iw0yFBf6hw=;
	b=Ose5nVx6CXR/IVEkffzN0wy17sgb0kD2kVQ+Mk0O5sXTPZMxbzO0EkU5vMC4IXskUA
	+YnoDgLGI5ZYiKG6emcUFLgafhqhb/6w3T04zVFat2p6CYrGNhsVKmrhW22u81ZJNJUR
	rW05wG7R4ZTJ2VpZZHDZuvq2/kuGrp7zsMCDmkJJNgX2/LjXzXtBI1JQ1RKGglsGBy7u
	WCbFgkrrFQzNwI8KDGD0IbxZ+7il8B5xbU9wb9j3fYtDpYwQHt18PnmoGNxyxrI8e40s
	wiSpjZr2K95CP72hefjyFK7aPZ+Jcmppo5rwnHXK3qysUYDGKL5BbFw3jcTDH3qPkv/R
	F8KA==
MIME-Version: 1.0
X-Received: by 10.13.203.10 with SMTP id n10mr22648721ywd.68.1442947165997;
	Tue, 22 Sep 2015 11:39:25 -0700 (PDT)
Received: by 10.13.203.151 with HTTP; Tue, 22 Sep 2015 11:39:25 -0700 (PDT)
In-Reply-To: <1442519104-25466-1-git-send-email-jslater@windriver.com>
References: <1442519104-25466-1-git-send-email-jslater@windriver.com>
Date: Tue, 22 Sep 2015 14:39:25 -0400
Message-ID: <CADkTA4OC5A93Su9EbN50D25Q5KPTyYWzzd_B=i+8ugb0GvN0mA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, "Slater,
	Joseph" <joe.slater@windriver.com>
Subject: Re: [meta-networking][PATCH 1/1] lldpad: depends on readline
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
X-List-Received-Date: Tue, 22 Sep 2015 18:39:30 -0000
Content-Type: text/plain; charset=UTF-8

Was this really meant for meta-virt ? I haven't checked to see if you resent
it to meta-networking .. but figured I'd follow up just in case.

Bruce

On Thu, Sep 17, 2015 at 3:45 PM, Joe Slater <jslater@windriver.com> wrote:
> Add a dependency on readline because the header
> files are required by configure.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  .../recipes-daemons/lldpad/lldpad_0.9.46.bb        |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb b/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
> index 0c8c5d8..b191df5 100644
> --- a/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
> +++ b/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
> @@ -5,7 +5,7 @@ Intel LLDP Agent with Enhanced Ethernet support for the Data Center."
>  SECTION = "net"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=8c2bc283e65df398ced5f5b747e78162"
> -DEPENDS = "libconfig libnl"
> +DEPENDS = "libconfig libnl readline"
>  SRCREV = "48a5f38778b18d6659a672ccb4640f25c6720827"
>
>  SRC_URI = "git://github.com/jrfastab/lldpad.git;protocol=http \
> --
> 1.7.9.5
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

