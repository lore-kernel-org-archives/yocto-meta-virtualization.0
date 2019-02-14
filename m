Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A1FDBE00C8F; Thu, 14 Feb 2019 06:22:08 -0800 (PST)
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
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.169 listed in list.dnswl.org]
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA091E00C75
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Feb 2019 06:21:41 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id j13-v6so5401890ljc.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Feb 2019 06:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WUFPK0QWpwDDV5a6KaamNB/iEprpLvmBQg/FcSyqG54=;
	b=Ob1ITGqNb6Jpim7rF67evP67/dHaZnO1xFUGwO8822uL66WLSDHj78fctxfku9QsS4
	1mP4yngCLVQ3ub2y4v+T1jXX+Av2WmuSrX3nytSUwANDfYx4ThcvMu4a1MD5NN8O3jaL
	ytH3qrKYjEG2muC0JsnO9gnaRjD5WAtfCJRywrinhvoAU8TTbB2XzywexIelJK954MHE
	d8A8oWmtbWGcbdshEE3AXh36vEfxuZoZpCJX6oy+613LHS4hbFtKhBFTuIlP1R14KJRY
	Ha8HqUDpWi67Rc5Kp3JAj7SDmRCPlxZavfI00oYFnHTU7G0rIVP+VDBi0s6YcokbqH+e
	kryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WUFPK0QWpwDDV5a6KaamNB/iEprpLvmBQg/FcSyqG54=;
	b=ZWXpJFpJIQf5AQnGsrUO/sUfJL+ifRMGnOvAc7Fgj30gDRPWJ4qTcrMpXObeE3YM7L
	GJ6I/wJj70XhujYZKswU8wPsE8Ul3xP2vucweyEJoXFtunKrZN4LODmpg78bBmIdBxvO
	JZdqWvPXne6iJ2YqrhTnUCQN6ZE4GW5setTjcBCxHci50hxn5sLZYGLwdM00hCDgTiMp
	P06dS6xfYPQhLt+N+5LpM5puQeWYiJ4WHWUpj1/7qkjmdkfQQf5gy3OfFxLBas2ooA9+
	L0/yMkKFGYpPlU5+ss6ha8TIkCxCJhKCYV2SYju7LpDHV5YGqVB3UZzC6LAKTcHEkVtu
	tLeQ==
X-Gm-Message-State: AHQUAuYCb+lZByHax62G3G4eTIoS/uWrFni+Ileis8gCK1/Syu0PXksK
	+plZzURcdh5+u5S5YCXlU1KNnUx/pPuWAaMfzH8=
X-Google-Smtp-Source: AHgI3IYSiKsO3aWeUC83TnxtQevOepd6OuOUNcS2tGUY33eU9jDz5qpbOtBslLBCzP/s6Wgdg8z0ZW9kn6UwEx6C9Ik=
X-Received: by 2002:a2e:7316:: with SMTP id
	o22-v6mr2583705ljc.82.1550154084295; 
	Thu, 14 Feb 2019 06:21:24 -0800 (PST)
MIME-Version: 1.0
References: <20190214092109.9468-1-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20190214092109.9468-1-hongl.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Feb 2019 09:21:12 -0500
Message-ID: <CADkTA4O6n1kuc=P5vaE4s98S0uVsE1KB1W03zmAbO_tt8pjgSQ@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][patch]:python-amqp:upgrade to 2.4.1
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
X-List-Received-Date: Thu, 14 Feb 2019 14:22:08 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, Feb 14, 2019 at 4:20 AM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> Upgrade python-amqp from 2.3.2 to 2.4.1
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-amqp_2.3.2.bb => python-amqp_2.4.1.bb}     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-amqp_2.3.2.bb => python-amqp_2.4.1.bb} (68%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-amqp_2.3.2.bb b/meta-openstack/recipes-devtools/python/python-amqp_2.4.1.bb
> similarity index 68%
> rename from meta-openstack/recipes-devtools/python/python-amqp_2.3.2.bb
> rename to meta-openstack/recipes-devtools/python/python-amqp_2.4.1.bb
> index 395c81e..dee95db 100644
> --- a/meta-openstack/recipes-devtools/python/python-amqp_2.3.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-amqp_2.4.1.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=9d6ba772ac59c08a25a12ce15bd5f27b"
>
> -SRC_URI[md5sum] = "11fce0d01f4ee6886a02415c20cece80"
> -SRC_URI[sha256sum] = "073dd02fdd73041bffc913b767866015147b61f2a9bc104daef172fc1a0066eb"
> +SRC_URI[md5sum] = "9e3d5f1f69d2106c2b3f77d275a79924"
> +SRC_URI[sha256sum] = "6816eed27521293ee03aa9ace300a07215b11fee4e845588a9b863a7ba30addb"
>
>  inherit setuptools pypi
>
> --
> 2.17.2
>
>
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

