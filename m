Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B386EE00DAA; Tue,  3 Sep 2019 13:02:00 -0700 (PDT)
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
	*      [209.85.208.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7BA1E00D6A
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 13:01:59 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id y23so6220522lje.9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 13:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VvMTP9QbVM4EF4xHYddrZ6b6KCBxxDZDsT0XA6YnaKg=;
	b=YMalKL8XmD8SnYHrLptuDCJx2mS5tISyiOdPK38jqawUhTSJh8uify4fT1wrowfTbm
	PluQNa/qfHsxQlNYAkp2BHxpot15Dy+98fm9bHMb70zMijBxzQk4H4ZIEVTpscuzsx0h
	M6lxy33V26SboNehglCFy8rfeIip9VYNUprPjGyxMvJcyaNpw0p1dodHobMMYb6eOch6
	E6YTpkS4/pkEXUy8DcMIzvbUDyvrWX9EMIqjF33O+gQX5bQwTHIarjVxdO2Bg92z9DHQ
	bXvX0/YpVtZ3KzuYflTZi13bwL82+xe1z8/mdJSL0NZBiVv6YD9HoUs8+MMBpgXBxGD7
	N80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VvMTP9QbVM4EF4xHYddrZ6b6KCBxxDZDsT0XA6YnaKg=;
	b=SnCB7RLKmi5GpNhcVV0YUOSQC/wYPmYo/YvgJ95FaNXMbyEbvkVsnKNWuKK9+yqIDv
	czeoKEKgkgecAbkLkJxPHokrcJcWzXdcVa/Vz5AauSaBR9Eyz1LUGIXiVfY6RDitWwHR
	+7x+a9K0ctLSpfgNgqFCAKX4CT+lsocZQ1aOw+EmlQ9KFbDYor+7Zph0wFUZcknhUiWD
	S9foxTeixVuUO9dXCUFdw22n8L42W6FyrOCO9JCWZ4o/Z7op96m+AV5D+l83cXag6IP+
	dPgKxmQYF1l5c1qiv5sNosoWpnzddDGV5jjj7Y/eT5Qxxdx6lNbGEKBDLMmfqV5HSRDk
	vPiA==
X-Gm-Message-State: APjAAAV1H3t8MfSies285vbOqrYkOVirODYdsOGSoOQ4sJtdk4Q/2FPu
	nKRALMI5hyktQrAFYnB9zWS20u58L3bFK652r78=
X-Google-Smtp-Source: APXvYqyzM0BJeQNR5T0m+ymqYto6c/H6C826+nBDdUCh/1CPvVtojO1iqEVWJt4tpbqJNj/zNUHQgORWa8RcmaHSY9I=
X-Received: by 2002:a2e:5dc3:: with SMTP id v64mr14648483lje.118.1567540918808;
	Tue, 03 Sep 2019 13:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <1567413409-22401-1-git-send-email-hongxu.jia@windriver.com>
	<14a70722-9e6e-a3fe-3758-ef57069fea9d@windriver.com>
In-Reply-To: <14a70722-9e6e-a3fe-3758-ef57069fea9d@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 16:01:47 -0400
Message-ID: <CADkTA4PUwjd_+0dN1bF1J+muvvkdi8QbOjxBjidDyBROwwS-7Q@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/2] kubernetes: building unstripped binaries
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
X-List-Received-Date: Tue, 03 Sep 2019 20:02:00 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Sep 2, 2019 at 5:10 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> On 9/2/19 4:36 PM, Hongxu Jia wrote:
> > Specify GOLDFLAGS as an empty string for building unstripped binaries, which allows
> > you to use code debugging tools like delve. When GOLDFLAGS is unspecified, it defaults
> > to "-s -w" which strips debug information. Other flags that can be used for GOLDFLAGS
> > are documented at https://golang.org/cmd/link/ [1]
>
> Clarify one thing, make the binary *unstripped* at do_compile time,
>
> thus Yocto will split it to stripped + dbg
>
> //Hongxu
>
>
> > [1] https://github.com/kubernetes/kubernetes/blob/master/build/root/Makefile#L82
> >
> > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ---
> >   recipes-containers/kubernetes/kubernetes_git.bb | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> > index b7862ec..821f51f 100644
> > --- a/recipes-containers/kubernetes/kubernetes_git.bb
> > +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> > @@ -54,7 +54,7 @@ do_compile() {
> >       export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> >       export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> >       # to limit what is built, use 'WHAT', i.e. make WHAT=cmd/kubelet
> > -     make cross KUBE_BUILD_PLATFORMS=${GOOS}/${GOARCH}
> > +     make cross KUBE_BUILD_PLATFORMS=${GOOS}/${GOARCH} GOLDFLAGS=""
> >   }
> >
> >   do_install() {
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

