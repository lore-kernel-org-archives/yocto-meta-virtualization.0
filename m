Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 95463E00D79; Sat, 16 Mar 2019 17:23:22 -0700 (PDT)
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
	*      [209.85.167.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EDE36E00CAF
	for <meta-virtualization@yoctoproject.org>;
	Sat, 16 Mar 2019 17:23:21 -0700 (PDT)
Received: by mail-lf1-f68.google.com with SMTP id p1so9241873lfk.9
	for <meta-virtualization@yoctoproject.org>;
	Sat, 16 Mar 2019 17:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1AM7SGxvAngZC4wrlwXViiseKo4ISrCcXZLBYI5WZvg=;
	b=cPgRJmxilmGZz+HcZGvdaQLsPXMVc/lm7E5TiVG+A0krr4CTccPK2hHZ7umpO0jyBR
	q40r8qjs77N+qtHBcU4JLyOm0F8LLXJ3OhiqKzvUgoJKs+B/bD9rAhO6PcPafYLoatgI
	Vx60rhG134q4wRjarmmviwAfsdkTtTZBPk9mKQuCdlXdLSYRxicGnGkDvuouv0AzLpRc
	IGwEQGe0imnqRiNnkT1GFatoM+vUii5Lh7p1pjbnYgCs9YCVQyX5jAQ2FbTySF/QiNTO
	EzLpwmEuvpdKls1Ec1BOQ0mbYaKMBc1BCWnI98zNGAh0wS2GcnoVslSfq+ttpbot9Yz8
	Q7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1AM7SGxvAngZC4wrlwXViiseKo4ISrCcXZLBYI5WZvg=;
	b=pezGSDI5Byj+PNLRpk9CjsAybEuh/GHgVXAoC2sMiTTWhvgF4yyG1jlvg+MnWfAkmL
	/iZzamXAWFmHRwJgK+vwaRTlfFPnqupBTE8DUyNbY+T3jkeRUoWWjf+7S4fyO7P4KEUB
	lrZvdzuhMos9H4eivccB173L4AJWwI49EOcvPMUYBfZbMUNCDFtJBMBodQqN5Wjc9W26
	nPiaCf+oe9sc8QYuP7zz2LZK3+NSSkiF0yeJCFt/E1hi+9JkVtY/W4y1zVBbRG71Q+JE
	2fw9d/DaCfLSg+/J0HfQmcXg0gLO9yDUDvmXMq29Jv045QM+qXSm+mW36j1CgbXXbmMt
	7Yqw==
X-Gm-Message-State: APjAAAXb3DrQ8cDgLwbdonT3AQnJRt/qgDCejZUogac2LeRL1VCdvKRe
	lfGL3IZRcaZLalBcrMFK5Rlrb6yZonl5j1XinGM=
X-Google-Smtp-Source: APXvYqwgi9u5rkChHY+6ZsRbap/je2o9u1dNJ/cMDBFB2FyItw+DLE5+MHBPJ0zYL28OTB1fk/r3GeYMcJhDhfUMmYY=
X-Received: by 2002:a19:598f:: with SMTP id n137mr6325401lfb.140.1552782200913;
	Sat, 16 Mar 2019 17:23:20 -0700 (PDT)
MIME-Version: 1.0
References: <1552619065-53429-1-git-send-email-zhe.he@windriver.com>
In-Reply-To: <1552619065-53429-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 16 Mar 2019 20:23:09 -0400
Message-ID: <CADkTA4M1FbJe9VZhNW-pw6gzqvhwQhQG6XyFKvnYtWg9Mi414Q@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] lxc: Correct CONFIG_CGROUP_NET_PRIO setting
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
X-List-Received-Date: Sun, 17 Mar 2019 00:23:22 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Mar 14, 2019 at 11:04 PM <zhe.he@windriver.com> wrote:
>
> From: He Zhe <zhe.he@windriver.com>
>
> Since af6363374cbd ("cgroup: make CONFIG_CGROUP_NET_PRIO bool and drop unnecessary init_netclassid_cgroup()"),
> CONFIG_CGROUP_NET_PRIO has become a bool option. Forcedly setting it to "m"
> would end up with "n". Change it to "y" here.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-kernel/linux/linux-yocto/lxc.cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-kernel/linux/linux-yocto/lxc.cfg b/recipes-kernel/linux/linux-yocto/lxc.cfg
> index 9ff49f1..adaad3a 100644
> --- a/recipes-kernel/linux/linux-yocto/lxc.cfg
> +++ b/recipes-kernel/linux/linux-yocto/lxc.cfg
> @@ -15,7 +15,7 @@ CONFIG_NET_NS=y
>
>  CONFIG_NET_CLS_CGROUP=m
>  CONFIG_BLK_CGROUP=y
> -CONFIG_CGROUP_NET_PRIO=m
> +CONFIG_CGROUP_NET_PRIO=y
>
>  # Virtual drivers
>  CONFIG_HVC_DRIVER=y
> --
> 2.7.4
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

