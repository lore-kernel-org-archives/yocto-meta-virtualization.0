Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A4B0E00D8A; Sun, 13 Oct 2019 16:46:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A525E007C2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 13 Oct 2019 16:46:14 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id m7so14816895lji.2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 13 Oct 2019 16:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dBgHmX8rqE/qKWcW4cRNWMj3DFa0VWoc2zRUwMSmMqs=;
	b=hSibbDya2tNEsgsAIsHji6ZGGs1WXdtGL1SoyU/jwRROxz/8viWp6PgpR2UO8IRBts
	LL6iWB6IBU47VGHwwiQ8mzbfiBWNqMI/H4w6AhLW0YSFjaRUD7KJ8OUQqLmO0TmQ27Y1
	gZAfF2ZASs3XAaY4zOtX5yXfvKaLnAe6T4RU3+m2M9XZK1KPYWbQZ4LX7dJh89S+eT2Q
	qfKopaCIVAmqwHYOuERKttG9BtMUuQKKB1CGq8yyoiGQWw/A2rNdlVUWYIau4dl3m3IQ
	Y6lXwBk/4jPMkZeoN+gh7LI5k1lpNbul3yQojBGWaVGMqGSx5uv+0Oh/8KfjZ7vZ+mi4
	Izog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dBgHmX8rqE/qKWcW4cRNWMj3DFa0VWoc2zRUwMSmMqs=;
	b=mtTPyVSKomQiE77Fr9wNe1ZdLtlfTnQGeLS+sedFCPq4XfPj9/8eL6BiT0800Ggfx0
	0z+BRo5HmIR2k4yxQpw8QcQUoRAnWeR9TBWCuNoJsPp+nyLtisubNsF5fQq3UF2PaUrr
	S78amVX3lVrYEFQQRE0d1eFzQCPI2SUsd26L7DZ/QU2+WSYcM3120kRXGUi9M3bwR1XQ
	jm1fkvb7SW5ADe1YT5TS3Fhkz1XErjqcSGW68dfNJZun3LwbJpjWDrKjgZ8o0paI7+UW
	10292cct3WmTCIMP8mwBA0foPRLfO+gm4LmIWgW7s7IOCGseg3oPzCs2NzY24rVQzFl8
	urKw==
X-Gm-Message-State: APjAAAVI+G3tymvO2BOdvVSp1AhDw0RS2Yqhoe3Mv5tkdeoyMqZkUZtB
	/3u2n5Hbp5h3EphUO+ArxQTtRGZLYl2rkenMn6E=
X-Google-Smtp-Source: APXvYqz/q8tpOtjVgWz8exw6MnIyhwovgxxiC7QDYffG3NRf9LNxP1ChNoFSEZ0APg910UAadXTSqjdbrzcoYA4/RM4=
X-Received: by 2002:a2e:9449:: with SMTP id o9mr434736ljh.110.1571010373395;
	Sun, 13 Oct 2019 16:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191006204748.15783-1-stefan@agner.ch>
In-Reply-To: <20191006204748.15783-1-stefan@agner.ch>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 13 Oct 2019 19:46:02 -0400
Message-ID: <CADkTA4Nn+LGu8WHfhngkvOVi6kRC4hM=1ufx8JUusx8L4rKyKw@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH 1/5] podman: remove comment about runc
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
X-List-Received-Date: Sun, 13 Oct 2019 23:46:15 -0000
Content-Type: text/plain; charset="UTF-8"

All 5 patches in this series are now merged.

I'm still having some issues with the network and CNI .. but will have
a closer look this week. There was no reason to hold these back based
on those problems though.

Bruce

On Sun, Oct 6, 2019 at 4:49 PM Stefan Agner <stefan@agner.ch> wrote:
>
> From: Stefan Agner <stefan.agner@toradex.com>
>
> It seems that docker uses nowadays a rather vanilla version of runc,
> at the time of writing 1.0.0-rc8. This version has successfully
> tested with podman, hence remove the obsolete comment.
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  recipes-containers/podman/podman_git.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index 64e2672..db595a5 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -113,8 +113,6 @@ FILES_${PN} += " \
>      ${sysconfdir}/cni \
>  "
>
> -# Note that runc-opencontainers is the only currently tested
> -# runc provider.
>  RDEPENDS_${PN} += "conmon virtual/runc iptables cni skopeo"
>  RRECOMMENDS_${PN} += "slirp4netns"
>  RCONFLICTS_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'docker', 'docker', '', d)}"
> --
> 2.20.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

