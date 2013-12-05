Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A938E0077E
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Dec 2013 11:09:33 -0800 (PST)
Received: by mail-pd0-f180.google.com with SMTP id q10so25241751pdj.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Dec 2013 11:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=MdTjXZqNlH1LLSbjd17OF2qGg9eo2g9Ao7W9MxpAwg4=;
	b=vrd8JnJpQaHf/MPzLeNnBTp3Ebq0CQuy/Tdv6xxq4BAPmnPv+HTqAlU98gWYi1Vm55
	I32aGV8GZDe0EVf1QqTOtVJPxkWBY2O0ziIR0eFurNNGD3/iV8ylOUKVnEU++rgib8In
	+Ee1bDjiYfnBFP68K8y+8KLHlCImbH6FKLQmzTZG7A3ha9ZZx1CvVK0YC01KHFEWMLGp
	zWG7bTHDZUqBNneJm3qSDsMEUMMvzm5syuqDEE39IGJSrH/thEtM2xWfl3Z19xk+kIxS
	eBgBfHY4WnrsOJHx49HlttHQHVzgJ1lCpxqF0uaxmfxbFkJ5cbuP2vjoIZUsC0ZDfJm/
	My8w==
MIME-Version: 1.0
X-Received: by 10.66.250.129 with SMTP id zc1mr27113775pac.153.1386270572930; 
	Thu, 05 Dec 2013 11:09:32 -0800 (PST)
Received: by 10.68.12.133 with HTTP; Thu, 5 Dec 2013 11:09:32 -0800 (PST)
In-Reply-To: <1386123634-5877-1-git-send-email-flihp@twobit.us>
References: <1386123634-5877-1-git-send-email-flihp@twobit.us>
Date: Thu, 5 Dec 2013 14:09:32 -0500
Message-ID: <CADkTA4NCOjwCH524=zFx-wyw3E0A+02bnMLswE5HLnAjmHbfBA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [RFC] xen: Break volatiles out into separate package.
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
X-List-Received-Date: Thu, 05 Dec 2013 19:09:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 3, 2013 at 9:20 PM, Philip Tricca <flihp@twobit.us> wrote:
> The Xen scripts for handling block and vif udev events depend on
> directories created by the Xen volatile directories. In a situation
> where the 'base' Xen package isn't installed (NDVM etc) these
> scripts fail silently. The most simple approach I could come up
> with is just breaking the Xen volatiles config out into it's own
> package and setting up the logical dependencies.
>
> Creating a new package for just a single file seems like overkill
> to me but it's the most straightforward thing I could come up with.

This seems reasonable to me, there are plenty of other one file package
examples (in particular since the update-rc.d only works for one initscript
per package), so that isn't all that out of the ordinary.

So to my eye, this looks ok.

Bruce

>
> Regards,
> Philip
>
> Signed-off-by: Philip Tricca <flihp@twobit.us>
> ---
>  recipes-extended/xen/xen.inc |    8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 9d43814..e31e996 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -53,12 +53,14 @@ RDEPENDS_${PN}-base = "\
>  RDEPENDS_${PN}-scripts-block = "\
>      ${PN}-scripts-common \
>      ${PN}-udev \
> +    ${PN}-volatiles \
>      "
>
>  RDEPENDS_${PN}-scripts-network = "\
>      bridge-utils \
>      ${PN}-scripts-common \
>      ${PN}-udev \
> +    ${PN}-volatiles \
>      "
>
>  PACKAGES = "\
> @@ -106,6 +108,7 @@ PACKAGES = "\
>      ${PN}-scripts-network \
>      ${PN}-staticdev \
>      ${PN}-udev \
> +    ${PN}-volatiles \
>      ${PN}-xcutils \
>      ${PN}-xencommons \
>      ${PN}-xend \
> @@ -210,7 +213,6 @@ FILES_${PN}-hypervisor = "\
>      "
>
>  FILES_${PN}-base = "\
> -    ${sysconfdir}/default/volatiles/99_xen \
>      ${sysconfdir}/default/xencommons \
>      ${sysconfdir}/default/xendomains \
>      ${sysconfdir}/xen/auto \
> @@ -425,6 +427,10 @@ FILES_${PN}-udev = "\
>      ${sysconfdir}/udev/rules.d/xend.rules \
>      "
>
> +FILES_${PN}-volatiles = "\
> +    ${sysconfdir}/default/volatiles/99_xen \
> +    "
> +
>  FILES_${PN}-xcutils = "\
>      ${libdir}/xen/bin/lsevtchn \
>      ${libdir}/xen/bin/readnotes \
> --
> 1.7.10.4
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

