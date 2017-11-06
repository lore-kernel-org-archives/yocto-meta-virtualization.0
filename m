Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BA919E00D17; Mon,  6 Nov 2017 05:50:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_LOW,
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.178 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.178 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 69941E00D03
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Nov 2017 05:50:09 -0800 (PST)
Received: by mail-qt0-f178.google.com with SMTP id z50so10938647qtj.4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 06 Nov 2017 05:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XoXgnhj1SAQ3oVabMIwphswCVxKkgEyoCZx31OiKHc0=;
	b=GGXIZDxvwqI1yrE5JSqVWK1iv8u7QxxM+InJOiSNp7iYl5SsLP5vWQvA9GL5sdUF7E
	wWlJLKgffE5HItd8uQv3R/dCzcjD+u8zkqFPQgqQQOdnmOAuC7mL7ahrKrFq3CcEyX+v
	aJV/MYNjYs5C3OpKM0t/0IxxFH/T0zaLpBSFrZWdI/ktNJV7+8qwQN1bABvGyykDvXBo
	o75vF32D3/MqfLSmLk+kHG/yiUnlIamBFanvPaHJXLwWctl4vWX2vtKiJaxkEn1hqI9t
	cUNNSyrqQy8KLcExn3rAFcvgBHeU4MTH/GMdVY5hG+UQP5ZNJI8ex3FGJ50O2760gvWs
	HdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XoXgnhj1SAQ3oVabMIwphswCVxKkgEyoCZx31OiKHc0=;
	b=e+7W/gjUzkyadeamh4pl7MMNLFKiU90l29AR1RQM9qXD6LO9L7TupsdQDp9qq4qLYy
	FFjhnaH0dAJNPnfyee/2okMkH46dolM+enP68KPwvmq8AxRyQhjfr0G+KK2m2wNaAhyW
	krQAs/QEn/GjnYDQfeHIF84wQC1an+TqYlKefRbQR5agww6GXnGNjEinnuxjMnrXQHMp
	FMR97D3zwCe8oO6ge2/iepNYsdV5bH80PxpYRk57h3fRLLWvs8BTJO56Pwfxm4CaJH7X
	TB+HyiY/vK206SVqQZCqsn4baWkLOyXBN+59NcyDC8dEiwU5InF4RV6qQTuSbdlwNs0X
	aQlw==
X-Gm-Message-State: AMCzsaXQc+TfQIOtc9fT15hx6azyPTAn1DfHwhLPpqca5hJzjDBqU7UI
	9bye0ZycaB1B/6zJ6+Rcip+qVEqxS5nVx53SimU=
X-Google-Smtp-Source: ABhQp+TqhV7NpZQmC8ftEiEGQIQonqV1GUZI5+DVkg7Rnu1aWwZI7PsS0kH+12njUxIIvDUeiTBTcBO0oN8XzJDqOrM=
X-Received: by 10.200.25.46 with SMTP id t43mr22861169qtj.204.1509976208508;
	Mon, 06 Nov 2017 05:50:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Mon, 6 Nov 2017 05:50:07 -0800 (PST)
In-Reply-To: <9D17CA0E2F3FD24582A90F5363602C23011EB48C4E@ALA-MBC.corp.ad.wrs.com>
References: <1504083795-20546-1-git-send-email-yan.yankovskyi@globallogic.com>
	<9D17CA0E2F3FD24582A90F5363602C23011EB48C4E@ALA-MBC.corp.ad.wrs.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 6 Nov 2017 08:50:07 -0500
Message-ID: <CADkTA4OgM1gsGoWLLAuOddF-wmQ4Nxzx8-1KcZhyWC6y3FfoOg@mail.gmail.com>
To: "Wei, Yunguo (Bryan)" <Yunguo.Wei@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen: delete references to xenstored.socket and xenstored_ro.socket in xen.inc
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
X-List-Received-Date: Mon, 06 Nov 2017 13:50:10 -0000
Content-Type: text/plain; charset="UTF-8"

Looks like it was just missed (it happens).

Also, there was no ack on the list by the folks that are actively
building and using Xen .. which means they are not hitting the
same error.

I'd suggest re-posting the patch and then we can see if there's
any new discussion on the list.

Bruce

On Mon, Nov 6, 2017 at 4:45 AM, Wei, Yunguo (Bryan)
<Yunguo.Wei@windriver.com> wrote:
> Hi Yan
>
> Do you know why this patch was not merged? I'm running into same problem.
>
> Regards,
> Yunguo
>
> -----Original Message-----
> From: meta-virtualization-bounces@yoctoproject.org [mailto:meta-virtualization-bounces@yoctoproject.org] On Behalf Of Yan Yankovskyi
> Sent: Wednesday, August 30, 2017 5:03 PM
> To: meta-virtualization@yoctoproject.org
> Subject: [meta-virtualization] [PATCH] xen: delete references to xenstored.socket and xenstored_ro.socket in xen.inc
>
> These files were removed since the following patch http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=976ce01e103fc03bb3336cdbc6c951a709e285fe
> and are absent in xen 4.8.0 and further, which leads to the following error during the Xen build process:
> do_package: SYSTEMD_SERVICE_xen-xencommons value xenstored.socket does not exist
>
> Signed-off-by: Yan Yankovskyi <yan.yankovskyi@globallogic.com>
> ---
>  recipes-extended/xen/xen.inc | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc index b5c5f03..717424b 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -687,8 +687,6 @@ FILES_${PN}-xencommons += "\
>      ${systemd_unitdir}/system/xenconsoled.service \
>      ${systemd_unitdir}/system/xen-init-dom0.service \
>      ${systemd_unitdir}/system/xenstored.service \
> -    ${systemd_unitdir}/system/xenstored.socket \
> -    ${systemd_unitdir}/system/xenstored_ro.socket \
>      ${systemd_unitdir}/system/var-lib-xenstored.mount \
>      "
>
> @@ -728,8 +726,6 @@ SYSTEMD_SERVICE_${PN}-xencommons = " \
>      xenconsoled.service \
>      xen-init-dom0.service \
>      xenstored.service \
> -    xenstored.socket \
> -    xenstored_ro.socket \
>      "
>  SYSTEMD_SERVICE_${PN}-xendomains = "xendomains.service"
>
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

