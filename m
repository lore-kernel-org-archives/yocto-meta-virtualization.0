Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D0C17E00B8F; Fri, 14 Jun 2019 10:44:48 -0700 (PDT)
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
	*      [209.85.208.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C92B7E0049C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 14 Jun 2019 10:44:47 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id p17so3263069ljg.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 14 Jun 2019 10:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pkf9NryREMGd5ceNAxrTyDXaethfUvooKieOcu5wtvo=;
	b=T5Joecx2GrlO/PscainB5yoMKw3cignoVNM8Y+Q0tO8uDMD30BrvH5eqGLYGGzBJ1X
	65OsEwqnFrD6u/TkknrYeyjmmIRT8LksleAHZuKULXV8seJBa0ksGYUQDtRq0NNC7QfW
	m5vZkUpXv1KhW4WNxFH2JlgNsQaByc/rH7aXl4lOzfV/YbbdbYgV36qLSjSitNg8g2yR
	gFTHhgx7iMkR5qCCjeC/s4HWdk9h+0AayrgSf3syznr+CEGYPP07GzRubYSSyYgk4mFt
	GsXCHvTsTNVkuCqKIHOJ+AOOHbznXWL052LtfOeRkhXgqTIS/ZmbPViMiTx9D+GBXmh7
	Jshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pkf9NryREMGd5ceNAxrTyDXaethfUvooKieOcu5wtvo=;
	b=RWIjAf75bpYTtHYaL4fiyzD8BnwvQkDOW7Yb3N3HdHIIzWlhCMM7yWzt+vc4eX/0A+
	w0RaaQapT97cK6vKzdv3s1CpaCA1dpWRy8djUu3F6OeYp6MrsuaxfOIRhzaU+gaP5QAx
	KSSfQ4kNYI3n7FVkoIapULPRyfA14R/K+NnVA/ND2fuiY4DsXUd4wR9jEjTErKrqXMoG
	cDoLhFby7NSphEICk1/+EGMULk91bakXQUR+/TujxPeJtO4dbi0bOGC2kKyXeQ0RY5b9
	65xkwwuBftN+sw88aGO9lkJCJXRGwmmSiB79ntqb06vFYpzKsjgbaFfeNhgKbDsO+4ON
	sVoQ==
X-Gm-Message-State: APjAAAUW6bFhWVmezO17W6qj9+AVa42TCv/Yx/2UBUDeieoEobv92ldg
	NuYkPivjjekAg9gaeECdbyN8065diqITlLz0d2g=
X-Google-Smtp-Source: APXvYqxoFtDY8MJUwHn/kCaE4vidyH02ZoWCdoUKOHWOhdUX8V5zIxwk71LFfETjlXq6SZbtFxYiPamsc8PifMJ38F8=
X-Received: by 2002:a2e:5cc8:: with SMTP id
	q191mr22925676ljb.118.1560534286602; 
	Fri, 14 Jun 2019 10:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <1560531022-7970-1-git-send-email-bostancioglucevat@gmail.com>
In-Reply-To: <1560531022-7970-1-git-send-email-bostancioglucevat@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 14 Jun 2019 13:44:35 -0400
Message-ID: <CADkTA4NwSDYJYWQrdJdXECgTOa24P82KQvh9upRj+f__ZwjDyQ@mail.gmail.com>
To: Cevat Bostancioglu <bostancioglucevat@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] kvmtool: Werror compile time error fixed.
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
X-List-Received-Date: Fri, 14 Jun 2019 17:44:48 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks for the fix. This non-attachment version is easier to review.

We need a few tweaks and this should be ready to go.

In the long log here, can you capture the compile error and associated
details (i.e.
architecture, etc). And then why this error has started now (was it
gcc9, something else ?)
.. plus how the fix solves the problem.

You can then duplicate that log log into the patch itself.

