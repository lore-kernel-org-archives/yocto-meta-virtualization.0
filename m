Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7ABD4E00D89; Tue, 30 Jul 2019 19:04:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.66 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2480E00BEB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Jul 2019 19:04:01 -0700 (PDT)
Received: by mail-lf1-f66.google.com with SMTP id u10so7437214lfm.12
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Jul 2019 19:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CWwghkV9j0Fj9ji5JfLH8/modjGaDh4sOcSK9pldfeY=;
	b=NJxn+70pTn4Zs0okSVwdb5mP7xgKm8TxNr/RNDik9LO0ANocPpRmWD09yANDYlJrED
	UZkermGp07EXFimEjgZcrhzztkwRI75RDgQ09vfQhMF54hq5EszpvtnFPWC9oKisFATX
	VIwp7Pz65n8MDvpqk+cAFiTL+xlzxyscUlsSIspylUBXCwN8YvPI8HLRPyeZZKb6NcMf
	UdmrutfPN4HdfPOZbmougyjwCGwvNz9TlPANL8Rfd7OK4OydQPPUPucw9Cu8C2XPWNPy
	zOqxwFaTfvYcDar9W9QcGyLrNEvtHkQ+n1aFhdEJVKi55BwwDMRPCMoIqVckNHABkQn0
	0wKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CWwghkV9j0Fj9ji5JfLH8/modjGaDh4sOcSK9pldfeY=;
	b=CJ4pB/gqYEPqheKVYBYvhpse+AaUkIAlqGyvXGFZ+3yBotWFux/pEMi/csrEP+FQzM
	IqSKBN2d3lSMJ2HBbNIom+1glJqcL1L7q1NWkT6JC/tlAte56d4NTH6Gj+NAmQS7jM8M
	iuWZqfx1iCilg3eKokql34pTMeb95XTapNWAwn8fCAGUy4BcUNJgUHySDVm4uIxlQeVb
	PY0GjP6Oj8HmqpeXH+XisDD9+9cHetkSkTtkh/EB/s8kMeUgmfWjNfDKn1AqPWYEEa7A
	p3LS5+5Ejm056RDoO4VnE7ehqtsRI3dYIZ17WlBB8cj2rKinktBQjusAKprs+61gAc7v
	N1Vw==
X-Gm-Message-State: APjAAAX4Js6FEgnLl3PJk/BnXghc32XpqgfcDFYg0Oyu++ZaVVsv6oVv
	QiDlmIz+JQeOgES77ovub7fges2SkbmcJdpgF8Y=
X-Google-Smtp-Source: APXvYqx+duzLs77oXGJP+7k5SjM+VVc2WxZdsXHNPHIro/8i+HUrITKuZM8wk7ffV8E+J6RTzjQAO8yhx1VPIk0kF48=
X-Received: by 2002:a19:f24e:: with SMTP id d14mr1727028lfk.184.1564538640413; 
	Tue, 30 Jul 2019 19:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAGayzYvR7CFPAdR604XndLVstcKTHDMHrDLoKzhC7QtLY5ZwDw@mail.gmail.com>
In-Reply-To: <CAGayzYvR7CFPAdR604XndLVstcKTHDMHrDLoKzhC7QtLY5ZwDw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 30 Jul 2019 22:03:52 -0400
Message-ID: <CADkTA4MZfMG3WJn4MzU0po6d5YO2TE-5=JJq2uMAiwqkiZjv0Q@mail.gmail.com>
To: Anoop Karollil <anoop.karollil@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Exclusion of devicemapper and btrfs graph drivers in docker_git.bb
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
X-List-Received-Date: Wed, 31 Jul 2019 02:04:02 -0000
Content-Type: multipart/alternative; boundary="000000000000e6363c058ef08991"

--000000000000e6363c058ef08991
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 30, 2019 at 8:32 PM Anoop Karollil <anoop.karollil@gmail.com>
wrote:

> Hello,
>
> I am trying to build docker with btrfs support. I could override
> BUILDTAGS for containerd-opencontainers_git.bb using EXTRA_OEMAKE in a
> bbappend to remove the `no_btrfs` build tag (see
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-containers/containerd/containerd.inc#n64
> ).
> But I do not know how to easily do the same for the
> `exclude_graphdriver_btrfs` in docker_git.bb
> (
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-containers/docker/docker_git.bb#n95
> ),
> because dockerd gets compiled using `hack/make.sh` rather than via
> oe_runmake. I can override the whole of do_compile in a .bbappend just
> to strip the build tags, but that isn't very clean.
>
> The docker package compiles fine when the exclusions for btrfs and
> devicemapper are removed, so I am assuming whatever problem the
> exclusion was trying to fix is gone. Could the exclusion build tags be
> removed from the do_compile? If not, could the recipe declare a
> BUILDTAGS = xxxx and use it for DOCKER_BUILDTAGS in the do_compile so
> that a bbappend can override BUILDTAGS? I have attached a patch for
> this approach. Not sure if there is an easy way to do this for the
> recipe in its current state.
>

The patch looks fine to me. It is the minimal footprint change to allow
layers to override the default configuration.

I've queued it here and will merge it shortly.

Bruce



>
> Thanks,
> Anoop
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000e6363c058ef08991
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jul 30, 2019 at 8:32 PM Anoop Karollil &lt;=
<a href=3D"mailto:anoop.karollil@gmail.com">anoop.karollil@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<=
br>
<br>
I am trying to build docker with btrfs support. I could override<br>
BUILDTAGS for <a href=3D"http://containerd-opencontainers_git.bb" rel=3D"no=
referrer" target=3D"_blank">containerd-opencontainers_git.bb</a> using EXTR=
A_OEMAKE in a<br>
bbappend to remove the `no_btrfs` build tag (see<br>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tr=
ee/recipes-containers/containerd/containerd.inc#n64" rel=3D"noreferrer" tar=
get=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualizatio=
n/tree/recipes-containers/containerd/containerd.inc#n64</a>).<br>
But I do not know how to easily do the same for the<br>
`exclude_graphdriver_btrfs` in <a href=3D"http://docker_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">docker_git.bb</a><br>
(<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/t=
ree/recipes-containers/docker/docker_git.bb#n95" rel=3D"noreferrer" target=
=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/t=
ree/recipes-containers/docker/docker_git.bb#n95</a>),<br>
because dockerd gets compiled using `hack/make.sh` rather than via<br>
oe_runmake. I can override the whole of do_compile in a .bbappend just<br>
to strip the build tags, but that isn&#39;t very clean.<br>
<br>
The docker package compiles fine when the exclusions for btrfs and<br>
devicemapper are removed, so I am assuming whatever problem the<br>
exclusion was trying to fix is gone. Could the exclusion build tags be<br>
removed from the do_compile? If not, could the recipe declare a<br>
BUILDTAGS =3D xxxx and use it for DOCKER_BUILDTAGS in the do_compile so<br>
that a bbappend can override BUILDTAGS? I have attached a patch for<br>
this approach. Not sure if there is an easy way to do this for the<br>
recipe in its current state.<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">The patch looks fine to me. It=
 is the minimal footprint change to allow layers to override the default co=
nfiguration.</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;ve que=
ued it here and will merge it shortly.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
Thanks,<br>
Anoop<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000e6363c058ef08991--
