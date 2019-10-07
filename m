Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F129EE009D4; Mon,  7 Oct 2019 05:05:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BCDF7E00805
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Oct 2019 05:05:03 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id n14so13305792ljj.10
	for <meta-virtualization@yoctoproject.org>;
	Mon, 07 Oct 2019 05:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JF/amviXkXY4O22r6bkHHI1ABh49BlBD3omac08pKyw=;
	b=Botio8DSiiemgF+JelwygOqVxwMAUKbBBDHNqrAZHtq13ltmqFQAtUK+5QdiM/heZh
	VT1xt7Vm4Wo0m/7ck/oHpALNTadzDrjk7olBtEHvlNhPfAC8mFIEopk2imSiZnseZR1a
	lxF5HirGkzOxRWRIiF3b/L4AuwPkd5MxweQ1mh5lrvw4mgLrbTgSr/or8od9OU5+amN/
	otEDNuKWWV9QzmaC1vkPuGBDJu5wMLKa46cSlfciy45bXdp/Lml3JhMMOATKBGlV2HFb
	QL/IqCjZaXtnzpcs/O0Rwiy+C7pNpQlCsCYrM2QCGJQc5HeOU6NxnQkRKzrJtUJ9hjvH
	8H5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JF/amviXkXY4O22r6bkHHI1ABh49BlBD3omac08pKyw=;
	b=o3aHAEVdppC6AtBsoh74lXuNFg5q2UVUjLq8s03Xu0QkagMQd3jsNcNZjARX6DJndf
	86xO4TozlVBWgavPXYwSwwTYwPZUwteYa0BJ2rC9T4cMFmSuAADKYcHE00p+z/tBFta6
	VJmZ4KQk+f2qpu+bSSm18Y8ZU8UK3ka4K5lXeIP/snBHSs1chNGmD7MfPCGnpQ5ZCaiU
	uYVY0PE8rfpk0fe6tix1FsLYTXyF3n4ly0Gg525NMQN2r2KGJ0wlJhBvH9VQ+4mXnz5F
	ABIGrVPSlBVWOZzeJ9I+BfYt8Rehl6/ZLmPolGKsZSQYcUx1rYu9idOqD7vvm7zFrJso
	154g==
X-Gm-Message-State: APjAAAUkfx8GfJ/mgXmVGx6K8jWDfIIiTRH4gNU5njDjgNxCZ+Axujwu
	DWNMzGNe+9JvH+VNrakYqkRYDAY0xPdxhr+/YGg=
X-Google-Smtp-Source: APXvYqwl3S+FStmBagiBAQ2EptwdgsMDNDL1fhgBoo10syjYJu5OFV68eMzT7wCUc3ShZ75QT0YTUqoTzLbzAmSkQ4M=
X-Received: by 2002:a2e:8642:: with SMTP id i2mr17835861ljj.110.1570449902601; 
	Mon, 07 Oct 2019 05:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <1570445149-7427-1-git-send-email-liu.ming50@gmail.com>
In-Reply-To: <1570445149-7427-1-git-send-email-liu.ming50@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 7 Oct 2019 08:04:51 -0400
Message-ID: <CADkTA4Ow0whOd3z65a2noYw=+axEBwoBsMmzFy5eERGLhNj3oA@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH] podman: drop selinux sanity check
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
X-List-Received-Date: Mon, 07 Oct 2019 12:05:05 -0000
Content-Type: text/plain; charset="UTF-8"

I also have a fix for this, that I hadn't pushed yet.

Will push my change later today.

Cheers,

Bruce

On Mon, Oct 7, 2019 at 6:46 AM <liu.ming50@gmail.com> wrote:
>
> From: Ming Liu <liu.ming50@gmail.com>
>
> libselinux is not a dependency of podman, drop a useless sanity check.
>
> Also fix some invalid comments.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  recipes-containers/podman/podman_git.bb | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index 64e2672..835e4d5 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -16,18 +16,12 @@ DEPENDS = " \
>
>  python __anonymous() {
>      msg = ""
> -    # ERROR: Nothing PROVIDES 'libseccomp' (but /buildarea/layers/meta-virtualization/recipes-containers/cri-o/cri-o_git.bb DEPENDS on or otherwise requires it).
> +    # ERROR: Nothing PROVIDES 'libseccomp' (but /buildarea/layers/meta-virtualization/recipes-containers/podman/podman_git.bb DEPENDS on or otherwise requires it).
>      # ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
> -    # Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'cri-o', 'libseccomp']
> +    # Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'podman', 'libseccomp']
>      if 'security' not in d.getVar('BBFILE_COLLECTIONS').split():
>          msg += "Make sure meta-security should be present as it provides 'libseccomp'"
>          raise bb.parse.SkipRecipe(msg)
> -    # ERROR: Nothing PROVIDES 'libselinux' (but /buildarea/layers/meta-virtualization/recipes-containers/cri-o/cri-o_git.bb DEPENDS on or otherwise requires it).
> -    # ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
> -    # Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'cri-o', 'libselinux']
> -    elif 'selinux' not in d.getVar('BBFILE_COLLECTIONS').split():
> -        msg += "Make sure meta-selinux should be present as it provides 'libselinux'"
> -        raise bb.parse.SkipRecipe(msg)
>  }
>
>  SRCREV = "00057929f5acfd98341964d85722383363376d52"
> --
> 2.7.4
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

