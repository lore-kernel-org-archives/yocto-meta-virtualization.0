Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2AEFE006BC
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Dec 2013 21:57:56 -0800 (PST)
Received: by mail-pa0-f52.google.com with SMTP id ld10so2450313pab.25
	for <meta-virtualization@yoctoproject.org>;
	Mon, 02 Dec 2013 21:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TRUl5cyHgClR2tr2nOYEUOMj2BuxR/lRyB5ZsG8vO90=;
	b=a9Z2Ny73z9G1ls6G4CZ/aIWeav0F7IMvw7135uX0JZ8pv2kdhkJWUepxNVrL7pERAF
	QOs4heiNDKNE/lbSMbvMRTRpRVTVobGGkAqccDy7OMNVPrZJzirmp76/9pBirGDQgl08
	39hXBQY/mxlTiI+JBHU9FpEFOHS/2z61YDR8jH9BQexO8yfzKcbVPvK9zfzo7aDav9GC
	WHQ3tVo1gwJ18YLFCetaRN28zbO8QyK3ixWYEJUg8i6p5KC0vJFPa7Qv1dy1Pbo6bB+B
	zkvR6mLR9poe8CK1VovQeonEvbybIpTdSA5oxa/u21DCBBbml+AAlcyKoj59pa8EFPs0
	yBdQ==
MIME-Version: 1.0
X-Received: by 10.66.188.172 with SMTP id gb12mr8796843pac.143.1386050276450; 
	Mon, 02 Dec 2013 21:57:56 -0800 (PST)
Received: by 10.68.12.133 with HTTP; Mon, 2 Dec 2013 21:57:56 -0800 (PST)
In-Reply-To: <1385471335-32126-1-git-send-email-flihp@twobit.us>
References: <1385471335-32126-1-git-send-email-flihp@twobit.us>
Date: Tue, 3 Dec 2013 00:57:56 -0500
Message-ID: <CADkTA4On0GwsQ+POK62aaCXExCLR+UN-fFJJy-+k4fW9rcX5nQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] base-files: add xenfs entry to fstab if xen DISTRO_FEATURE is enabled
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
X-List-Received-Date: Tue, 03 Dec 2013 05:57:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hey Phillip,

It appears that I forgot to follow up on this. I was working up upreving libvirt
and grabbed this into my tree. I'll push this shortly, since libvirt is nearly
done :)

Bruce

On Tue, Nov 26, 2013 at 8:08 AM, Philip Tricca <flihp@twobit.us> wrote:
> Xen handles mounting xenfs with an init script. Unfortunately this
> script is the same one that starts xenstored and xenconsoled. That's
> great for dom0 but a domU may need xenfs but running xenstored/
> xenconsoled in a domU makes no sense. A simple fstab entry is
> preferrable.
>
> Signed-off-by: Philip Tricca <flihp@twobit.us>
> ---
>  recipes-core/base-files/base-files_3.0.14.bbappend |    5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 recipes-core/base-files/base-files_3.0.14.bbappend
>
> diff --git a/recipes-core/base-files/base-files_3.0.14.bbappend b/recipes-core/base-files/base-files_3.0.14.bbappend
> new file mode 100644
> index 0000000..eb973ad
> --- /dev/null
> +++ b/recipes-core/base-files/base-files_3.0.14.bbappend
> @@ -0,0 +1,5 @@
> +do_install_append() {
> +       if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
> +               echo "xenfs                /proc/xen            xenfs      defaults              0  0" >> ${D}${sysconfdir}/fstab
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

