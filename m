Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 18CDEE00C7D; Sun, 18 Aug 2019 19:28:41 -0700 (PDT)
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
	*      [209.85.208.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7A58E00A49
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Aug 2019 19:28:39 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id l14so256733ljj.9
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Aug 2019 19:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hUrbVCR7FX9NgZ8a3TrhBXVXQeqPiRJ+Drq8U17z75s=;
	b=FwWfxPPblDJZFfy96TaVLbycGO3Miv7NEYQ93aIYU2ETaRmwLEOFEPDlcKfzNxWlgn
	CpWBpU3KLegpOBe9zGhF2btEsF7AT7O6niTlySfnz8fZKseHdpr4b+KWvdAsP0XhHvky
	B0wsCxgxmOHuZFccgwO6lKA5r5WY2UB5VgoL9njNORn3ZV99nb0IzhERk0j8tWWmfW0E
	bg4gMIKxJqzi0XlotQ8/AiqJr8IN8x8OYwoTK99SfOICzywKQNStDIAp1RnvhrtByAkW
	/pR7KR8bR6BgNbP8UjwzPaEVb9CAsWUMWYDMi1zSr4k1m24R9koPQFC7X2HRvYEwbCTg
	qZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hUrbVCR7FX9NgZ8a3TrhBXVXQeqPiRJ+Drq8U17z75s=;
	b=nF75XhMTCdngkIaCZ8uOmQa9Go1pe20AWC6k+EdwG4Mg5S7xGSui2HOEK91whscdVc
	SIwOmY5r6xeN+OaDNr6OfN/ltPgedZMqM/c0SPiH2KiZtenP8G7/oYiLCzBRrlkEWaj6
	wjCGiUuLW8g+AhgzP4rxEQn7Qfy2Eu/FzOlBq3a/95mB8SkgVewhfDVlN8tR2xtaz0/v
	LZbb0A6liYCorXUqQOhbTILulXUqbZiOCP78ZEVveM1gD4XQecvTPHWAO2JHiWLrvo/q
	AJckxP0/CTCLL0zdixIKS7FADTuyKyb+qqGYHy8AebcAIyzPN66kPMnvKA8VsU59zyQx
	B8Pg==
X-Gm-Message-State: APjAAAVelL+TONNqtXR24Zu6F/qoqpOv/k3Nrd7wxWRsqulBsXjbkXbm
	KQP2NheoLmeNi5FLAo7R6V1+Nf6EwRI57/2teeWenAhj
X-Google-Smtp-Source: APXvYqzE9CqgyjndJW/YElwrJMHGapbU0LiwllUCAwYW0I7SxPQmKSQ5teQsg9pgMmoIWvnV3Gx1e2wuHPEXsl+XSEs=
X-Received: by 2002:a2e:93c5:: with SMTP id p5mr10959505ljh.79.1566181718467; 
	Sun, 18 Aug 2019 19:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190813110609.14562-1-Qi.Chen@windriver.com>
In-Reply-To: <20190813110609.14562-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 18 Aug 2019 22:28:27 -0400
Message-ID: <CADkTA4Oqn062PAJpc79JLTk7OnrH-33kJT-D1a0p7_toMvGL0w@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] lxc.cfg: set CONFIG_VXLAN=m for running in virtual machine
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
X-List-Received-Date: Mon, 19 Aug 2019 02:28:41 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Aug 13, 2019 at 7:07 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> The vxlan module is needed if user or some software is trying
> to configure network when the image is running in virtual machine.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-kernel/linux/linux-yocto/lxc.cfg | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-kernel/linux/linux-yocto/lxc.cfg b/recipes-kernel/linux/linux-yocto/lxc.cfg
> index adaad3a..3fefc03 100644
> --- a/recipes-kernel/linux/linux-yocto/lxc.cfg
> +++ b/recipes-kernel/linux/linux-yocto/lxc.cfg
> @@ -30,3 +30,4 @@ CONFIG_RD_GZIP=y
>  # Support for virtual ethernet and LXC
>  CONFIG_VETH=y
>  CONFIG_MACVLAN=y
> +CONFIG_VXLAN=m
> --
> 2.17.1
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

