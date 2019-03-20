Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B1EA6E00C1E; Wed, 20 Mar 2019 11:43:29 -0700 (PDT)
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
	*      [209.85.167.46 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28B2DE0053F
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Mar 2019 11:43:29 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id p1so2661004lfk.9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Mar 2019 11:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OllEPzRRFg6Cpno6bMW56dWlKa8QvtSTlLMtaNu+vSs=;
	b=WowiwzOGUOw3l5EhVYAxKayoEMbHc/wQ+CLwgCQMbcViZlSjo4uc7ARgURECZYRams
	I1FthJjFq/Iq+nIu6xpE2yILRjTtYEKcZv1fI6sNIOnfBEYGRkr7zGMqecq59cvgX2xV
	Wj8buleuoBILOMimc75oOW45puWhzOqDpK5d66DAz2PTDGAjhyYYyQ9JZ668N6AQlWSx
	za/1xidPJWSK3BkJkD3QWXTTNIvyaYlF8WVHpyV5jniNWIMKn0jjtOhOFcYu1w/VI5IH
	0arPBBnjgXke5w9dytbaluvcsNcmX/JguEQTaZgTFKbyVuvTdMVc1nkuCONPwwDYntys
	3T1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OllEPzRRFg6Cpno6bMW56dWlKa8QvtSTlLMtaNu+vSs=;
	b=Up+iG9hY7eTZnzkt7D7XwTnCL/OzjDodtXWzpjLkfXHcGUx8gta54bSPTu+RTYyDxn
	HFOPW9iB2Be8ffr66b42ToXTt4VOPpKUuhflSdWmlUAFVsx+HFI74OlM7sVnmEkG20uU
	rtAkItuxgywX1iYzt8EVH+N7h5u4je4SRj5bGDvcgeXYnWCnU0lasQdfRR799Vy/JYV3
	UhV4iq5Fq90SbszVxeJ5G6oNB2TTnqXKWOmm5vNtmDEuhaGERrMKvGR0POhKFFKCekE0
	ej8BumWBq6pnGuyfbVNYT3xEdKtsqrtSUDUB5bK1cnrKawuQF8DPcI+WKvLz8T962k3Z
	GcrQ==
X-Gm-Message-State: APjAAAVnUJCqumUQ4fCuydOMwTJIKPnceEFInWiARtG/YynP9Y/O8E4O
	z2f36wOJ9ZtZPb55yaYFKBuwCFWAElQJlEqRsw0thLgi
X-Google-Smtp-Source: APXvYqxi6WecO7quPRLiLWSl0jzazopexqTBz0FBh1r6XCrsNkgyWdIg8I05xMp8Mkcgp7rAU7Zf20Nu/aTdMPtCa2g=
X-Received: by 2002:ac2:50d8:: with SMTP id h24mr10136027lfm.7.1553107408057; 
	Wed, 20 Mar 2019 11:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <1552986309-84594-1-git-send-email-liezhi.yang@windriver.com>
In-Reply-To: <1552986309-84594-1-git-send-email-liezhi.yang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 20 Mar 2019 14:43:17 -0400
Message-ID: <CADkTA4MvCptEwHgkNna_206Vv6iP-UPAPSDxVM_yisEPf9JBQA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] docker: Set the same COMPATIBLE_HOST as containerd-opencontainers.
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
X-List-Received-Date: Wed, 20 Mar 2019 18:43:29 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Mar 19, 2019 at 4:46 AM Robert Yang <liezhi.yang@windriver.com> wrote:
>
> It depends on virtual/containerd which is provided by
> containerd-opencontainers, so set the same COMPATIBLE_HOST as the last one.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  recipes-containers/docker/docker_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> index 19e773b..fd33714 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -174,3 +174,5 @@ RDEPENDS_${PN}-contrib += "bash"
>  # DO NOT STRIP docker
>  INHIBIT_PACKAGE_STRIP = "1"
>  INSANE_SKIP_${PN} += "ldflags textrel"
> +
> +COMPATIBLE_HOST = "^(?!(qemu)?mips).*"
> --
> 2.7.4
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

