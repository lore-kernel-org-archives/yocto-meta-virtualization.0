Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EC81BE00C6D; Wed, 16 Jan 2019 07:29:26 -0800 (PST)
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
	*      [209.85.208.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0D98E00BF9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Jan 2019 07:29:24 -0800 (PST)
Received: by mail-lj1-f195.google.com with SMTP id q2-v6so5761983lji.10
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Jan 2019 07:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9FaMoqqj721gJWyzNZsGjqZ5t3ofTNvbZVGD0LOG3rM=;
	b=mQXStrJ6FezTXZ2jUXzvctgJTa7jYG/RlZfR7/k/V9GfoLqMN61/0C3GpEveBtyTv4
	ZVvzL1rpcSYAZPwI6aYdq01M17HoPhF/JapwOkf/3dshkUaevUwyIMib30bmzgNf0x8A
	nJ0EDzYYdp8O20mIzz6qEotjGHzp4Job9IOfn/0Q42kSiXqGUC4wEW+b3/d8zJjVfVG2
	bpqBj1f+F67azzPm6KkOuDq236xA/5NXa65T+dGdaDSJrJ3tXns+ENqHXQXkw2lqiYJW
	ODCC9x36fZcsUDtNklC6WI/zryj0HpbCVCeQtpBwowu/9RMJbZN7MQTw87NR3t2LVbSb
	4gIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9FaMoqqj721gJWyzNZsGjqZ5t3ofTNvbZVGD0LOG3rM=;
	b=Rn89Oynl1CdehtFVjbR76YhXqHYslh1Iyhg4wDElyvAeCTXy+yS4t66R+Vr+wottEq
	o/HmEboOKFqJQO/GCHdb1fW6wTxkUTIRdTPuVZ4cldFJ7kAv0YRW43jP02uccXs44Jiz
	w3S+q7hwjwxa0gXxV/J3WT/oOvAp+hLmFdZmUNsU553TCb+HWj6zIWEYKxKaFlKlGQCp
	gpkb6/Bs6n0lTp5hzfAwIDx3GccNtDGeaqj/Nz/smGG0a7VT8iwDbb4/NVinuJuXl9FJ
	ts1hHlqQNo5UN9ixgrNey7RVXuGKZAEX7GUeAsnTx0OmjSZFhoikFru7aSEUcTicxUZ5
	XabQ==
X-Gm-Message-State: AJcUukcS8mB5xjiAJ8HG9sLEOKXkgKCqovgnrcywOf0YdVMZk9h9XOsg
	JQ4UDYo4v3QFnkTpVnSpVjhSWcG3x+1b5x4iaCg=
X-Google-Smtp-Source: ALg8bN6diayYrhB1LwIJt/zIdALi6/a5Hd6n0w6ky31CDIDEQu1Z2y+XiWUCN2wZTtDlfcYVLkUK6y4C80ju9iuV9DE=
X-Received: by 2002:a2e:92:: with SMTP id e18-v6mr7475011lji.130.1547652563691;
	Wed, 16 Jan 2019 07:29:23 -0800 (PST)
MIME-Version: 1.0
References: <20190111172937.9197-1-paul@betafive.co.uk>
In-Reply-To: <20190111172937.9197-1-paul@betafive.co.uk>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 16 Jan 2019 10:29:11 -0500
Message-ID: <CADkTA4Oy5J4aRqtOgUsLZKuQHmtYZtQijLH-iGMygMX=72hZ+w@mail.gmail.com>
To: Paul Barker <paul@betafive.co.uk>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] runc.inc: Move RRECOMMENDS to runc-docker
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
X-List-Received-Date: Wed, 16 Jan 2019 15:29:27 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Fri, Jan 11, 2019 at 12:29 PM Paul Barker <paul@betafive.co.uk> wrote:
>
> If we're building runc-opencontainers it's likely that we're not using
> docker.
>
> Signed-off-by: Paul Barker <paul@betafive.co.uk>
> ---
>  recipes-containers/runc/runc-docker_git.bb | 2 ++
>  recipes-containers/runc/runc.inc           | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
> index 02bda31..11fa68a 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -1,5 +1,7 @@
>  include runc.inc
>
> +RRECOMMENDS_${PN} = "lxc docker"
> +
>  # Note: this rev is before the required protocol field, update when all components
>  #       have been updated to match.
>  SRCREV_runc-docker = "6a2c15596845f6ff5182e2022f38a65e5dfa88eb"
> diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/runc.inc
> index 6d11a6e..5a2ca31 100644
> --- a/recipes-containers/runc/runc.inc
> +++ b/recipes-containers/runc/runc.inc
> @@ -17,7 +17,6 @@ inherit pkgconfig
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
>
> -RRECOMMENDS_${PN} = "lxc docker"
>  PROVIDES += "virtual/runc"
>  RPROVIDES_${PN} = "virtual/runc"
>
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

