Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 93728E00C87; Wed,  3 Jul 2019 07:05:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3CA11E00BF7
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Jul 2019 07:05:08 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id r9so2576208ljg.5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 03 Jul 2019 07:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pAsFx5dku5tpUSsl6/s4F20p7gWPvFONUqHe/dr6O9Y=;
	b=Lvsdjvx6WpvNxw//omo1f5VTJznJST8N+pdwsurvcwDcXM+duhuh2LzESQdfufiQyn
	ZVAAEYn6liNzg0A+TsxE4IM6hEFknnn42IM2grjvu/1ftY2I804bMeqA7bqsFGKC90X4
	I20ngqZz5yS9gZqN74KebX4mVvXGJdiVFy1hN9N4HMbS0MhhQ3sZJGWKGnju5qQ+pTow
	suwgqioCpGFNDpvln+XaNTtb3XUukWvPppRqbdMzyMFQSZOR0WKqswHVNr5mnJGsSWSS
	8b5tg/3FDr8Kx8dRyOUqAb7+wyTiCY3p3aPkin1s/TzEgWOrpByaOl3VGI0uC8J87nZc
	KTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pAsFx5dku5tpUSsl6/s4F20p7gWPvFONUqHe/dr6O9Y=;
	b=XmDTPk7/OwMXfQJCe40BdXYholiE4RB/8J+W5KPpq4VnNb9FmLIJDGdrPxkBk6iGRu
	159WYO/UyOu38GT1Z6RLwyEgJehv0Ok1tGmYHU2TM6TguEaJMVH9etWhCFAYVQNSt4AJ
	er5dTXreDB9YYmF8jz0o5sBTbqUchjBO+hr05NIi8KK3HXuGwRAq0RpZ65+Jx/F8oM5X
	F70a/zSUg9J7k9P8nxjHcVg0IRaxwSyxrqCQNcVj0xO067JQ9xiQ4ZQ2usXAXZaQCbpj
	VCGE/UBKSQb/hNXHuDq3kSDNu0FDuUqKIGaQ2igBAuehXHZpwNLzI9Zylqs5Wg7kbIZs
	xPVQ==
X-Gm-Message-State: APjAAAUXD8Q9KLigsj/O7Kva0Fq6G2kwxcxik/e8TcxkI9QC8jn37p0P
	qQy42L+MDFiHcIzY+LtpvGQCtn4a++7DHeRjTmi/RY5c
X-Google-Smtp-Source: APXvYqzMj96oeRKnXvlyuhNwRihFtp2vTCrksJ1IUSXtaeUGYFSnpxW/u2nHgJ1V0vOzIZjUL3RRLaN8E8Bsv4HVnHQ=
X-Received: by 2002:a2e:93c5:: with SMTP id p5mr21031977ljh.79.1562162707267; 
	Wed, 03 Jul 2019 07:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190628121406.31777-1-stefan@agner.ch>
In-Reply-To: <20190628121406.31777-1-stefan@agner.ch>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 3 Jul 2019 10:04:56 -0400
Message-ID: <CADkTA4PdcRtad8gmBc-4QTOrkEDrLqeqyt+Erg2n-4yxHbzKaw@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: meta-virtualization@yoctoproject.org,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH] docker: make docker-init a runtime dependency by default
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
X-List-Received-Date: Wed, 03 Jul 2019 14:05:09 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Jun 28, 2019 at 8:14 AM Stefan Agner <stefan@agner.ch> wrote:
>
> From: Stefan Agner <stefan.agner@toradex.com>
>
> If docker run --init is used docker expects docker-init to be
> present, if not Docker fails to start the container with the
> following error:
>   docker: Error response from daemon: exec: "docker-init": executable file not found in $PATH.
>
> However, docker-init does not get deployed by default since commit
> d19fda374317 ("docker: consolidate common depends/options"). Readd
> docker-init through a PACKAGECONFIG RDEPENDS to make sure it gets
> deployed by default again.
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  recipes-containers/docker/docker.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
> index 168d296..eacaf7f 100644
> --- a/recipes-containers/docker/docker.inc
> +++ b/recipes-containers/docker/docker.inc
> @@ -32,8 +32,9 @@ RDEPENDS_${PN} += "virtual/containerd virtual/runc"
>  RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat"
>
>  inherit pkgconfig
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= "docker-init"
>  PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
> +PACKAGECONFIG[docker-init] = ",,,docker-init"
>
>  inherit systemd update-rc.d
>
> --
> 2.13.6
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

