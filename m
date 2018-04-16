Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 583B4E00AAF; Mon, 16 Apr 2018 12:36:49 -0700 (PDT)
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
	*      [209.85.215.50 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40A07E00843
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Apr 2018 12:36:47 -0700 (PDT)
Received: by mail-lf0-f50.google.com with SMTP id d20-v6so23830766lfe.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Apr 2018 12:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wV+5gS3xshoo1W73W1wASUj/zCy7z1MznbSnxPvjce8=;
	b=JE3tklibf2TmFH2JVYvNikFgT72QNr+Pl54hADSXfRfH0SygOeVaMrPju22M9PkvCY
	Nz3YSbFE/cbjJ507Fj3jHykHHvijXlYQbTNNlDBGBWrlCuL79PZqlmjYspa+rIaSkVfx
	hM5RODw+ygjP5DqsXVDmHK2a9crEJeg02C2DUj2ri0kBu71JmhXRsOIlVlX26Wu/Ve0w
	LR5XQSJ5GltGUb/2HUlehqXoD9n0jDMtiKvhrE9gZcDQNu05r9Hng0DDLSni2MYan3HG
	vcUqY4Z0/uSOmjJ2w3AIL99DXZ9r+IPADPUalT+jN4RF12TLgcTwFrqAA2ZyJOj2BCiz
	NWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wV+5gS3xshoo1W73W1wASUj/zCy7z1MznbSnxPvjce8=;
	b=HqnGFFmTaUSOSXdTSOVQ1OXxeujFNLW15Qy3Dqcdx2yP4CiQmk0pVUFavBENknG6l5
	MGFMZxAngmYxp1KwfIrzdPQQ35cPdXGWidCLQkkZKRksaHp0nXE9LnQ167kwqGcLY2qx
	2wH9ihJliEwnfygUwwNB6qOMJHN3lgUZsulAxhbL6Cmt28vDu547H7g1iloh8eNbV2AU
	ywqUbIxMGeYBc6ATpTcuEaQeIP56JDjivzUaMQgO5u6PccxW3eABqEEDgsAjk5Up4yi6
	P4D6XEjMU/1WHND34mkwCsRpGos7d9hFxRqMlqzalNKailB3/f3CDka2KfbxOXVn7z40
	HfvQ==
X-Gm-Message-State: ALQs6tDTrRNnONA7ly2jGGGNtT67uvVklxgFc306zzSIgvVC4JFYgYcr
	nNa9JFm5EUBHkrmNFuJ4pD35kqSHSQI2Bp/mOX8=
X-Google-Smtp-Source: AIpwx4+kAZgfytN/NcP7uN4RoUn4ety8fZrwPpDOBGnPIpY5TgE1Hd3Lc31vnqfuFL2/QwMAE809lnjjuC+YjxuZSXk=
X-Received: by 2002:a19:8d0d:: with SMTP id
	p13-v6mr16286797lfd.126.1523907406792; 
	Mon, 16 Apr 2018 12:36:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.2.22 with HTTP; Mon, 16 Apr 2018 12:36:46 -0700 (PDT)
In-Reply-To: <4a9c58ef-c00c-c113-ccfd-11e823c593f6@gmail.com>
References: <4a9c58ef-c00c-c113-ccfd-11e823c593f6@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Apr 2018 15:36:46 -0400
Message-ID: <CADkTA4OBw8Cyvw=2WqOzQX0uratTtCpR+WXvmK=7ob97r+qfmQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Intent of cri-o recipe
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
X-List-Received-Date: Mon, 16 Apr 2018 19:36:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 16, 2018 at 10:39 AM, akuster808 <akuster808@gmail.com> wrote:
> Hello,
>
> Was was running the yocto-check-layer sadly over the weekend and one for
> the issues it note was:
>
>
> ERROR: Nothing PROVIDES 'ostree' (but
> /home/akuster/oss/maint/meta-virtualization/recipes-containers/cri-o/cri-o_git.bb
> DEPENDS on or otherwise requires it). Close matches:
>   tree
> ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'cri-o', 'ostree']
>
>
> From what I can tell ostree is in meta-iot and a few other layers. Is
> the intent to include one of the other layers as a requirement, include
> your own copy of ostree, do a dynamic layer thing or something else?

One of the backends of cri-o is ostree, so yah, it is more of a custom
configuration to put the outputs of that recipe into use for a given image.

I should put more info into the README for the layer, and that you can
get ostree from one of the other layers in the oe ecosystem.

I ended up needing to make my own copy of the recipe into meta-overc,
since the layers in question were making changes (or the recipe wasn't
causing me other issues), and I need to revisit that.

Bruce


>
>
> Kind regards,
>
> Armin
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

