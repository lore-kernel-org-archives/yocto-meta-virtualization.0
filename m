Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6CB87E00D82; Wed, 18 Sep 2019 10:52:15 -0700 (PDT)
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
	*      [209.85.208.175 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1CEFBE008C8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Sep 2019 10:52:13 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id h2so861101ljk.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Sep 2019 10:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3bvhh6xzGHiioaHpyvZkF2pXrcWyFY4Ql38tJoTKDVE=;
	b=cVeiOUHBjBEcWT5uW4PGpw3cztdY3vfhb6j41oEZXDX0CrpqHQN6Xqi/h+JyYb4GAU
	k9GRCpe+EZpOIHVlr8xKzGoC+PRMFqJJ7955rVvgurmTCbsijX7znv64nHXkMEudhd0+
	IAD7qLOYuGNi2VIFX588FDTg5FVnJeZ6/SZH6p4bY6JJoXhEMhtVLEP/QU2FJAZTNK8T
	uyqnrMElH38zFYMrDJ5xHvyx7CrTxEWdMfpuiLNJ+lim1fCQgRyBinZddaIZQ+Lc5KQt
	CxLsb7FLW87GJ4kvOio3cjwix9U9+QGvP+AzB3QAPG3BQcZL7wl8CipWIftbl+tDC1Ab
	WiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3bvhh6xzGHiioaHpyvZkF2pXrcWyFY4Ql38tJoTKDVE=;
	b=nkHX4wzu4NQNFzQzGe08/SbJJJtMn0hrX6w5UDngk1W57ZtShz0KpslcAv5ngSL9Yt
	PW5WAP7ZPHYpnww3mU67JBr3NUhlaf+zAenu0+60y1YHo8wdtBTJdOdlK+33uFLZ6Y6y
	z3Vz1RxfQdvO1yJ3V2+E1gC6kCkzdMjyhWIsBHnfIEz+0PrX84OtPUrJu26mphWdQ0uP
	MyrA+Z62BpWb2/FX+9nKrTwfidS4AOG1WAa+i5a8dUg95z3SNKH2gIuJrJ4BcJNkfwDh
	GgNLn8C9XD1M2rqlg0CAm4O/fCBRzSGPQJJJ9wL+p1as0EItlWq9xGQNNYuf3/RlwhUu
	DvLg==
X-Gm-Message-State: APjAAAWp+vaAk59uOoUizH0gY9tFxIJlPfsenPkYZ1cVZJ5oN8V6elqv
	ykgjFJIG6XYBKG++pXp5Uz0YRkrF+RmaiBXiDzHus67WxHw=
X-Google-Smtp-Source: APXvYqzrVogGUgM/RaoYhg9YFGQEBGWgC6dqEMEsqmY4xcby6CoMalPLAoWCT89+8e3RHw/EBoRJYiC4151JpEoRx2k=
X-Received: by 2002:a2e:8594:: with SMTP id b20mr2797839lji.232.1568829132853; 
	Wed, 18 Sep 2019 10:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190918075841.2099-1-stefan@agner.ch>
	<20190918075841.2099-2-stefan@agner.ch>
In-Reply-To: <20190918075841.2099-2-stefan@agner.ch>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 18 Sep 2019 13:52:01 -0400
Message-ID: <CADkTA4M5cj=8XOjP=nri6Sec8nP1xY-zmcvaE92rUyS__PWkCg@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH v2 2/2] docker-ce: update to v19.03.2
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
X-List-Received-Date: Wed, 18 Sep 2019 17:52:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 18, 2019 at 3:59 AM Stefan Agner <stefan@agner.ch> wrote:
>
> From: Stefan Agner <stefan.agner@toradex.com>
>
> Bump the git hashes to Docker CE v19.03.2.
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
> Changes in v2:
> - Bump to v19.03.2 final release
> - Drop docker (non-ce) recipe patch as that recipe can not be bumped to a
>   Docker stable patch release

Ack'd. I'll take care of the moby recipe shortly. I've pulled this in
for testing.

Bruce

>
>  recipes-containers/docker/docker-ce_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
> index 215f114..52b146d 100644
> --- a/recipes-containers/docker/docker-ce_git.bb
> +++ b/recipes-containers/docker/docker-ce_git.bb
> @@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
>   subtle and/or glaring issues. \
>   "
>
> -SRCREV_docker = "2416d7f930859912c883f964b1cee6909635f951"
> +SRCREV_docker = "6a30dfca03664a0b6bf0646a7d389ee7d0318e6e"
>  SRCREV_libnetwork = "5ac07abef4eee176423fdc1b870d435258e2d381"
>  SRC_URI = "\
>         git://github.com/docker/docker-ce.git;branch=19.03;name=docker \
> @@ -38,7 +38,7 @@ GO_IMPORT = "import"
>
>  S = "${WORKDIR}/git"
>
> -DOCKER_VERSION = "19.03.0-rc3-ce"
> +DOCKER_VERSION = "19.03.2-ce"
>  PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
>
>  PACKAGES =+ "${PN}-contrib"
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

