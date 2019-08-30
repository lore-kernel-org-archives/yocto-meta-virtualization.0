Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 80965E00C4F; Fri, 30 Aug 2019 05:42:49 -0700 (PDT)
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
	*      [209.85.208.170 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 71079E00C4F
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Aug 2019 05:42:47 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id m24so6344038ljg.8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Aug 2019 05:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JpEETvAGlSOCxyqKPEf5v8/h9teiWcMaAxBhOBSke7w=;
	b=CVx2SDZTHjQE3G78nszuo0gsYqlHxtSxYN0UwGls9zEmFWlHAOLnKQbT11uloEkH1O
	1IbZrLxyWL7EM53A5VcKgdxP6KqABvtlX/9DXmc95oNP4HJMDnKGairjLcEcT+14Xybv
	KlterKZAZ0PyqLxfLfUY998MbcsCHeVMsTb74c+Bb8DTVj/zx+KkcWvGNS6DK7Mq+y4U
	RVSo3Ou7XdkC7ecbF50o/1J/txZuMHhkrJnXDJJRNtSItz89jXb7jFn4xf6YJN1PPS3Z
	LnfKo3+9qBjq5dqG7/hpi6bjKgj0RpNei5Q0hsNg1GLdDW7cZfCMwFg1sc5/6FTmUcEB
	NSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JpEETvAGlSOCxyqKPEf5v8/h9teiWcMaAxBhOBSke7w=;
	b=cpyAVhSFkkqKElJOco8cjd105GgTwaXG6u7MGn4QWv8dW70OBe+MdNyFV1lysT0L3R
	88+TncVUn9GYcIck/I2ZJwCmr8s8BimZegZP/oZUHjc8+LC2LRNRCMFnrWCkMEnbWU/X
	2xx5So1h7jbaKwVkoGO3GvpcuJHNgw4AEhfDboPfxmzW6Pgqg3BKw91e4ZqMMrWmVYkw
	XfrdYI9OuXiMewKo87+aEvMbyOqPfFqlSLM/MofNTW0LSZTTtA4DJOiD03cJjZhhhT3v
	xTXggGQ3Jq2UqiAWDp3Z3+42RqWPcDZx+piLrh77ycm5/QhAyOFkouQl9xfYcOll2AAP
	/Uww==
X-Gm-Message-State: APjAAAXhQOizMmYl848uIFqP6ZF5tMSA21HYP887RGl1i+rTfNjQ2PJs
	peP9NvAQ8CChMkgwvNKJFeM3ngw3+sA0UkTYHi0jjTH6
X-Google-Smtp-Source: APXvYqziqfw5i3CJgal1jpv8gROuGVmLGKUOQpuuMbGO490tfGf5Aro9CwIQ6Hm0FQ4AbNtc7hzX/OFtm1F8/PD57Z8=
X-Received: by 2002:a05:651c:1111:: with SMTP id
	d17mr8220604ljo.87.1567168966110; 
	Fri, 30 Aug 2019 05:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190830113203.49678-1-stefan@agner.ch>
	<20190830113203.49678-3-stefan@agner.ch>
In-Reply-To: <20190830113203.49678-3-stefan@agner.ch>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 08:42:34 -0400
Message-ID: <CADkTA4Pvxdk3bzOo2xP4-SUGwF=EeCnq9yAo3egeKrT9iO8sKg@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: meta-virtualization@yoctoproject.org,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH 3/3] docker: update to v19.03.2-rc1
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
X-List-Received-Date: Fri, 30 Aug 2019 12:42:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 30, 2019 at 7:36 AM Stefan Agner <stefan@agner.ch> wrote:
>
> From: Stefan Agner <stefan.agner@toradex.com>
>
> Use the docker/engine fork of moby which provides a stabilized version
> of moby in its 19.03 branch.

I've mentioned before, this recipe really is going to stay on moby,
not a curated version of moby or anything like that.

I already have some queued updated to docker here, so I'll take care
of updating this recipe and stack your other patches on top.

Bruce

>
> Bump all git hashes to what is used in Docker CE v19.03.2-rc1.
> The SRCREVs are selected through an audit of moby and docker-ce to
> synchronize the build points for the various components.
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  recipes-containers/docker/docker_git.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> index e45f87e..3892c65 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -35,11 +35,11 @@ DESCRIPTION = "Linux container runtime \
>  #     to a docker.inc recipe
>
>  # moby commit matches the docker-ce swarmkit bump on the 18.09 branch
> -SRCREV_moby = "344b093258fcb2195fa393081e5224a6c766c798"
> +SRCREV_moby = "ed20165a37b40ff1cfbe55e218344c5e89f30ee2"
>  SRCREV_libnetwork = "5ac07abef4eee176423fdc1b870d435258e2d381"
> -SRCREV_cli = "2f1931f9eb2d6bac2efd48d94739f2e9919d4d7d"
> +SRCREV_cli = "578ab52ece34b084621954e0b543003410cdbe84"
>  SRC_URI = "\
> -       git://github.com/moby/moby.git;nobranch=1;name=moby \
> +       git://github.com/docker/engine.git;branch=19.03;name=moby \
>         git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork \
>         git://github.com/docker/cli;branch=19.03;name=cli;destsuffix=git/cli \
>         file://docker.init \
> @@ -57,7 +57,7 @@ GO_IMPORT = "import"
>
>  S = "${WORKDIR}/git"
>
> -DOCKER_VERSION = "19.03.0-rc3"
> +DOCKER_VERSION = "19.03.2-rc1"
>  PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
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

