Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B491E00E8E; Mon, 13 Jun 2016 08:47:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C95BDE00E88
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Jun 2016 08:47:06 -0700 (PDT)
Received: by mail-oi0-f42.google.com with SMTP id d132so110035724oig.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Jun 2016 08:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nZMEibGshtqbL2Y2gqYwWRhdudTHY73b1Q9RXeQFmQA=;
	b=oCcI/wW9qmx4QP3HRudBnI8oZ93m8188bSL6q/puo20IJIOfvid2wIBQmgK0Lad6eu
	T7fz/t5V388lMY88ehk+lB+pIj8M9AUEhAkEmAV+G2Oozhza5IsdlWSy9sapVzNoCoqv
	YbjUvZL6ESILn+BErtd4ZRenqBVb2X0YUn3tFSACXayVBjbr2pBIV9qZ09naGjt1NYGq
	5Rv81V5O0z8KCgjdAl0oMxvW+Izb1nkpZb55fehHfBkfYKB3TTRSGWSm9al/cE6p7xXn
	2RV4wasuHZTP6Wz6BoAGMZYWnlJFAmj2W2+Ialb6dLGPkO0OVck/TGCchfTIrudt8VrZ
	tj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nZMEibGshtqbL2Y2gqYwWRhdudTHY73b1Q9RXeQFmQA=;
	b=fRldOvzNQ4qx5xNnMpjS8PNF1wDEzEmF2cNL5fewjpW84GayWCRGs2OdvPnjn4pddf
	c6dbUgbHarKDy38KskV5499/CmuIMmBJmL/xh+rOmjAOkfKExrc6NRJU5aVm6oDDSL2p
	ZNqovS07dM770VpgLh3QnEdSp1rvKLrxeogkKgf0b+Ei2iSd6ycRSUSwPQUQUJfmR/A/
	ZHaVONk1BHLUSTZqmeyXw9wXz14RUGOOCkR+4Q/Q1e2LRnKbPycwS1z524+a0I8uQo1u
	z38Wq5ju1+Y53595ZvokkpDOxjPme0KbgRYJ+c4CVK32l0dNghW+a/QtUWQwGW7y/FG2
	+1sg==
X-Gm-Message-State: ALyK8tLEXbxbfnktR+ZD3k04yb6U2t/3knbqSpxf7K8O/M0amiTYH1fJj0m46yIIoCkyukx12NobSdGI9u4n3A==
X-Received: by 10.202.173.13 with SMTP id w13mr6594306oie.116.1465832825580;
	Mon, 13 Jun 2016 08:47:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.33.117 with HTTP; Mon, 13 Jun 2016 08:47:04 -0700 (PDT)
In-Reply-To: <CAAPZna372EhYt_3xzb_4HZTJo00Mk25FyL_pkUkKySYvvdk17g@mail.gmail.com>
References: <CAAPZna21uUF=ZgfWdd5B2aKjmoox0QnCzEz=LDC7=Grx8J4CnA@mail.gmail.com>
	<CADkTA4MRfu2eFEhzeiqWUxoX4dubUqXn-_QQoCPPQLdnAd-e5Q@mail.gmail.com>
	<CAAPZna0tO+C2r66YyfV2YNqM6468V6fNOzu=YH_htoY_6AdXQg@mail.gmail.com>
	<CADkTA4PgXwQwffnXCTxzy9++px_Tc4JdoN9vU74K6HN_Ds6=RQ@mail.gmail.com>
	<CAAPZna372EhYt_3xzb_4HZTJo00Mk25FyL_pkUkKySYvvdk17g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 13 Jun 2016 11:47:04 -0400
Message-ID: <CADkTA4PC2QHp1FXCvMjJ6LA5U8VF-XaYYDtMt3XezdQi5DGPEg@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [krogoth] Golang errors when building Docker
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
X-List-Received-Date: Mon, 13 Jun 2016 15:47:07 -0000
Content-Type: multipart/alternative; boundary=001a113ceccede756d05352acc67

--001a113ceccede756d05352acc67
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 10, 2016 at 2:40 PM, Fabio Berton <fabio.berton@ossystems.com.br
> wrote:

> I'm working with Krogoth and cherry-picked commits from master:
>
> 677f359 go-cross: allow tmp directory to already exist
> 3a45dc4 go-native: don't use host /var/tmp for temp build artifacts
> f17e1ed go-cross: don't use host /var/tmp for temporary build artifacts
> fb7349e go: add go-cross 1.6
> d687655 docker: drop obselete dependencies
>
> It works fine and I don't get any errors. I think this commits should be
> backported to Krogroth.
>

Thanks for the report.

I've queued the changes here, and will confirm the results myself. Once
that is done,
I'll push to the repo.

Bruce




-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113ceccede756d05352acc67
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Jun 10, 2016 at 2:40 PM, Fabio Berton <span dir=3D"ltr">&lt;<a =
href=3D"mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.berto=
n@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div dir=3D"ltr"><div style=3D"font-family:monospace,monospace;font-size:sm=
all">I&#39;m working with Krogoth and cherry-picked commits from master:<br=
><br>677f359 go-cross: allow tmp directory to already exist<br>3a45dc4 go-n=
ative: don&#39;t use host /var/tmp for temp build artifacts<br>f17e1ed go-c=
ross: don&#39;t use host /var/tmp for temporary build artifacts<br>fb7349e =
go: add go-cross 1.6<br>d687655 docker: drop obselete dependencies<br><br><=
/div><div style=3D"font-family:monospace,monospace;font-size:small">It work=
s fine and I don&#39;t get any errors. I think this commits should be backp=
orted to Krogroth.<br></div></div></blockquote><div><br></div><div>Thanks f=
or the report.<br><br></div><div>I&#39;ve queued the changes here, and will=
 confirm the results myself. Once that is done,<br></div><div>I&#39;ll push=
 to the repo.<br><br></div><div>Bruce<br></div><div>=C2=A0</div></div><br><=
br clear=3D"all"><br>-- <br><div class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a113ceccede756d05352acc67--
