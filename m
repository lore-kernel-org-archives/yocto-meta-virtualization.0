Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F21BEE00982; Wed, 10 Jun 2015 13:34:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.53 listed in list.dnswl.org]
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82CBAE0086D
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Jun 2015 13:34:04 -0700 (PDT)
Received: by yhan67 with SMTP id n67so25550666yha.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Jun 2015 13:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ec7+iiWcWGNBzu6X91oV/jqf8RzGYImdcfvrLCL9J5g=;
	b=lDR//aRjU1k21Jx3UzQJHOYezAktff5QO4vs5ebH4F4DjuzWIh50B2lzoXuG1bcQhm
	bv21RoRdrE6b/otv4TZC9tFgFruiz7SBSdmmkX+61P5MTbJav9GChMl3XI9t1v7lnTp/
	ggG6MnsxHMyqQvQkHDEL5kRgbyonM5jPgD3+UoP8jIuB8zvDWjMoS28a8JDssVwpdDU3
	VLLL3PIioAXmeoH/QHq3uImCvUM6Dd6OPY5iBcPcW10I0WopJNvnWxOhdTR6P4BlIASQ
	+ce1bCdVmfNCixMLox+ie8uMi4PXGsGylo0DffkeuuGtdaRwC2hk0Rwfws2cTgslVtAg
	3NQQ==
MIME-Version: 1.0
X-Received: by 10.170.84.215 with SMTP id b206mr6796506yka.21.1433968444336;
	Wed, 10 Jun 2015 13:34:04 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Wed, 10 Jun 2015 13:34:04 -0700 (PDT)
In-Reply-To: <001701d0a2a0$ec4b2880$c4e17980$@windriver.com>
References: <001701d0a2a0$ec4b2880$c4e17980$@windriver.com>
Date: Wed, 10 Jun 2015 16:34:04 -0400
Message-ID: <CADkTA4Ox8xXXxk3tZhK_RWJ=UjER-uwQ0tbEBhxusGtaaGxkaw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Daniel Badea <daniel.badea@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] tgt: update version to 1.0.37
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
X-List-Received-Date: Wed, 10 Jun 2015 20:34:11 -0000
Content-Type: text/plain; charset=UTF-8

I tried to apply this .. but your mailer has corrupted the patch.

While it is simple, and I could fix it .. there's much more value in
getting your workflow fixed.

The headers show that this was sent with outlook, which likely caused
the corruption.

The README has the information for using git-send-email:

-------------------------------
Send pull requests, patches, comments or questions to
meta-virtualization@yoctoproject.org

When sending single patches, please using something like:
'git send-email -1 --to meta-virtualization@yoctoproject.org
--subject-prefix=meta-virtualization][PATCH'
-------------------------------

If you did send this with git, then we need to figure out what else may have
corrupted it.

Bruce

On Tue, Jun 9, 2015 at 6:42 AM, Daniel Badea <daniel.badea@windriver.com> wrote:
> Signed-off-by: Daniel Badea <daniel.badea@windriver.com>
> ---
>  meta-openstack/recipes-support/tgt/tgt_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb
> b/meta-openstack/recipes-support/tgt/tgt_git.bb
> index 7796418..fe34858 100644
> --- a/meta-openstack/recipes-support/tgt/tgt_git.bb
> +++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
> @@ -4,8 +4,8 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM =
> "file://scripts/tgtd.spec;beginline=7;endline=7;md5=21c19ea7dad04648b9c2f791
> b6e29b4c"
>  DEPENDS = "sg3-utils"
>
> -SRCREV = "0ee382bab57a8ecd9ece18d511bd098298478409"
> -PV = "1.0.36+git${SRCPV}"
> +SRCREV = "3f779c0338fa7a97d5d0defbdb3ad06167b791d3"
> +PV = "1.0.37+git${SRCPV}"
>  PR = "r0"
>
>  SRC_URI = "git://github.com/fujita/tgt.git \
> --
> 2.1.0
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

