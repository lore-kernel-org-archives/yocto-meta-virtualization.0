Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A5F4AE00C71; Fri, 15 Feb 2019 07:21:36 -0800 (PST)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8F2EE00B77
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Feb 2019 07:21:35 -0800 (PST)
Received: by mail-lj1-f196.google.com with SMTP id w6so3911394ljd.7
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Feb 2019 07:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=n3GgcDTtkWfo1WD6hFytK1ZGrcq8aFyEAx/Gw7sy6Cs=;
	b=HeYNaGA8lQ1x95BeJqqKa1Syogs6ILMM94ftLHB46y4rE//bF0jbRugaG39DvE2O8h
	LKml8/zXtIlkSQ+sVX13Ib6ydJwN6D7MrgiGdQNhB7YX1tBsP3L2zhY6+koAwbcgb4Ut
	dt6bmPqoeZ8jmN5VCXv7C1etiYe7yjjaTn8hsnL7kWfpysqSUI56aD32u6RhLOOvOvcC
	vP2fsFeaTe+fHz1wasq0cTpj1/EzkxUB33C0Op3jRxAZkvzIXkHq8/ENM325xLqvVJba
	48iS55EHtDbyd4Yxmu1THdY+8NVDU7/fugwNGa03V5qPZcSaAElonpLjQ4unAk//n53O
	JhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=n3GgcDTtkWfo1WD6hFytK1ZGrcq8aFyEAx/Gw7sy6Cs=;
	b=KbuyhvfXgGPoItOkVEkH3J9YqTH9CaD2YDY/BjNpJkwSP4VvuwKJi5VNehC1n6vaza
	LoIPdgroOrgwncJ4t+1/vcK2K8r8kpgaCd91CxFI0rsiUZUpbd4uZzke3lScoIW8H2+n
	TOL54WRElO45TDUitZbNdYs93sB857zDI4LTA0p7kdVZYCrCtJqQQPuwREZciEnb7gWb
	l4aWoZLiFeIc9GcR5j4vMvVwF2z7E9bfAiW6Cp9d8tHb6GHumva8lxz3pG2i9/K7oeJE
	857pnNTqgjsqueZLzz75dS2AGdtdTiMZ0VZEbpo48YZEuJw2Rw7rc4ETaTKvoRrZ/Nse
	tQ9w==
X-Gm-Message-State: AHQUAuYZa0c7KwDkIKOOy95wZ1fRB6Y1BLGvo95sPjC8p3MY/v0XA8aG
	4N+o0h/BRtO4+yi721ByiVrlfDaPRZFqy0RVyw3/0ykmjt4=
X-Google-Smtp-Source: AHgI3IYcg5sLeGDvEL5E6+TtsSgmW19Ti6zcYhgEuraFsKYg+cZj/9smXFepCL7PWD3K77f8ELsP21cY1DRUrnO2kcc=
X-Received: by 2002:a2e:8688:: with SMTP id l8-v6mr5799727lji.75.1550244094567;
	Fri, 15 Feb 2019 07:21:34 -0800 (PST)
MIME-Version: 1.0
References: <20190215145613.11794-1-stefan@agner.ch>
	<20190215145613.11794-2-stefan@agner.ch>
In-Reply-To: <20190215145613.11794-2-stefan@agner.ch>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 15 Feb 2019 10:21:22 -0500
Message-ID: <CADkTA4MLg=MaepO4R7b6LH1u=SyO0KXAA0oq5GFAj4ySvdhdQw@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: meta-virtualization@yoctoproject.org,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH 2/2] runc: address CVE-2019-5736
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
X-List-Received-Date: Fri, 15 Feb 2019 15:21:36 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks for the patch!

I'm touchy about runc updates, due to many hours of fixing subtle
breakage when updating. Can
we log all of the shortlogs between the two SRCREVs in the commit
message. It'll make tracking
down errors easier when inevitably I end up debugging something.

We need to take care of the opencontainers variant at the same time.
Yes, they are virtually the
same right now, but I'm keeping both recipes around since history
shows that I'll need them again.

Cheers,

Bruce

On Fri, Feb 15, 2019 at 9:56 AM Stefan Agner <stefan@agner.ch> wrote:
>
> From: Stefan Agner <stefan.agner@toradex.com>
>
> Use git hash which addresses CVE-2019-5736. Use the same git hash
> used in top of 18.09 Docker branch.
>
> Fixes: CVE-2019-5736
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  recipes-containers/runc/runc-docker_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
> index 41c82f7..4eb2d07 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -4,7 +4,7 @@ RRECOMMENDS_${PN} = "lxc docker"
>
>  # Note: this rev is before the required protocol field, update when all components
>  #       have been updated to match.
> -SRCREV_runc-docker = "4a600c04ed480084b2351b3e32c26cb4a2d5d533"
> +SRCREV_runc-docker = "6635b4f0c6af3810594d2770f662f34ddc15b40d"
>  SRC_URI = "git://github.com/opencontainers/runc;nobranch=1;name=runc-docker \
>             file://0001-runc-Add-console-socket-dev-null.patch \
>             file://0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch \
> --
> 2.13.6
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