On Fri, Jun 14, 2019 at 12:50 PM Cevat Bostancioglu
<bostancioglucevat@gmail.com> wrote:
>
> Signed-off-by: Cevat Bostancioglu <bostancioglucevat@gmail.com>
> ---
>  ...-EXTRA_CFLAGS-variable-and-disable-werror.patch | 26 +++++++++++++++++++
>  .../0002-kvmtool-add-EXTRA_CFLAGS-variable.patch   | 29 ----------------------
>  recipes-extended/kvmtool/kvmtool.bb                |  2 +-
>  3 files changed, 27 insertions(+), 30 deletions(-)
>  create mode 100644 recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable-and-disable-werror.patch
>  delete mode 100644 recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable.patch

We should just make this an additional patch, and not modify the
existing one. That way we are
keeping some of the history and bisectability in the changes.

>
> diff --git a/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable-and-disable-werror.patch b/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable-and-disable-werror.patch
> new file mode 100644
> index 0000000..d910fae
> --- /dev/null
> +++ b/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable-and-disable-werror.patch
> @@ -0,0 +1,26 @@
> +From 8e291af191339471c20292784ebb6de6122f4fc4 Mon Sep 17 00:00:00 2001
> +From: Cevat Bostancioglu <bostancioglucevat@gmail.com>
> +Date: Fri, 14 Jun 2019 18:47:25 +0300
> +Subject: [PATCH] kvmtool: add CFLAGS Variable and disable Werror
> +
> +to avoid CFLAGS and warnings via command argument

You don't have a Signed-off-by: in the patch itself.

.. and finally, is this a good opportunity to update to the HEAD of
the repo and pickup other fixes/features ?

Bruce

> +---
> + Makefile | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/Makefile b/Makefile
> +index 030ff4e..e0a8b23 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -2,6 +2,9 @@
> + # Define WERROR=0 to disable -Werror.
> + #
> +
> ++WERROR=0
> ++CFLAGS += $(EXTRA_CFLAGS)
> ++
> + ifeq ($(strip $(V)),)
> +       E = @echo
> +       Q = @
> +--
> +2.7.4
> diff --git a/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable.patch b/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable.patch
> deleted file mode 100644
> index 262531c..0000000
> --- a/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 977a4d41012d1814f5a5330cacc2e4944de387cc Mon Sep 17 00:00:00 2001
> -From: Dariusz Pelowski <dariusz.pelowski@gmail.com>
> -Date: Sun, 5 Nov 2017 12:39:21 +0100
> -Subject: [PATCH 2/2] kvmtool: add EXTRA_CFLAGS variable
> -
> -to avoid CFLAGS overriding introduce new EXTRA_CFLAGS variable
> -for setting via command argument
> -
> -Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
> ----
> - Makefile | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/Makefile b/Makefile
> -index 64a0a16..bca1b26 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -2,6 +2,8 @@
> - # Define WERROR=0 to disable -Werror.
> - #
> -
> -+CFLAGS += $(EXTRA_CFLAGS)
> -+
> - ifeq ($(strip $(V)),)
> -       E = @echo
> -       Q = @
> ---
> -2.15.0
> -
> diff --git a/recipes-extended/kvmtool/kvmtool.bb b/recipes-extended/kvmtool/kvmtool.bb
> index cb09c66..acecb08 100644
> --- a/recipes-extended/kvmtool/kvmtool.bb
> +++ b/recipes-extended/kvmtool/kvmtool.bb
> @@ -13,7 +13,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git \
>             file://external-crosscompiler.patch \
>             file://0001-Avoid-pointers-for-address-of-packed-members.patch \
>             file://0001-kvmtool-9p-fixed-compilation-error.patch \
> -           file://0002-kvmtool-add-EXTRA_CFLAGS-variable.patch \
> +           file://0002-kvmtool-add-EXTRA_CFLAGS-variable-and-disable-werror.patch \
>             "
>
>  SRCREV = "0e1882a49f81cb15d328ef83a78849c0ea26eecc"
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

