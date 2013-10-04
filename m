Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0923EE0166C
	for <meta-virtualization@yoctoproject.org>;
	Thu,  3 Oct 2013 19:43:36 -0700 (PDT)
Received: by mail-pd0-f175.google.com with SMTP id q10so3323382pdj.6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 03 Oct 2013 19:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=pXXYUgLlWB8God0X91xBxzKeLQnf3pbdVnu/k1m1ikQ=;
	b=sUiM+bJNzH69Vshf8G02DeCE7UYW+c47hwfRYBFvWXsvNqsYhBanQL5v/nTxstWJqh
	tq1wA2npQw8B2a4uo6Ck/pFyjol87UA3He62Crw9FJ8G6ghnqiCsMXQ1QNS0ZwmXKLaH
	urtR/Uwp1K6HzHSRsYKqfjK58VBL6hxK6G3cDJDdcu9uORXa7oH6WGgJv1qmzvo3JSAF
	mfVryZ0JuC/mMJWgJ5SrhivIcdF5RH0ef340NRuhdxncE4SzRYA64kpyuEi1OUgr8g4W
	q3bGHjG/o4dMhfTea7nqPleZzLbxA69Z5sa0otxTPBguBHG5sQmdeVpKNXOJBlnMBfd7
	tArQ==
MIME-Version: 1.0
X-Received: by 10.68.254.132 with SMTP id ai4mr11840795pbd.51.1380854616492;
	Thu, 03 Oct 2013 19:43:36 -0700 (PDT)
Received: by 10.68.43.130 with HTTP; Thu, 3 Oct 2013 19:43:36 -0700 (PDT)
In-Reply-To: <20131004014717.GA7786@longhaul.twobit.us>
References: <20131004014717.GA7786@longhaul.twobit.us>
Date: Thu, 3 Oct 2013 22:43:36 -0400
Message-ID: <CADkTA4NH9kQ-02joThUDboR-88rHO2ga9BOYqNujwCe6f4BQ3w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Put the XSM policy in the flask package.
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
X-List-Received-Date: Fri, 04 Oct 2013 02:43:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 3, 2013 at 9:47 PM, Philip Tricca <flihp@twobit.us> wrote:
> It make make sense to break this out into it's own package in the
> future for those that want to ship a monolithic policy without the
> tools but for now we should at least get it in the flask package.

merged with a short log tweak.

Bruce

>
> Signed-off-by: Philip Tricca <flihp@twobit.us>
> ---
>  recipes-extended/xen/xen_4.3.0.bb |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/xen_4.3.0.bb
> index 00394b9..2e1a29f 100644
> --- a/recipes-extended/xen/xen_4.3.0.bb
> +++ b/recipes-extended/xen/xen_4.3.0.bb
> @@ -252,6 +252,7 @@ FILES_${PN}-flask = "\
>      ${sbindir}/flask-loadpolicy \
>      ${sbindir}/flask-set-bool \
>      ${sbindir}/flask-setenforce \
> +    /boot/xenpolicy.24 \
>      "
>
>  FILES_${PN}-gdbsx = "\
> --
> 1.7.10.4
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

