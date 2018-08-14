Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 003E1E006B3; Tue, 14 Aug 2018 10:04:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.167.65 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 130E1E0049F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Aug 2018 10:04:31 -0700 (PDT)
Received: by mail-lf1-f65.google.com with SMTP id g6-v6so14267689lfb.11
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Aug 2018 10:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3lIS7gnxevzEksF9Z7U6Rm2pot6Mg+8AvJznci286Gw=;
	b=PWS6A6ilMTyJU4Ed/sE6isa2IyS4LsDKWEKFsjcGOX2H2JAounlIyzAy4uloAkDXCY
	MFtd73nQ1nSFXuduWVy391J7PW00PoMRCFzSdhI8MUWE1sVSFQr3Xbc791GUl/4PMHqc
	7avfEagJ3GpcfIJHZXQibeJaKUK/LkB9zxLsQaU4yHYX7I1TQvf3X8S7fAAQ4KUVdRhK
	a4oh5yMqKZp7qNT/FdlORVBiyehat+48QoLLL3D52ybOp8q5v3yfD3/iS41qE9rTK+ys
	K0qeWDw1YhetEjlhsK8E6jy9VnjokOmuqGw5pOiYKkaT3uov01RwqVHGtoLlQmQxBqlY
	u+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3lIS7gnxevzEksF9Z7U6Rm2pot6Mg+8AvJznci286Gw=;
	b=qdH+zvT1q+vF9n+e9FZvxVl/tDejU0qCxNV52VjmjRQNfx+rJh4rdgQhCnsxfpGeVM
	qTP31Ersm0lxzpxrA0w7NCljRwPijHGWAekOdTayKSSy4v4Ubjyfyv2dFDq5FRnj4wte
	VN2rLWyW1cwDCrI3Ly/HYzsahldbu0wGsuCyjQo5G27VhxZXpXuXhqov/g79ww8yVZv2
	mQZFEp0iIUTKiEW5D8iin96qxjnUgoS9GKkJrjcWRdhbaSIMAKqxbcjYi4ZYccsZ4dhv
	lsPANvB8cjjAdfX+o2fSC7yBScr9A1xc4hMyWMx9XuUIno4YB3YFHrBUVfpfa/BWAtLT
	YOjw==
X-Gm-Message-State: AOUpUlHhcfti/RIP64D2YnB1akaPypU0YU2y3ulIKCMEHlbt79PFya7Q
	zke0/8m6B3rhsNuA/hIIjEkQ0lNl2gJ16Mh+UJo=
X-Google-Smtp-Source: AA+uWPzqsNGgrmwueoYPrX4ZYaTtgJqHv7TLIEnPd1LITvIQNmGmlfmDcLD+j1zzvUiD+2oTaJTYmR1JFgDVC++mQrk=
X-Received: by 2002:a19:ebd7:: with SMTP id
	f84-v6mr13975092lfk.18.1534266270164; 
	Tue, 14 Aug 2018 10:04:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Tue, 14 Aug 2018 10:04:29
	-0700 (PDT)
In-Reply-To: <20180813062255.386-1-zhe.he@windriver.com>
References: <20180813062255.386-1-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 14 Aug 2018 13:04:29 -0400
Message-ID: <CADkTA4NJW8JsoLNmaHQ0Bt29msxJB1P2fAmNn4Zd2AnWdpbnFQ@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH] kernel: Remove bbappaned for old kernels
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
X-List-Received-Date: Tue, 14 Aug 2018 17:04:32 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, Aug 13, 2018 at 2:22 AM, He Zhe <zhe.he@windriver.com> wrote:
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta-openstack/recipes-kernel/linux/linux-yocto_4.10.bbappend | 9 ---------
>  meta-openstack/recipes-kernel/linux/linux-yocto_4.4.bbappend  | 9 ---------
>  meta-openstack/recipes-kernel/linux/linux-yocto_4.9.bbappend  | 9 ---------
>  3 files changed, 27 deletions(-)
>  delete mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_4.10.bbappend
>  delete mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_4.4.bbappend
>  delete mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_4.9.bbappend
>
> diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto_4.10.bbappend b/meta-openstack/recipes-kernel/linux/linux-yocto_4.10.bbappend
> deleted file mode 100644
> index 843546c..0000000
> --- a/meta-openstack/recipes-kernel/linux/linux-yocto_4.10.bbappend
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -
> -SRC_URI += "file://enable-veth.cfg \
> -            file://enable-iscsi-tcp.cfg \
> -            file://enable-nbd.cfg \
> -            file://enable-rtlink.cfg \
> -            file://nf.scc \
> -            file://nfs.scc \
> -       "
> diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto_4.4.bbappend b/meta-openstack/recipes-kernel/linux/linux-yocto_4.4.bbappend
> deleted file mode 100644
> index 843546c..0000000
> --- a/meta-openstack/recipes-kernel/linux/linux-yocto_4.4.bbappend
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -
> -SRC_URI += "file://enable-veth.cfg \
> -            file://enable-iscsi-tcp.cfg \
> -            file://enable-nbd.cfg \
> -            file://enable-rtlink.cfg \
> -            file://nf.scc \
> -            file://nfs.scc \
> -       "
> diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto_4.9.bbappend b/meta-openstack/recipes-kernel/linux/linux-yocto_4.9.bbappend
> deleted file mode 100644
> index 843546c..0000000
> --- a/meta-openstack/recipes-kernel/linux/linux-yocto_4.9.bbappend
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -
> -SRC_URI += "file://enable-veth.cfg \
> -            file://enable-iscsi-tcp.cfg \
> -            file://enable-nbd.cfg \
> -            file://enable-rtlink.cfg \
> -            file://nf.scc \
> -            file://nfs.scc \
> -       "
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

