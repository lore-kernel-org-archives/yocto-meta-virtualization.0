Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68637E0166C
	for <meta-virtualization@yoctoproject.org>;
	Thu,  3 Oct 2013 19:42:32 -0700 (PDT)
Received: by mail-pb0-f47.google.com with SMTP id rr4so3318551pbb.34
	for <meta-virtualization@yoctoproject.org>;
	Thu, 03 Oct 2013 19:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=oJzt265ie3/VbxCYa+wfRW/gvtkSLTqQJ62iWRiXETQ=;
	b=Bcr1bI3U64KxZ/ilDp4GvWgknPwR3yL2cgwScmIvj0S7Gf+XpN7MvlrARozwROPJsX
	/saRSqXAzNL4W4ZM8NwCwvh4Phn6SiSeAD6fsYi68C6AHasHiVAMJMzYUMXc/wJExuDN
	Tj2HtIlTAqjEdUwEuGScFGWJnRLx/+qb0LfYLlyNJoh4ADvYA4oM85siSwJjDThOnG5C
	7TZ2BPyoCi/SJsAEerPX29XHQmAjx7xOEaX9mmJrssfAcRnpVQfLUoquHXXt6Pucm0BR
	YPHkgl77nECB1zTQDbCqnxn3eCZ0PClNKalbc+fo132m2fruWnYf+uHIl4gjpFxOcOwH
	dl8Q==
MIME-Version: 1.0
X-Received: by 10.66.65.195 with SMTP id z3mr12789457pas.47.1380854552263;
	Thu, 03 Oct 2013 19:42:32 -0700 (PDT)
Received: by 10.68.43.130 with HTTP; Thu, 3 Oct 2013 19:42:32 -0700 (PDT)
In-Reply-To: <1380633180-10459-1-git-send-email-david.nystrom@enea.com>
References: <1380633180-10459-1-git-send-email-david.nystrom@enea.com>
Date: Thu, 3 Oct 2013 22:42:32 -0400
Message-ID: <CADkTA4PNijM-aCRG1HmCc9bmi3eKq2N+Jy_7Xn=pj4iFSY_Kpg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] busybox: Add getopt since lxc templates require it
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
X-List-Received-Date: Fri, 04 Oct 2013 02:42:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Makes sense. merged!

Bruce

On Tue, Oct 1, 2013 at 9:13 AM, David Nystr=F6m <david.c.nystrom@gmail.com>=
 wrote:
> Signed-off-by: David Nystr=F6m <david.nystrom@enea.com>
> ---
>  recipes-core/busybox/busybox/getopt.cfg      | 2 ++
>  recipes-core/busybox/busybox_1.21.1.bbappend | 1 +
>  2 files changed, 3 insertions(+)
>  create mode 100644 recipes-core/busybox/busybox/getopt.cfg
>
> diff --git a/recipes-core/busybox/busybox/getopt.cfg b/recipes-core/busyb=
ox/busybox/getopt.cfg
> new file mode 100644
> index 0000000..8dcd350
> --- /dev/null
> +++ b/recipes-core/busybox/busybox/getopt.cfg
> @@ -0,0 +1,2 @@
> +CONFIG_GETOPT=3Dy
> +CONFIG_FEATURE_GETOPT_LONG=3Dy
> diff --git a/recipes-core/busybox/busybox_1.21.1.bbappend b/recipes-core/=
busybox/busybox_1.21.1.bbappend
> index 7d71c7d..8369a03 100644
> --- a/recipes-core/busybox/busybox_1.21.1.bbappend
> +++ b/recipes-core/busybox/busybox_1.21.1.bbappend
> @@ -6,4 +6,5 @@ SRC_URI +=3D " \
>             file://mdev.cfg \
>             file://mount-cifs.cfg \
>             file://ps-extras.cfg \
> +           file://getopt.cfg \
>             "
> --
> 1.8.3.2
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

