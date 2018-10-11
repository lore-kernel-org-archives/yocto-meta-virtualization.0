Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E046FE00A54; Thu, 11 Oct 2018 11:59:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.208.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2EDB8E00566
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:59:50 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id o14-v6so9232159ljj.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1mCBjC8h1mMeGdpPidyR9gVS7wMYPNtnBYXhmoSi5ek=;
	b=eWMhh25sc83fG+lfsjedaG1s7aMj+UV5Ff3Xi2zJTX1bJ97bjCKzf4omjjLlmp8n5O
	Xet8V7EWJ0XmqxeIWWdVTdxo0SSrahqWcF7Kys1CWBFcl9VGpGAP9GVgY6++5lirqoPh
	iXq0wAKY5jpyuK8adl7kNIgDKd/ez+Hh6kbd7E3j+5stHwDjwZuOfAkx4au+x6aOefk9
	BqzILytjmtEUJ1oHfp38hdcaG/PIKc+aw7sdQs3+sOUnws0WRJ1oRrlJppNi44ySKKaW
	XMY3jPr5Dr7Q24gNlvO/GHPnyCtT+CY3GFWuJArsYHPavD+Z6h8aMkvvBm4vrdfl1D5t
	UjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1mCBjC8h1mMeGdpPidyR9gVS7wMYPNtnBYXhmoSi5ek=;
	b=OMmcQEiVIXnUqU0Id4HI4kCGNcKkt7ez+dmm8hZrtrZBirZvrlB9R3kR81M5b5mv4Y
	975dsXKQ3mj8052IQzs1KuGmHi6lZ91A6IgGdqQWifBwCsHzp17YfCwb2O00MY48ofws
	U8VFgy909vDeg2ZdcGg65hBiC6mKymbstiSz+tU+HlcVWNRjI8wRLT25RgFVQCCU4YJE
	m5Ih5a57vZgnkEVYr7aV6uGa7PL/y1MZgEp8JBkVG7HuqqRem1lbrCG3O0iGMTHf3OxS
	ZuWkW5ZxYnGhWNug3UDVa46yJ2W3CGnyM5HqgT7cgF24XpzcJcPggQsVNbB0S5BKOhqj
	XQmQ==
X-Gm-Message-State: ABuFfojASqpKII8wKc9vwqI7QRdUoXKI/LOQIzbM3B+W1C+/KYxc19kI
	MwOMctdiWqiCwuDRvZqGz+1EB9hLinT/SWdzcx4=
X-Google-Smtp-Source: ACcGV60c8W+zNtH5OIcn742ZH/YuvyoHn7IoPtgyRyuDHWimD7nlE1U+xpN5KbZm2YsXieCCXsZZFDrE+J6h8P+nVc4=
X-Received: by 2002:a2e:58e:: with SMTP id
	136-v6mr2116633ljf.130.1539284388906; 
	Thu, 11 Oct 2018 11:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20181011185410.28270-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20181011185410.28270-1-richard.purdie@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Oct 2018 14:59:37 -0400
Message-ID: <CADkTA4PR5vL_TYkR+dLEd--GGb7Bf=pso9OPz2T3T0NnisOxYA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] ceph: Remove accidentally added patch file
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
X-List-Received-Date: Thu, 11 Oct 2018 18:59:51 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

I had git rm'd it locally, but forgot to commit and push the change :D

Bruce
On Thu, Oct 11, 2018 at 2:54 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> This patch was accidentally added in commit
> 4be88e83904f62786d4af9d03204ba559777ab0f, remove it.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  0001-ceph-only-support-x86-64.patch | 22 ----------------------
>  1 file changed, 22 deletions(-)
>  delete mode 100644 0001-ceph-only-support-x86-64.patch
>
> diff --git a/0001-ceph-only-support-x86-64.patch b/0001-ceph-only-support-x86-64.patch
> deleted file mode 100644
> index c907e23..0000000
> --- a/0001-ceph-only-support-x86-64.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -From c1410631e368569f8fa03a2a72938e603eb92578 Mon Sep 17 00:00:00 2001
> -From: Dengke Du <dengke.du@windriver.com>
> -Date: Mon, 8 Oct 2018 15:33:25 +0800
> -Subject: [PATCH V2] ceph: only support x86-64
> -
> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ----
> - recipes-extended/ceph/ceph_13.2.1.bb | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/recipes-extended/ceph/ceph_13.2.1.bb b/recipes-extended/ceph/ceph_13.2.1.bb
> -index d7186b9..7888e64 100644
> ---- a/recipes-extended/ceph/ceph_13.2.1.bb
> -+++ b/recipes-extended/ceph/ceph_13.2.1.bb
> -@@ -60,3 +60,4 @@ FILES_${PN}-dev += "\
> - RDEPENDS_${PN} += "\
> -               python \
> - "
> -+COMPATIBLE_MACHINE = "(qemux86-64|intel-x86-64)"
> ---
> -2.7.4
> -
> --
> 2.17.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

