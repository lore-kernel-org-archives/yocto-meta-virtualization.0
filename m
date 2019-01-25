Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 65CE2E00B43; Fri, 25 Jan 2019 05:33:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3CADE009AA
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Jan 2019 05:33:23 -0800 (PST)
Received: by mail-lj1-f196.google.com with SMTP id k15-v6so8364923ljc.8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Jan 2019 05:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ReyChyVZaOaj5BfgyWJaAVp1ej7pK2KySDh9Xhsw5lI=;
	b=SKeT82U1TYlwJYMyXW9hHeJmPGJHHkEBlabO2jVBHeAmmUr0NlmKF2KaK0EgrbvykI
	wy3Nxq5gda8iwJOAjTVcNViZtZyXwlWOlWbNQZMNbLCnjxizJjYkosKe2zG72xGtH4fC
	/JGUaRzr9JV9vhU++ACi4oY7/XmC1KSXkJWdowa1kwUC2O8xfeX3pRQ/Kh80/TCmQkXS
	lNyasHQPBoQ0bYgTc2PX6y+G79umHaRp5a/ALCO431Dkr8Pw7VI9MPEc9C7M+hjClyo6
	JvfqbCo0l+xF2RfMA2Q6vnXT9a8MPB0TWLg6K3qkONQ2fWynquaicAzZDqla0ARGBmFa
	PhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ReyChyVZaOaj5BfgyWJaAVp1ej7pK2KySDh9Xhsw5lI=;
	b=dns1Rvvs7MrIBlJGt7UhkvCauSr7naVEaeQqnxa5Pkc+ShL55wOEcb/aAu9F8RU71x
	V+wB+QCf5aKpzYGZ+1wU7ZyazeKqX0ekz0xQBcpClnsahdzngtpCwwbcBu0qvy7ShFo0
	Ala86YHdTfrcAYwGkioqaksDrdzrW6SmgwqD8x6uQYMNuGJN2q2GKOmyd4KXK/xkLp2x
	n2SNPI2CbEe5jO83SB4il+9txhArG7s73SqByMLu+LrJMjpI8pOLxTWofOePoTCFlfQi
	lvYbYBgRWl5lNRCP4zwHG+h9hFToeQiakYOS3KJz9XD2HaG8/691/4MAMJ3cCidrzOep
	8kwQ==
X-Gm-Message-State: AJcUukcHqWHHag9VQqqh54GqzciqTeZLMkJXqdbf4IRYj1r/e94uLgqF
	KOUmP9ufLkJhfZumz6DGnAY98b+iNtEBdKlBykY=
X-Google-Smtp-Source: ALg8bN4Cz++d9cCPzChpawAcyXh4GuiqzyoR2GJQqyCH20AKGFBZibGkjQFgzqrXGdS3AtgPws77oQFQkpChjuJS5ig=
X-Received: by 2002:a2e:551:: with SMTP id 78-v6mr9023032ljf.82.1548423202763; 
	Fri, 25 Jan 2019 05:33:22 -0800 (PST)
MIME-Version: 1.0
References: <20190125081027.36723-1-zhe.he@windriver.com>
In-Reply-To: <20190125081027.36723-1-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 25 Jan 2019 08:33:11 -0500
Message-ID: <CADkTA4OZ_jXgUpksZPacESv92p1BwcCeVRnEffhchhtk0WDt4g@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] kernel: Add bbappend for linux-yocto-dev
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
X-List-Received-Date: Fri, 25 Jan 2019 13:33:24 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Jan 25, 2019 at 3:10 AM He Zhe <zhe.he@windriver.com> wrote:
>
> linux-yocto-dev would also use virualization features.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-kernel/linux/linux-yocto-dev.bbappend | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 recipes-kernel/linux/linux-yocto-dev.bbappend
>
> diff --git a/recipes-kernel/linux/linux-yocto-dev.bbappend b/recipes-kernel/linux/linux-yocto-dev.bbappend
> new file mode 100644
> index 0000000..20eeba9
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto-dev.bbappend
> @@ -0,0 +1 @@
> +require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'linux-yocto_virtualization.inc', '', d)}
> --
> 2.11.0
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

