Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 86085E00718; Tue, 25 Sep 2018 14:40:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3EB2E006AF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Sep 2018 14:40:10 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id l19-v6so8714094ljb.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Sep 2018 14:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iY8I94WdYgiUm3/imjQXKEI9t6yJcrtPbFZnmsQe8dc=;
	b=cc2sn2FyoEYBz1S+yw3v3LQnxTxV/iH4EUAQS4TokXch5M79YfkpSZpJuwRFnRNnRz
	zTm2/9iotw8gfardzsaa6NAp/2DwKljkJwd60zlym/GvM6mHoYao3Jy6aUpXHy81q07c
	9cAm+X8lSNRDHhOl9gV1P5bKhWLQIGBmnrspTZmLnEghZRfltekhgnAOZZtDCyTK1wrq
	crpF/yLEEFBzNngLy+iU7cXnbdSj+sSIpCLQH7qDFiMIRXz1gwT2Iik21KvKbVc3E66j
	oISqI8SzyPeWFGRhI4u3yYuvrOdO9IFPO6wev7h85q0l9nCumON94cNqK9EojiJ9QCvF
	vkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iY8I94WdYgiUm3/imjQXKEI9t6yJcrtPbFZnmsQe8dc=;
	b=dYyIr2tDEctUzq7y3sr7L3HR8TnFu+d4LwG1oHZVeHlbxtra0XKzMjAXc2bc5neczN
	f3ytuWp12exN6XrtfXe18lKU0sqDCaEX459c76i4mG3E0Vl5WGmBgJkd3j031WAsjhig
	8l0rYUBaTiecSc1bh4v6+w3oCm/C1pQ7rkG3WHsHh2bUBH2B4/nVcVV7Z4qlBbU0Icue
	OoTlGvuYsNbQX9g3lqGSEWEgjcp0P4HZW4sCqFDoTT2LeZHhrZB7R1vbhx4W/LJt0v15
	hrvcMbunu/PdtMASWU5FB5sqFhjkzW7zJ3cjK6nRMzkXXGA8etPi4X4CUitclqeb4XA/
	aGEg==
X-Gm-Message-State: ABuFfojdcXVGZqr6L0RYQEWeRndaV+hzb/Hi5Bl18a56KvBnuzX+swxk
	XzvkQmjwpU78d3d2CCuSMEZ/mZqRRPGZ+XHx0NC/Ew==
X-Google-Smtp-Source: ACcGV60ivkZe0x/asNxaGKOi5+I9g6rwn5Vck1ycwYXWOFYudPQU+nbiJ0iAtWFw9vVlCWnRkMk2fiHCJ5fnQT0k8K0=
X-Received: by 2002:a2e:5c89:: with SMTP id
	q131-v6mr2156529ljb.119.1537911609533; 
	Tue, 25 Sep 2018 14:40:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9691:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 14:40:08
	-0700 (PDT)
In-Reply-To: <1537846106-268688-1-git-send-email-zhe.he@windriver.com>
References: <1537846106-268688-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 25 Sep 2018 17:40:08 -0400
Message-ID: <CADkTA4N=KTiseP7gGMgvFhCuhqVu0BuNUqVHCf3yV+yNdMF7=A@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] containerd: Disable for all mips machines
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
X-List-Received-Date: Tue, 25 Sep 2018 21:40:11 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, Sep 24, 2018 at 11:28 PM,  <zhe.he@windriver.com> wrote:
> From: He Zhe <zhe.he@windriver.com>
>
> containerd does not support mips since it depends on boltdb which does not
> support mips.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-containers/containerd/containerd.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-containers/containerd/containerd.inc b/recipes-containers/containerd/containerd.inc
> index eb47cc9..0eca5a6 100644
> --- a/recipes-containers/containerd/containerd.inc
> +++ b/recipes-containers/containerd/containerd.inc
> @@ -88,3 +88,5 @@ FILES_${PN} += "${systemd_system_unitdir}/*"
>
>  INHIBIT_PACKAGE_STRIP = "1"
>  INSANE_SKIP_${PN} += "ldflags already-stripped"
> +
> +COMPATIBLE_HOST = "^(?!(qemu)?mips).*"
> --
> 2.7.4
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

