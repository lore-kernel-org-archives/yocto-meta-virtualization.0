Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33A34E00CA6; Tue,  8 Sep 2015 07:03:00 -0700 (PDT)
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
	*      [209.85.220.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85B47E00C62
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Sep 2015 07:02:57 -0700 (PDT)
Received: by qkdw123 with SMTP id w123so27476277qkd.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 08 Sep 2015 07:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wCvz1V2NqnR+a76J/PPsLMTRkOLqadP62dYYgyBgXvw=;
	b=gKrPkVHfJuproOy7Imi9Ax5vGIGIR22bT0dvcG6hoDdau3MtfWuJsaiJcsOGPTPBfv
	BAkJYCetNwBhYJfD4x6HXMHW8QfwNCLwoXK0syZRRS5HqA2fm5YsYBHsRZKfIMnQXQau
	AhuFBM5Vn1WzUBcVY+F4YTzVVAWkLQnL3KVlfkJvMx5Xie8dUhhf5tU2rAks+HBy1Yb+
	gVcoK+D7RfjzUHy1i8UOsVnKF+A24t8L/BprHzFtf+4oipuAUgtNek4DaWE6nKRv+EGH
	ajLRgyX3NQSXLyaibvrtISIkqM0SfGwsfImpS6rXO7GaBprzGsCgLtoEphcgCPILtdMg
	iadA==
MIME-Version: 1.0
X-Received: by 10.129.75.3 with SMTP id y3mr28604930ywa.92.1441720974005; Tue,
	08 Sep 2015 07:02:54 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Tue, 8 Sep 2015 07:02:53 -0700 (PDT)
In-Reply-To: <1441310380-6808-1-git-send-email-mark.asselstine@windriver.com>
References: <1441310380-6808-1-git-send-email-mark.asselstine@windriver.com>
Date: Tue, 8 Sep 2015 10:02:53 -0400
Message-ID: <CADkTA4O7N7Zod+ihp=X6RT1ZWpvvyw7Lu+sSDz09WeiJXR2jaA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: correct QA warning for missing build dep
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
X-List-Received-Date: Tue, 08 Sep 2015 14:03:00 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Thu, Sep 3, 2015 at 3:59 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Fixes the following QA warning:
> WARNING: QA Issue: libvirt-ptest rdepends on libtasn1, but it isn't a build dependency? [build-deps]
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_1.2.17.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.2.17.bb b/recipes-extended/libvirt/libvirt_1.2.17.bb
> index d3d7252..26953b6 100644
> --- a/recipes-extended/libvirt/libvirt_1.2.17.bb
> +++ b/recipes-extended/libvirt/libvirt_1.2.17.bb
> @@ -8,7 +8,7 @@ SECTION = "console/tools"
>  PR = "r1"
>
>  DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
> -          iptables dnsmasq readline libxslt-native"
> +          iptables dnsmasq readline libtasn1 libxslt-native"
>
>  # libvirt-guests.sh needs gettext.sh
>  #
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

