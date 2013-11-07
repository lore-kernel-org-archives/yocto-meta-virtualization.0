Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6948EE01757
	for <meta-virtualization@yoctoproject.org>;
	Thu,  7 Nov 2013 12:32:53 -0800 (PST)
Received: by mail-lb0-f176.google.com with SMTP id z5so868732lbh.21
	for <meta-virtualization@yoctoproject.org>;
	Thu, 07 Nov 2013 12:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=PJrEaDTB8JugWbukSAI5HjpY2uu5htRDRZDTHOZGwJo=;
	b=JWtw7R5bUdWxS1aEsPnqsdfP51PjUmSwHGlQDtDTJfRGyEXdcHZq4nGRhbG/kQbfQL
	p4utuCZ8gwtwV+A4o79VPtDJ8GWWAHf+/kSOadszfxRMfmcmyO5zWhWq3nCcwB8vdDHO
	/useBalSP5vJ8CU6gKkykNOg2SOYo+FYv1QIVjEFf5rikjiPJH4eLED8kKovROwvXNs0
	beNtM6LFJhgdKP7jGa9yl2tKRPwTeI0ylm/L9sFHhp25vOAAdpXMl9qbm+j3osrinzM8
	h12fbYal+bTHCTymoTsrHOJRnHhi8cEwEcnZ8bnZi+fh3GB7kROxj1zfp/b3awk2t4Rx
	ks5A==
MIME-Version: 1.0
X-Received: by 10.152.243.11 with SMTP id wu11mr2189325lac.42.1383856372464;
	Thu, 07 Nov 2013 12:32:52 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Thu, 7 Nov 2013 12:32:52 -0800 (PST)
In-Reply-To: <1383706491-3555-1-git-send-email-flihp@twobit.us>
References: <1383706491-3555-1-git-send-email-flihp@twobit.us>
Date: Thu, 7 Nov 2013 15:32:52 -0500
Message-ID: <CADkTA4MAfcsVPH54igL_PSvh8U=Q_85bSQincGSQNb7OMHMPSQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Add getty to inittab for login on Xen serial console.
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
X-List-Received-Date: Thu, 07 Nov 2013 20:32:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 5, 2013 at 9:54 PM, Philip Tricca <flihp@twobit.us> wrote:
> It's not pretty but the mechanisms in sysvinit-inittab assume the
> console device name is tty*. The Xen console device doesn't meet
> this criteria.

merged (with a minor tweak to the shortlog).

Bruce

>
> Signed-off-by: Philip Tricca <flihp@twobit.us>
> ---
>  recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend |    7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
>
> diff --git a/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend b/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
> new file mode 100644
> index 0000000..2edbedf
> --- /dev/null
> +++ b/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
> @@ -0,0 +1,7 @@
> +do_install_append() {
> +       echo "${DISTRO_FEATURES}" | grep -q 'xen'
> +       if [ $? -eq 0 ]; then
> +               echo "" >> ${D}${sysconfdir}/inittab
> +               echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> ${D}${sysconfdir}/inittab
> +       fi
> +}
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

