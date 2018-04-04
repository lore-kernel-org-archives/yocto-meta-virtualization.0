Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E8CCE00BAF; Tue,  3 Apr 2018 20:25:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE9FDE008F2
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Apr 2018 20:25:22 -0700 (PDT)
Received: by mail-lf0-f67.google.com with SMTP id m200-v6so17388961lfm.4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Apr 2018 20:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1znRG6bRn8MQ/XQ+Wur00jMrOVN3SzZaU4gU2Eq2ciI=;
	b=IX2gxpRlt1DTnltbIul6Iw+mT2Lk6TrdseaYhxPquU9wz/ASzIVWinpT1fQaTJ6SwN
	T9uW+XoxVahaWRQkokLKWp9P2D2v0fjkeBgZnaA+KHIAXuoT6H495p3HpV5ShOUZTvNI
	7wzWzAYmS1yW3jiHqIs3dcT7DYFeHCV/NqHJ37tIqZrMPaKBACOlBnIWMDOnei5zwPHs
	I+oI16Czuo9NyzLWA5fXW0vMSI+s4kIk6KDvdBejfhPlxF2CSJoptJtf/GUW3zEBZDmA
	P44mUKDzMm7CDM3rjJJTkEgh5BpyjupS7N4LI4w7m8I8O/8p5KSkLc2VZCSxkXtkkDU7
	G8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1znRG6bRn8MQ/XQ+Wur00jMrOVN3SzZaU4gU2Eq2ciI=;
	b=s9SOJ+uixUyZAy9s1zyLBmUIxwGIpo8OI4TVkeqlqe8M1XBHopCxIjQOZrq80WV4JB
	yBI8y2Fn3n2meH3TtcC/uwn0fLV+YRA0buhudsbVLLxmedpzFcJ4Sg5x/OudIlgXBwmO
	EX+razcgUlDWvtBD5lulDqD5IsitNrWCpb4voaYKoRGOjwirG8bAT4TwjeBnyCLQouGH
	6rEtKoK6LyIdZ5Au9wVIQt/5ERUcgXAkX4Tl/hbUtoloXNnFwC4nje40UOYpf/dEcth9
	5J22FF79hMEzow14CQLdkVtdVwV0UYVBak2/AXlXTljksErg6ocY55f3uufZAHTy5reU
	0hsA==
X-Gm-Message-State: ALQs6tADIoH/d0snemdHigt6kQu6PR+upbktSG/TDhNw/v/jwZRrc92B
	L+k9Zhy+FjisiTHBWevH8MXJKddkcA53RA7eLqJhCg==
X-Google-Smtp-Source: AIpwx4/dwOVDcx92LIbp7rFrCd5BiOXDkOCpmfPoFBttWcLRf+TsyqqJxH17bp2My/zp1mvs7vPo0Tv7F6F+spFDFPA=
X-Received: by 2002:a19:511d:: with SMTP id
	f29-v6mr9772543lfb.39.1522812321728; 
	Tue, 03 Apr 2018 20:25:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Tue, 3 Apr 2018 20:25:21 -0700 (PDT)
In-Reply-To: <1522402120-7482-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1522402120-7482-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1522402120-7482-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Apr 2018 23:25:21 -0400
Message-ID: <CADkTA4MoyGMug6Mk6iNymsVGPGKpUD1TpJPU-RmMm=-kV-VXSA@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] python-waitress: 1.0.1 -> 1.1.0
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
X-List-Received-Date: Wed, 04 Apr 2018 03:25:25 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Mar 30, 2018 at 5:28 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade python-waitress from 1.0.1 to 1.1.0.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-waitress_1.0.1.bb => python-waitress_1.1.0.bb}     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-waitress_1.0.1.bb => python-waitress_1.1.0.bb} (62%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-waitress_1.0.1.bb b/meta-openstack/recipes-devtools/python/python-waitress_1.1.0.bb
> similarity index 62%
> rename from meta-openstack/recipes-devtools/python/python-waitress_1.0.1.bb
> rename to meta-openstack/recipes-devtools/python/python-waitress_1.1.0.bb
> index 49c637b..f85f3a4 100644
> --- a/meta-openstack/recipes-devtools/python/python-waitress_1.0.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-waitress_1.1.0.bb
> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
>
> -SRC_URI[md5sum] = "dda92358a7569669086155923a46e57c"
> -SRC_URI[sha256sum] = "2daacaece189ede6a23440afe03bda58089a6207f1d80a1e9497f979dfb741fc"
> +SRC_URI[md5sum] = "0f1eb7fdfdbf2e6d18decbda1733045c"
> +SRC_URI[sha256sum] = "d33cd3d62426c0f1b3cd84ee3d65779c7003aae3fc060dee60524d10a57f05a9"
>
>  inherit setuptools pypi
> --
> 2.7.4
>
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

