Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DC24FE0083A; Sun, 13 Oct 2019 16:45:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F0700E007A2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 13 Oct 2019 16:45:19 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id d1so14750709ljl.13
	for <meta-virtualization@yoctoproject.org>;
	Sun, 13 Oct 2019 16:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R+o2S+O8dD4pqhzdLCdZvp2MSOR5ZU9PONFr6wh6sk4=;
	b=kNaH25vyMOCgNZcaanbrFYM6KV28KKkVWgr2o4sj5OsY+IEltYKUz77NcTX9XtqMw+
	4QIUnwEYxB0yN3rKk0JtqIY3bzZJKqkBcN5V7Zke+SMBqjGe0SKuF8ZoSEXPlQIdlhLG
	INyGsE3S3j50+Kx6w/DO+D39MFNJryN6nEtHx8fGYTSQIRpjIWf8ahqOAmRTiuPpQOeo
	fN/M0YDTfGwwEzEn7Rr1mdy3+eTIPIkLmVNNAg+ENASw+fFzh5hjRI2QXhOEyddG2dsb
	knMOMx8Y8g6/lKS1vw6EwzxJK0qsqWg1qpKjLKP3WwKljmf67jAZN4LArU2DqBrBNeWv
	D1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R+o2S+O8dD4pqhzdLCdZvp2MSOR5ZU9PONFr6wh6sk4=;
	b=qplXTK4ho+p4RxHZQihgJjG4M/6vwKMhUGt2772DdpEqKZPBfheZuE6wgihdTJTFVl
	x60t6VBXp31YSw+EaAv39dc9ljPWQVym5QJuuXMj34D0LyAT2EpImr9wLSkhNC7ygGUB
	6ZGvZmYGbpKgbBUyw3iFw9N/+MToICG2RvxA8eYvVB7GOQByiNTwi/smvVBv2qYp69Nc
	OUH8qxJ3OKHDJgQ58k37QJKiLrcsqfzjRaXSRRtN0QyZDsmrV/KAN+aOyQAR6lsyUIm6
	xF852bnXQWJPJSi/IR6YXbn+ixl//Pkf2p/xyju6rAWQO7P7KbYMu3MBAQgEEqpoehos
	B+pQ==
X-Gm-Message-State: APjAAAXJpilvi+k0jjTNK7xVVIu14MdZpgLdLwq3KVh1kAoiMEmhCLXA
	icnQQNOrulbBRwyAGXj1h/da+m5wVr3NEOdaj5A=
X-Google-Smtp-Source: APXvYqzqvCZdWAaUN6oXt+nIdpnKCf62UxrhWju7s0rWwZO9bd3TVUgamgnvuUzKfzVze8pW4/9pFlj1+RGEaIef18E=
X-Received: by 2002:a2e:7312:: with SMTP id o18mr16799201ljc.32.1571010319078; 
	Sun, 13 Oct 2019 16:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20191012150415.16293-1-ruslan.piasetskyi@gmail.com>
In-Reply-To: <20191012150415.16293-1-ruslan.piasetskyi@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 13 Oct 2019 19:45:07 -0400
Message-ID: <CADkTA4PgRCJdgPvL=1iwm6McRnuMk-aVUOifDVFYL3aG_tZ0hA@mail.gmail.com>
To: Ruslan Piasetskyi <ruslan.piasetskyi@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Fix criu build for aarch64
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
X-List-Received-Date: Sun, 13 Oct 2019 23:45:21 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Sat, Oct 12, 2019 at 11:04 AM Ruslan Piasetskyi
<ruslan.piasetskyi@gmail.com> wrote:
>
> Makefile:
> #
> # Supported Architectures
> ifneq ($(filter-out x86 arm aarch64 ppc64 s390,$(ARCH)),)
>         $(error "The architecture $(ARCH) isn't supported")
> endif
>
> Signed-off-by: Ruslan Piasetskyi <ruslan.piasetskyi@gmail.com>
> ---
>  recipes-containers/criu/criu_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
> index c1ddb49..6bbbed6 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -38,7 +38,7 @@ S = "${WORKDIR}/git"
>  #
>  EXTRA_OEMAKE_arm += "ARCH=arm UNAME-M=${CRIU_BUILD_ARCH} WERROR=0"
>  EXTRA_OEMAKE_x86-64 += "ARCH=x86 WERROR=0"
> -EXTRA_OEMAKE_aarch64 += "ARCH=arm64 WERROR=0"
> +EXTRA_OEMAKE_aarch64 += "ARCH=aarch64 WERROR=0"
>
>  EXTRA_OEMAKE_append += "SBINDIR=${sbindir} LIBDIR=${libdir} INCLUDEDIR=${includedir} PIEGEN=no"
>  EXTRA_OEMAKE_append += "LOGROTATEDIR=${sysconfdir} SYSTEMDUNITDIR=${systemd_unitdir}"
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

