Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1F446E00C43; Wed,  6 Feb 2019 13:01:55 -0800 (PST)
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
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.172 listed in list.dnswl.org]
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C6ADE00BFB
	for <meta-virtualization@yoctoproject.org>;
	Wed,  6 Feb 2019 13:01:53 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id j13-v6so1105255ljc.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 06 Feb 2019 13:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=UZ6l5ZWOsNSZYEIhMtx8+mIQqVjl138T9Wo17BKEino=;
	b=t3+F3/RgPdqlP8fET6A1k8aj468c0lpJRStOtEssEzqriQCYgVOooFTpBQbvoWoX0+
	P2Hjh784RSLdViaXS8vjwEmVA+AWtpesHdyTt07GeoIFAnkyEUQWGmfXFfvDysPPLyd1
	CdNILDrkAuvDN8P8vCdE2otZqyEyMSiYtRWBWntp9uJ76oGettpnQwGOnCTbt7h1QBzY
	7lKJ8N72TB8sanvfGdp+nE9/ToGWVSz49W2wdVzNPZ0Ymu1u8lBr1PYG2+THluBGZ596
	shuAPjChdb3QOUjSde0HpcO5wwojbhUO/sRgWOGz7KGU+8+2SF6RSzCG8WNhQkaWtnLf
	P5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=UZ6l5ZWOsNSZYEIhMtx8+mIQqVjl138T9Wo17BKEino=;
	b=c9X809BypmSEOCB/N9owq7fFLmfR+KxRp6GIO45n6lCOLXRZ03A2Fq8PyCsyNwWOgT
	t00Qmf24CbpYLJEWtPGKFUym+U/cOTb4daBY2p+m7W4GeBI+RvEAbF0HryayIVVrRm68
	uxG/BVAfBtuYY9q4nDH8Gh8tHFEUGLNkqAiUONOgwLSKyPPJd0KhbqcsYDXm7M5Eb90E
	y3U11GpTInqgW7KXMO69gx3u1l/MXh1XuBnn1zD4QMPZrglsvj7Qn7D8rtizDOLbVGKs
	3oAwRD5lHgyEfmPI0lpUTX5vKvrN0akXk89GdHorA24MsUa3wcuNpT5nImDN18/WU3XZ
	DA4A==
X-Gm-Message-State: AHQUAuYxkX9+UHOBzFu7VqTmBWmRoS5f0KkSd+jeg0kv5i7RELpWNtpp
	aaFRN7LSDW6W6voQnwNK1K1hUgYeAARuW+P2hps=
X-Google-Smtp-Source: AHgI3IYyjkFdm+bzEmP+3zLRu22G8NikxuPKDW9s4ow/Y5N2/XL/9Sa/CklkWVvSdgmmKXL3zn1XumTYhrdQA7Z0cPE=
X-Received: by 2002:a2e:9603:: with SMTP id v3-v6mr7694478ljh.15.1549486912859;
	Wed, 06 Feb 2019 13:01:52 -0800 (PST)
MIME-Version: 1.0
References: <2a468100b7c94734bcb79d6ddb55c141@luxoft.com>
In-Reply-To: <2a468100b7c94734bcb79d6ddb55c141@luxoft.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 6 Feb 2019 16:01:41 -0500
Message-ID: <CADkTA4MDqmmeko0DmpZ1D3qeJUWMue2BJGY4Txyf3zCofmXV8g@mail.gmail.com>
To: "Nordqvist, Therese" <TNordqvist@luxoft.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: LXC 3.1 in thud?
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
X-List-Received-Date: Wed, 06 Feb 2019 21:01:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 5, 2019 at 10:22 AM Nordqvist, Therese
<TNordqvist@luxoft.com> wrote:
>
> Hello,
>
>
> I'm working in a project which uses meta-virtualization (http://pelux.io)=
, do you know if there are any plans to include the LXC bump to 3.1.0 in th=
e thud branch?

There currently aren't any plans to do a version bump in Thud. We tend
to leave the versions as-is in the maintained branches.
It looks like thud is missing the 3.0.3 and 3.1.x bumps that we have
in master, so there are at least two patches missing.

That being said, the missing version bumps are relatively minor and
are bug fixes/small changes to the project.

What feature are you looking for in particular ? Can you summarize the
changes between the versions and send
it to the list ? That way everyone can see the requested change to the
released branch and object if they think
there will be impacts.

Cheers,

Bruce

>
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=
=3D2387a8876e4aaa52143a623ae5000cf064e55a64
>
>
> If you are interesting in our github repo: https://github.com/Pelagicore/=
pelux-manifests
>
>
> Best regards,
> Therese Nordqvist
> Software Engineer
>
> Luxoft Sweden AB
> =C3=96stra Hamngatan 16
> 411 09 Gothenburg
> Sweden
>
> M: +46 732 332464
> E: TNordqvist@luxoft.com
>
> luxoft.com
>
> Registered Office Gothenburg, Sweden
> Registration No. 556780-4199
>
> ________________________________
>
> This e-mail and any attachment(s) are intended only for the recipient(s) =
named above and others who have been specifically authorized to receive the=
m. They may contain confidential information. If you are not the intended r=
ecipient, please do not read this email or its attachment(s). Furthermore, =
you are hereby notified that any dissemination, distribution or copying of =
this e-mail and any attachment(s) is strictly prohibited. If you have recei=
ved this e-mail in error, please immediately notify the sender by replying =
to this e-mail and then delete this e-mail and any attachment(s) or copies =
thereof from your system. Thank you.
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

