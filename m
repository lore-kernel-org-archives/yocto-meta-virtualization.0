Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AC6A3E006B3; Tue, 14 Aug 2018 10:02:00 -0700 (PDT)
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
	*      [209.85.167.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67D65E0049F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Aug 2018 10:01:59 -0700 (PDT)
Received: by mail-lf1-f67.google.com with SMTP id v22-v6so14267611lfe.8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Aug 2018 10:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Kw/P0pRKPQuRV7c4/t7ZvKTrlI6FFoBwXXmEV+mFg+w=;
	b=r32n92rvhmeaXJQIGJMHjM1iSWHmPLDYC5XKJQ0PE6R8jfWU2+3TV/3lujY6rpF521
	OYvua2UEL783dFKt7Nto7qiqK+eQkQUpdvWiYdGl4U7K2pjv1jrjvFIegQ7GnazqwwQn
	WaBUmJy9WxH57JZ6c5DIgXnrqQpM63MwRQL1ak8rXIFSsDNf6ytQ8Q6BSNCxIatVZlTn
	VnV50RHlClzwaGz5DxEUMGrGhnPU045F54Q6EoNonTEZJ75LLqZcWVkyRdLiM8nOIQXS
	Fj1r+s99YmWFvN+AtIkmiQNobh/o1myBhO+6QpDViWjTbrp7Eo5g9+UD/KGFUOkmSz3D
	uNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Kw/P0pRKPQuRV7c4/t7ZvKTrlI6FFoBwXXmEV+mFg+w=;
	b=aEdbDn6vDprQvU7zFIWeKcWEEWaDZEiwoWVOEmrG1wWVv4HW0UvVl8At9Dwqk+r3fi
	7+6Bd8NwRJkuFBR4KcSJiWBed+zJJJf+7ZiK35RvJwIfKmjUXHpr0zloVL1uolPsDiKu
	dblxECE1s1nO8Z7gYqWkVpTItVFpHZKU1j/Tk5PB6O96VfB08OHHdtvGsKvz2rdkYoMg
	AfUoA7VSJwWNIpJnZ5qbBZHswGqSGX04HT4320F6Fs5iKSNNRvsBI7woncpYiFQZlg28
	8ba65bAM7FAycXEBWtGmxTMKVkYSuI0XReCHvXyXL0POkuVNyK7n/TAnAv9FgWjMYBAt
	ybKg==
X-Gm-Message-State: AOUpUlEvtyiWCBdK5SwzKn9uvHdLvxke7pA6EORyCmjijdkzMNIdXkJZ
	OTLhqjLHKH0is1DmIXMzKIcNSZRe6N9BtT3iZXSsfg==
X-Google-Smtp-Source: AA+uWPyofkNDUOBKVV8IvPTegm9Kxv5KZnS2XNh8qC4rKe82AmzcMO/DIsWDOcCxmByRtYf4Nf6D9fmLEVQmaokzkCI=
X-Received: by 2002:a19:f50d:: with SMTP id
	j13-v6mr13853026lfb.127.1534266118338; 
	Tue, 14 Aug 2018 10:01:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Tue, 14 Aug 2018 10:01:57
	-0700 (PDT)
In-Reply-To: <1534200813-27685-1-git-send-email-christopher.w.clark@gmail.com>
References: <1534200813-27685-1-git-send-email-christopher.w.clark@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 14 Aug 2018 13:01:57 -0400
Message-ID: <CADkTA4Pst76i6YOz9O4+BOU41opksv_H3TmbWo=1K9pHMmsiVg@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] seabios: update SRC_URI to: https://www.seabios.org/downloads/...
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
X-List-Received-Date: Tue, 14 Aug 2018 17:02:00 -0000
Content-Type: text/plain; charset="UTF-8"

I did some minor fixups on the older branches. But this is now merged.

Bruce

On Mon, Aug 13, 2018 at 6:53 PM,  <christopher.w.clark@gmail.com> wrote:
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> According to the latest seabios download instructions,
> this is now the preferred source for release downloads.
>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>
> This new SRC_URI is needed in: master, sumo, rocko, pyro, morty, krogoth
>
> Referenced Seabios git commit:
> https://git.seabios.org/cgit/seabios.git/commit/?id=95f850c2377968ad951121ceaab76d40a9eed593
>
>  recipes-extended/seabios/seabios_1.9.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/seabios/seabios_1.9.1.bb b/recipes-extended/seabios/seabios_1.9.1.bb
> index 9206046..77e8f34 100644
> --- a/recipes-extended/seabios/seabios_1.9.1.bb
> +++ b/recipes-extended/seabios/seabios_1.9.1.bb
> @@ -4,7 +4,7 @@ LICENSE = "LGPLv3"
>  SECTION = "firmware"
>
>  SRC_URI = " \
> -    https://code.coreboot.org/p/seabios/downloads/${PN}-${PV}.tar.gz \
> +    https://www.seabios.org/downloads/${PN}-${PV}.tar.gz \
>      file://hostcc.patch \
>      "
>
> --
> 2.7.4
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

