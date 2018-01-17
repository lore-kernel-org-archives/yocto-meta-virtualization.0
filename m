Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CBB4DE00DD2; Wed, 17 Jan 2018 05:10:27 -0800 (PST)
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
	*      [209.85.216.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3279AE00EBB
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Jan 2018 05:10:24 -0800 (PST)
Received: by mail-qt0-f196.google.com with SMTP id i1so5572041qtj.8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Jan 2018 05:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WulMwG16cZWx9HH2vtsmH/S7gWuin2+/pRNijEOCzM8=;
	b=Bq6LuqAWaMQYe8qJn4OkKql49AtjeGJo+EppYr4Z0KjN2jk6VL+peGELS0X4IuvEwG
	jsBQnX/9dt2QUXyfyNqkAJ+E5lWlUeG/WlyDI1cIaiX+N3ogo04yL3EhdP4LoQ1x40eS
	6j8n5NxiI2BHbj7qdRq1e7+PnkRmO6eqirsL4KBR/8xe2KfUHCmP65kU2RLVc3p70O7T
	P5cdgFEOy5vHh8xXmMq/2NZBDG1VUJKk1y+n2JX/8btbo/0vHlolhWXiYo4PQ9+KNRlG
	fjSDhTg80a2VtZWrvbMP3nJDCO7uagzfDg2zcSMe1PEnxKR5cRKwuAxHmj3SrcqCOFJl
	jeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WulMwG16cZWx9HH2vtsmH/S7gWuin2+/pRNijEOCzM8=;
	b=rr5H79q62Ite9fT4ss8mBQH6XnprKhEx9a4eP3NdtACY/AHU9W/1Fih5kspH+6AtLJ
	UadgS2LH9pWYPC7jAabenTtsRueiDu0v9S/bE8RpEFF+5qi+kDhoumwsulix36nPjjpj
	DYLl+ZT2xT22A01q0gJsmqmyq5Vmud62F4DN0YvGn4VlzdYgI3oBow87sq4ocIQ5CSE9
	YQ8+NBOR8R7QeHrzSUWgeXAUU8FGo8+EvFCVM/oejB0mRUF8UE8iv9proJrYPnqu4AUf
	NkfeZg7i2MNhghPcMccOefa6pf0ebrLQdMqyUiL1rwjRb0X1XaJoBUejSjXvmix9Ck5F
	w5tg==
X-Gm-Message-State: AKwxyte5tO8D3EHvFAvxO6dX3neOsA9Sq2PHfQ4KjR6Fdi9rTJyOMg0n
	nZ6S+i6BL3Bj+oTIwoQBbaDe0kXviPB698edOtI=
X-Google-Smtp-Source: ACJfBouDZ4hDltWJL/Xz6i+iQyYJMJf7uaByMLNY1FEQWNQ00TZR+PcFIpH0myRg/KFlXl88iwp5V3P+eG9HU4pE/Tk=
X-Received: by 10.237.52.101 with SMTP id w92mr16327424qtd.204.1516194623972; 
	Wed, 17 Jan 2018 05:10:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.82 with HTTP; Wed, 17 Jan 2018 05:10:23 -0800 (PST)
In-Reply-To: <1516170171-9569-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1516170171-9569-1-git-send-email-jkrishnanjanappa@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 17 Jan 2018 08:10:23 -0500
Message-ID: <CADkTA4NSPHKx-rfx1xCG4vN9avrYM9d8iUdANx+5TmA8cPTwWQ@mail.gmail.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [master][rocko][PATCH] cni: fix build error for arm64
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
X-List-Received-Date: Wed, 17 Jan 2018 13:10:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 17, 2018 at 1:22 AM, Jagadeesh Krishnanjanappa
<jkrishnanjanappa@mvista.com> wrote:
> Replace syscall.Dup2 calls with syscall.Dup3, as syscall.Dup2 is not
> supported for arm64.
>
> Solves below error:
> -- snip --
> Log data follows:
> | DEBUG: Executing shell function do_compile_ptest_base
> ...
> | # import/vendor/github.com/onsi/ginkgo/internal/remote
> | ../../vendor/github.com/onsi/ginkgo/internal/remote/output_interceptor_unix.go:34:2: undefined: syscall.Dup2
> | ../../vendor/github.com/onsi/ginkgo/internal/remote/output_interceptor_unix.go:35:2: undefined: syscall.Dup2
> -- snip --
>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  recipes-networking/cni/cni_git.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
> index 427a812..c83a56e 100644
> --- a/recipes-networking/cni/cni_git.bb
> +++ b/recipes-networking/cni/cni_git.bb
> @@ -29,6 +29,10 @@ inherit go
>  inherit goarch
>
>  do_compile() {
> +       if [ "${TARGET_GOARCH}" = "arm64" ]; then
> +               sed -i "s:syscall.Dup2\(.*\))$:syscall.Dup3\1, 0):g" \
> +               ${S}/src/import/vendor/github.com/onsi/ginkgo/internal/remote/output_interceptor_unix.go
> +       fi

Even if this is in the vendor/ tree, it should be a patch, versus a
sed operation.
If it's a patch, I'll check it during each uprev of CNI, like this ..
I'll never notice it.

Cheers,

Bruce

>         export GOARCH="${TARGET_GOARCH}"
>         export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
>         export GOPATH="${S}/src/import:${S}/src/import/vendor"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

