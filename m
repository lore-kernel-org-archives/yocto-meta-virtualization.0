Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6FE4AE00B77; Mon,  8 Apr 2019 04:34:15 -0700 (PDT)
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
	*      [209.85.167.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86811E00A54
	for <meta-virtualization@yoctoproject.org>;
	Mon,  8 Apr 2019 04:34:14 -0700 (PDT)
Received: by mail-lf1-f68.google.com with SMTP id o19so9201014lfl.4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 08 Apr 2019 04:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qyFniQwsmRBBPS6lgC9qMoaTmgG/Rm08sOnAPZpn+G0=;
	b=OGk06wW70CjPZHhGGcCypzOdPGC1yQOUEQa+WXQmloXu5YXIJtyySLeCfHfbAOow39
	rzUjzT1xRpl6RO2HRisvsyVko+WsQEWu5V4RVxmtPBejC0LwHUmCFHh68K1VxpmpXeSV
	LrS5vGmckZ3qPZ4l05WL1tCo5C0joIMRHeEa0yaVErTJ6C14yavNJo23c5Yv7l3xw0ZW
	sYaiNo7p5qS+uDuLQAsE8lgVgretGRF+8XZwEVcznrvAQ8pfhJ6mMf7/192AzM5OKzd0
	ndHxKCazSOGMrg4ZAthD77KUiZj9o5l+PXT+sEIdDg1Da9qjZwH25LPQwD4W55CGbOOb
	F0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qyFniQwsmRBBPS6lgC9qMoaTmgG/Rm08sOnAPZpn+G0=;
	b=nhA4x1RESiktK4CO/VO4OEHxbiV6br3CKCkbYa2I3PzUl87yCyYUiAuFn+lP0kkqDw
	0nkGLKI61gTKVHOK00iiSmqKcPCNPCxiG2AMobNh0rC6JCXdPjQo67rwQ5B3ni7mAx70
	iZuQvpKWmIuNGcXYBgYTGctY62HgLrRiTiuv2DSL5B8XxJCDCYxQ8cgIN4NK04qX1u0+
	agtLmuvxxkTBDBDsGTMDrjq9SX9L67O8pPxTavl+RxaEof3U2rDJhh5UzL3/uODSFd0X
	1SsL2nj501cyxMsDX6BCIGi2+4em0mEadWxz6IsoJxia7k0wcUtw1QYqu9JsZNf2jr7M
	hYKA==
X-Gm-Message-State: APjAAAVWyQUM2GzTxTrbhTQnP2BnVB+yUx2EkHJAtqZLNak7MScBmVZq
	enC1bGus8eKmQmlaW5P8Wt5cW1hlEkZoHLXy9D/yC+gt
X-Google-Smtp-Source: APXvYqwnOFvXmNdwTB7wMcq8YVCinD39oTAH2jZF06LQXlaAROeSgW+qOH+cq+0iaKXBpLz5K6q6Z/udpRusOCUHh2Q=
X-Received: by 2002:a19:e30b:: with SMTP id a11mr3699608lfh.4.1554723253380;
	Mon, 08 Apr 2019 04:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR08MB36060562D712E3220B157DDA8F500@AM6PR08MB3606.eurprd08.prod.outlook.com>
	<CADkTA4NirbuwMTw-ZpuSqz548qbUMZu-3rqw0Uk6Z8w2kRqQeA@mail.gmail.com>
	<CF877014-38CB-405B-9DCB-99E957BA0339@arm.com>
In-Reply-To: <CF877014-38CB-405B-9DCB-99E957BA0339@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 8 Apr 2019 07:34:01 -0400
Message-ID: <CADkTA4MwZoAEpNpm2bLtziN=vUrWCWMkkDJawxm9Zcr4Z6nXDQ@mail.gmail.com>
To: Sathees Balya <Sathees.Balya@arm.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, nd <nd@arm.com>
Subject: Re: Issues with 50cdecc sysvinit-inittab_xen.inc: fix hypervisor console
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
X-List-Received-Date: Mon, 08 Apr 2019 11:34:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2019 at 7:26 AM Sathees Balya <Sathees.Balya@arm.com> wrote:
>
> Hi Bruce,
>
> We reverted the commit "50cdecca7b2a0e1bb5eacbec132f26b802f950fc" and the=
 console starts as expected. Thanks.
>

We had already established that without the commit things start, they
were starting before we made that
change. It was for fixing a different issue and for standardizing on
the use of the variable.

I'm trying to find out if we change the startup check, if the console
still works.

Bruce

>
> Regards,
> Sathees
>
> =EF=BB=BFOn 08/04/2019, 04:12, "Bruce Ashfield" <bruce.ashfield@gmail.com=
> wrote:
>
>     On Thu, Apr 4, 2019 at 4:11 PM Filipe Rinaldi <Filipe.Rinaldi@arm.com=
> wrote:
>     >
>     > Hi,
>     >
>     >
>     > With regards commit "50cdecc sysvinit-inittab_xen.inc: fix hypervis=
or console"...
>     >
>     >
>     > We are having issues with this patch. When using start_getty (a wra=
pper to getty) it will first check if the console device is a "serial" devi=
ce driver [1]. It then fails because hvc0 is a "system" device, not a "seri=
al" [2].
>     >
>     >
>     > [1] https://github.com/openembedded/openembedded-core/blob/master/m=
eta/recipes-core/sysvinit/sysvinit-inittab/start_getty#L11
>     >
>     > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/tree/drivers/tty/hvc/hvc_console.c#n1036
>     >
>     >
>     > Any thoughts?
>
>     Can you confirm that if that check is removed that the console still
>     functions as expected ?
>
>     Rather than bouncing back and forth between fixing one issue, and
>     creating another, I'm tempted to just bbappend and patch the
>     problematic check out of the startup. But I'm not currently setup to
>     test the issue.
>
>     Bruce
>
>     >
>     >
>     > Cheers,
>     >
>     > Filipe
>     >
>     >
>     > IMPORTANT NOTICE: The contents of this email and any attachments ar=
e confidential and may also be privileged. If you are not the intended reci=
pient, please notify the sender immediately and do not disclose the content=
s to any other person, use it for any purpose, or store or copy the informa=
tion in any medium. Thank you.
>     > --
>     > _______________________________________________
>     > meta-virtualization mailing list
>     > meta-virtualization@yoctoproject.org
>     > https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>     --
>     - Thou shalt not follow the NULL pointer, for chaos and madness await
>     thee at its end
>     - "Use the force Harry" - Gandalf, Star Trek II
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

