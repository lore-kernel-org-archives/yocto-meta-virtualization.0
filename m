Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A78FE0059A
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Feb 2014 08:23:35 -0800 (PST)
Received: by mail-lb0-f175.google.com with SMTP id p9so4885340lbv.6
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Feb 2014 08:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cieL2KhB5CF/Uo8MWJGD5HbXUFEiIbQrLzP2blpXDs0=;
	b=bqlN4SDIqss9g3y26DbkP7SBUeQIIS/OVYgurPVsA59vhOvZYvYIYS9Jpe288o2GBD
	MSNMzpRoOmpNfy9Pah9qhnsvH3oMGP4Qla5SahE7CaZRyZLTIVVOi1FWI7mQymV8dPtQ
	lXDQO5U3mnWYwH+k0Erx5zlSyHlHebNV2UkFFO6JmFM6eM/HDbSGC6IF7oxJXUl5R5xF
	hXjoSreM3ULvaeQImSh08Bgi6UXYcu5L2ivANEZPJ7Y7tlTDjrma0FBG96bJmdNsOg7C
	qGofXGCa8QBKywfXzEy4Y7HvTRiBj4DviUWiSPE4IEl6F1BEE/zPC+hSuiRZr4Np0SyD
	qJpA==
MIME-Version: 1.0
X-Received: by 10.152.19.166 with SMTP id g6mr22692829lae.21.1392049413920;
	Mon, 10 Feb 2014 08:23:33 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Mon, 10 Feb 2014 08:23:33 -0800 (PST)
In-Reply-To: <1392044128-3756-1-git-send-email-mark.asselstine@windriver.com>
References: <1392044128-3756-1-git-send-email-mark.asselstine@windriver.com>
Date: Mon, 10 Feb 2014 11:23:33 -0500
Message-ID: <CADkTA4Ncvah8RyGgnLaQF-3+RYaaQBjrs9kQ-W2+2ZetSf0fCQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-openstack][PATCH v2] python-dogpile: core: update SRC_URI* sums
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
X-List-Received-Date: Mon, 10 Feb 2014 16:23:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 10, 2014 at 9:55 AM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Attempting to build openstack-image-controller I was getting
>
>   'Fetcher failure ... /dogpile.core-0.4.1.tar.gz'. Checksum mismatch!
>
> Update the sums to match the expected values.
>
> Unfortunately upstream repackaged the tarball after updating some of
> the python egg files without bumping the package version or providing
> any details about the updates. The new tarball matches the md5 listed
> on the upstream website (https://pypi.python.org/pypi/dogpile.core) so
> the update does not seem to be malicious.

Simple enough, no sense waiting on this, so I've pulled and merged the
change.

Bruce

>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>
> v2:
>  * Updated commit log with details about the tarball update
>
>  meta-openstack/recipes-devtools/python/python-dogpile.core_0.4.1.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.core_0.4.1.bb b/meta-openstack/recipes-devtools/python/python-dogpile.core_0.4.1.bb
> index 3079c39..0b33455 100644
> --- a/meta-openstack/recipes-devtools/python/python-dogpile.core_0.4.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-dogpile.core_0.4.1.bb
> @@ -9,8 +9,8 @@ SRCNAME = "dogpile.core"
>
>  SRC_URI = "https://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "5f76cce023d505a5375b07e094c3260f"
> -SRC_URI[sha256sum] = "af2555702811d56846778d39451cf822b04b3f13347080c121a4977fefdfcbff"
> +SRC_URI[md5sum] = "01cb19f52bba3e95c9b560f39341f045"
> +SRC_URI[sha256sum] = "be652fb11a8eaf66f7e5c94d418d2eaa60a2fe81dae500f3743a863cc9dbed76"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> --
> 1.8.3.2
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

